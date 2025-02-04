import 'dart:typed_data';
import 'package:daepiro/presentation/community/controller/community_town_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../../../cmm/DaepiroTheme.dart';
import '../../../../data/model/response/community/community_dongnae_content_detail_response.dart';
import '../../../../data/model/selected_image.dart';

class CommunityTownWritingScreen extends ConsumerStatefulWidget {
  final bool isEdit;
  final ContentDetail? contentDetail;
  const CommunityTownWritingScreen({super.key, required this.isEdit, this.contentDetail});

  @override
  CommunityTownWritingState createState() => CommunityTownWritingState();
}

//동네생활 글쓰기 화면
class CommunityTownWritingState extends ConsumerState<CommunityTownWritingScreen> {
  bool isCompleteEnabled = false;
  bool isWritingContainerPress = false;
  final TextEditingController titleTextController = TextEditingController();
  final TextEditingController contentTextController = TextEditingController();

  @override
  void initState() {
    super.initState();
    titleTextController.addListener(_updateCompleteButtonState);
    contentTextController.addListener(_updateCompleteButtonState);
    if(widget.isEdit) {
      titleTextController.text = widget.contentDetail?.title ?? '';
      contentTextController.text = widget.contentDetail?.body ?? '';
      //selectedImage 기본값을 세팅해야함
      WidgetsBinding.instance.addPostFrameCallback((_) {
       ref.read(communityTownProvider.notifier).convertFileToAssetEntity();
       ref.read(communityTownProvider.notifier).setCategoryState(ContentCategory.getByValue(widget.contentDetail!.category));
      });
    }
  }

  void _updateCompleteButtonState() {
    // 제목과 내용이 비어있지 않은지 확인
    final isTitleNotEmpty = titleTextController.text.isNotEmpty;
    final isContentNotEmpty = contentTextController.text.isNotEmpty;

    // 버튼 상태 변경
    if (isCompleteEnabled != (isTitleNotEmpty && isContentNotEmpty)) {
      setState(() {
        isCompleteEnabled = isTitleNotEmpty && isContentNotEmpty;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(communityTownProvider);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              headerWidget(context),
              SizedBox(height: 12),
              Expanded(
                  child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    writingTypeWidget(state.writingTownCategory),
                    SizedBox(
                      height: 20,
                    ),
                    titleTextField(titleTextController),
                    SizedBox(
                      height: 16,
                    ),
                    contentTextField(contentTextController),
                    SizedBox(
                      height: 20,
                    ),
                    photoWidget(state.selectedImages),
                    SizedBox(height: 20)
                  ],
                ),
              )),
              locationCheckWidget(state.isVisible),
              SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  Widget headerWidget(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 16),
        child: Row(
          children: [
            GestureDetector(
              onTap: () {
                ref.read(communityTownProvider.notifier).clearWritingState();
                ref.read(communityTownProvider.notifier).setImageFromGallery([]);
                GoRouter.of(context).pop();
              },
              child: SvgPicture.asset('assets/icons/icon_arrow_left.svg',
                  width: 24,
                  height: 24,
                  colorFilter: ColorFilter.mode(
                      DaepiroColorStyle.g_900, BlendMode.srcIn)),
            ),
            Expanded(
              child: Text(
                '글쓰기',
                textAlign: TextAlign.center,
                style: DaepiroTextStyle.h6
                    .copyWith(color: DaepiroColorStyle.g_800),
              ),
            ),
            GestureDetector(
                onTap: () async {
                  if(isCompleteEnabled && !widget.isEdit) {
                    final isSuccess = await ref.read(communityTownProvider.notifier).setArticle(titleTextController.text, contentTextController.text);
                    GoRouter.of(context).pop();
                    showSnackbar(context, isSuccess);
                    ref.read(communityTownProvider.notifier).setImageFromGallery([]);
                    ref.read(communityTownProvider.notifier).clearWritingState();
                    await ref.read(communityTownProvider.notifier).loadContent();
                  }
                  if(widget.isEdit) {
                    //게시글 수정 api 호출
                    final isSuccess = await ref.read(communityTownProvider.notifier).editArticle(titleTextController.text, contentTextController.text);
                    GoRouter.of(context).pop();
                    showSnackbar(context, isSuccess);
                    ref.read(communityTownProvider.notifier).setImageFromGallery([]);
                    ref.read(communityTownProvider.notifier).clearWritingState();
                    await ref
                        .read(communityTownProvider.notifier)
                        .getContentDetail(widget.contentDetail!.id);
                  }
                },
                child: Text(
                  '완료',
                  style: DaepiroTextStyle.body_1_m.copyWith(
                      color: isCompleteEnabled || widget.isEdit
                          ? DaepiroColorStyle.o_500
                          : DaepiroColorStyle.g_100),
                )),
          ],
        ),
      ),
    );
  }

  Widget writingTypeWidget(String writingTownCategory) {
    //일상, 교통 등등이 매개변수
    return InkWell(
      onTap: () {
        showCategoryBottomSheet(context, isWritingContainerPress);
        setState(() {
          isWritingContainerPress = true;
        });
      },
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            color: DaepiroColorStyle.g_50,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
                width: 1.5,
                color: isWritingContainerPress
                    ? DaepiroColorStyle.g_75
                    : DaepiroColorStyle.g_50)),
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Row(
            children: [
              writingTownCategory == ''
                  ? Text(
                      '게시글 주제를 선택해주세요.',
                      style: DaepiroTextStyle.body_1_m
                          .copyWith(color: DaepiroColorStyle.g_300),
                    )
                  : Text(
                writingTownCategory,
                      style: DaepiroTextStyle.body_1_m
                          .copyWith(color: DaepiroColorStyle.g_900),
                    ),
              Spacer(),
              SvgPicture.asset('assets/icons/icon_arrow_down.svg',
                  colorFilter: ColorFilter.mode(
                      DaepiroColorStyle.g_900, BlendMode.srcIn)),
            ],
          ),
        ),
      ),
    );
  }

  Widget titleTextField(TextEditingController controller) {
    return Container(
      width: double.infinity,
      child: TextField(
        controller: controller,
        maxLength: 38,
        cursorColor: DaepiroColorStyle.g_900,
        onTapOutside: (event) => FocusManager.instance.primaryFocus?.unfocus(),
        style: DaepiroTextStyle.h6.copyWith(color: DaepiroColorStyle.g_900),
        decoration: InputDecoration(
          counterText: '',
          isDense: true,
          hintText: '제목을 입력하세요.',
          hintStyle:
              DaepiroTextStyle.h6.copyWith(color: DaepiroColorStyle.g_75),
          contentPadding: const EdgeInsets.fromLTRB(0, 0, 0, 16),
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: DaepiroColorStyle.g_75)),
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: DaepiroColorStyle.g_75)),
          border: UnderlineInputBorder(
              borderSide: BorderSide(color: DaepiroColorStyle.g_75)),
        ),
      ),
    );
  }

  Widget contentTextField(TextEditingController controller) {
    return Container(
      width: double.infinity,
      height: 343,
      child: TextField(
        controller: controller,
        maxLength: 38,
        cursorColor: DaepiroColorStyle.g_900,
        onTapOutside: (event) => FocusManager.instance.primaryFocus?.unfocus(),
        style:
            DaepiroTextStyle.body_2_m.copyWith(color: DaepiroColorStyle.g_900),
        decoration: InputDecoration(
          counterText: '',
          isDense: true,
          hintText: '동네생활과 관련된 이야기를 주민들과 나누세요.',
          hintStyle: DaepiroTextStyle.body_2_m
              .copyWith(color: DaepiroColorStyle.g_200),
          contentPadding: const EdgeInsets.fromLTRB(0, 0, 0, 16),
          enabledBorder: const OutlineInputBorder(borderSide: BorderSide.none),
          focusedBorder: const OutlineInputBorder(borderSide: BorderSide.none),
          border: const OutlineInputBorder(borderSide: BorderSide.none),
        ),
      ),
    );
  }

  Widget photoWidget(List<SelectedImage>? selectedImages) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '사진/동영상',
          style: DaepiroTextStyle.body_1_m.copyWith(
            color: DaepiroColorStyle.g_900,
          ),
        ),
        Row(
          children: [
            GestureDetector(
              onTap: () async {
                var status = await Permission.photos.request();
                if (status.isGranted || status == PermissionStatus.limited) {
                  GoRouter.of(context).push(
                      '/community_town_writing_album',
                    extra: selectedImages
                  );
                } else {
                  await openAppSettings();
                }
              },
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0,8,8,0),
                child: Container(
                  width: 118,
                  height: 118,
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1.5,
                      color: DaepiroColorStyle.g_75,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: SvgPicture.asset(
                      'assets/icons/icon_photo.svg',
                      width: 34,
                      height: 34,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(width: 8),
            if (selectedImages!.isNotEmpty)
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: selectedImages.map((image) {
                      return Padding(
                        padding: const EdgeInsets.fromLTRB(0,8,8,0),
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Container(
                                width: 118,
                                height: 118,
                                child: image.entity != null ? FutureBuilder<Uint8List?> (
                                  future: image.entity!.thumbnailData,
                                  builder: (context, snapshot) {
                                    if(snapshot.connectionState == ConnectionState.done && snapshot.data != null) {
                                      return ClipRRect(
                                        borderRadius: BorderRadius.circular(8),
                                        child: Image.memory(
                                          snapshot.data!,
                                          fit: BoxFit.cover,
                                        ),
                                      );
                                    }
                                    return Center(
                                      child: CircularProgressIndicator(),
                                    );
                                  },
                                ) : Container()
                            ),
                            Positioned(
                                top: -4,
                                right: -4,
                                child: GestureDetector(
                                  onTap: () => ref.read(communityTownProvider.notifier).removeImageFromGallery(image, widget.isEdit),
                                  child: Container(
                                    width: 24,
                                    height: 24,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: DaepiroColorStyle.white,
                                      boxShadow: [BoxShadow(
                                        color: Colors.black.withOpacity(0.6),
                                        blurRadius: 4.0,
                                        spreadRadius: 0.0,
                                        offset: const Offset(0, 0)
                                      )]
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(6.0),
                                      child: SvgPicture.asset(
                                        width: 12,
                                          height: 12,
                                          'assets/icons/icon_close.svg',
                                          colorFilter:
                                          ColorFilter.mode(DaepiroColorStyle.g_900, BlendMode.srcIn)),
                                    ),
                                  ),
                                )
                            )
                          ],
                        )
                      );
                    }).toList(),
                  ),
                ),
              ),
            // if (widget.isEdit && widget.contentDetail?.files.length !=0)
            //   Expanded(
            //     child: SingleChildScrollView(
            //       scrollDirection: Axis.horizontal,
            //       child: Row(
            //         children: files!.map((image) {
            //           return Padding(
            //               padding: const EdgeInsets.fromLTRB(0,8,8,0),
            //               child: Stack(
            //                 clipBehavior: Clip.none,
            //                 children: [
            //                   Container(
            //                       width: 118,
            //                       height: 118,
            //                       child: ClipRRect(
            //                         borderRadius: BorderRadius.circular(8),
            //                         child: Image.network(
            //                           image,
            //                           fit: BoxFit.cover,
            //                         ),
            //                       )
            //                   ),
            //                   Positioned(
            //                       top: -4,
            //                       right: -4,
            //                       child: GestureDetector(
            //                         onTap: () {},
            //                         child: Container(
            //                           width: 24,
            //                           height: 24,
            //                           decoration: BoxDecoration(
            //                               shape: BoxShape.circle,
            //                               color: DaepiroColorStyle.white,
            //                               boxShadow: [BoxShadow(
            //                                   color: Colors.black.withOpacity(0.6),
            //                                   blurRadius: 4.0,
            //                                   spreadRadius: 0.0,
            //                                   offset: const Offset(0, 0)
            //                               )]
            //                           ),
            //                           child: Padding(
            //                             padding: const EdgeInsets.all(6.0),
            //                             child: SvgPicture.asset(
            //                                 width: 12,
            //                                 height: 12,
            //                                 'assets/icons/icon_close.svg',
            //                                 colorFilter:
            //                                 ColorFilter.mode(DaepiroColorStyle.g_900, BlendMode.srcIn)),
            //                           ),
            //                         ),
            //                       )
            //                   )
            //                 ],
            //               )
            //           );
            //         }).toList(),
            //       ),
            //     ),
            //   ),
          ],
        ),
      ],
    );
  }


  Widget locationCheckWidget(bool isVisible) {
    return ElevatedButton(
      onPressed: () async {
        await ref.read(communityTownProvider.notifier).setVisibleState();
      },
      style: ElevatedButton.styleFrom(
          backgroundColor: DaepiroColorStyle.g_50,
          padding: EdgeInsets.symmetric(vertical: 12),
          overlayColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
          shadowColor: Colors.transparent,
          elevation: 0.0),
      child: Row(
        children: [
          SizedBox(
            width: 12,
          ),
          Checkbox(
              visualDensity: VisualDensity.compact,
              side: BorderSide(color: Colors.transparent),
              activeColor: DaepiroColorStyle.g_500,
              checkColor: DaepiroColorStyle.white,
              fillColor: MaterialStateProperty.resolveWith((state) {
                if (!state.contains(MaterialState.selected)) {
                  return DaepiroColorStyle.g_100;
                }
                return null;
              }),
              value: isVisible,
              onChanged: (value) async {
                await ref
                    .read(communityTownProvider.notifier)
                    .setVisibleState();
              }),
          SizedBox(width: 8),
          Text(
            '현위치를 표시하겠어요?',
            style: DaepiroTextStyle.body_1_m
                .copyWith(color: DaepiroColorStyle.g_800),
          )
        ],
      ),
    );
  }

  //카테고리 선택 바텀시트
  void showCategoryBottomSheet(
      BuildContext context, bool isWritingContainerPress) {
    showModalBottomSheet(
        context: context,
        useRootNavigator: true,
        builder: (context) {
          return Wrap(
            children: [
              Container(
                child: categoryItemWidget(isWritingContainerPress)
              ),
            ],
          );
        },
        isScrollControlled: true);
  }

  //바텀시트 내부 위젯
  Widget categoryItemWidget(bool isWritingContainerPress) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(30),
            topLeft: Radius.circular(30),
          )),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          bottomSheetheaderWidget(),
          GestureDetector(
              onTap: () {
                print('이거눌림');
                setState(() {
                  isWritingContainerPress = false;
                });
              },
              child: categoryListItem('일상')),
          GestureDetector(
              onTap: () {
                setState(() {
                  isWritingContainerPress = false;
                });
              },
              child: categoryListItem('교통')),
          GestureDetector(
              onTap: () {
                setState(() {
                  isWritingContainerPress = false;
                });
              },
              child: categoryListItem('치안')),
          GestureDetector(
              onTap: () {
                setState(() {
                  isWritingContainerPress = false;
                });
              },
              child: categoryListItem('기타')),
        ],
      ),
    );
  }

  //바텀시트 내부 헤더
  Widget bottomSheetheaderWidget() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Container(
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(width: 16),
                Opacity(
                  opacity: 0.0,
                  child: SvgPicture.asset(
                    'assets/icons/icon_close.svg',
                    width: 24,
                    height: 24,
                  ),
                ),
                Expanded(
                  child: Text(
                    '게시글 주제',
                    textAlign: TextAlign.center,
                    style: DaepiroTextStyle.body_1_b
                        .copyWith(color: DaepiroColorStyle.g_900),
                  ),
                ),
                GestureDetector(
                  onTap: () => GoRouter.of(context).pop(),
                  child: SvgPicture.asset('assets/icons/icon_close.svg',
                      width: 24,
                      height: 24,
                      colorFilter: ColorFilter.mode(
                          DaepiroColorStyle.g_900, BlendMode.srcIn)),
                ),
                SizedBox(width: 16),
              ],
            ),
            SizedBox(height: 16),
            Container(
              decoration: BoxDecoration(color: DaepiroColorStyle.g_50),
              width: double.infinity,
              height: 1,
            )
          ],
        ),
      ),
    );
  }

  Widget categoryListItem(String category) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: DaepiroColorStyle.white,
          overlayColor: DaepiroColorStyle.g_50,
          minimumSize: Size.zero,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        onPressed: () {
          ref.read(communityTownProvider.notifier).setCategoryState(category);
          setState(() {
            isWritingContainerPress = !isWritingContainerPress;
          });
          GoRouter.of(context).pop();
        },
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 16),
          child: Row(
            children: [
              Text(
                category,
                textAlign: TextAlign.start,
                style: DaepiroTextStyle.body_1_m
                    .copyWith(color: DaepiroColorStyle.g_900),
              ),
            ],
          )
        ),
      ),
    );
  }

//오류 다이얼로그
  void remindDialog(BuildContext context, String text) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.white,
            titlePadding: EdgeInsets.fromLTRB(20, 24, 20, 4),
            title: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(
                    'assets/icons/icon_warning',
                    colorFilter: ColorFilter.mode(
                        DaepiroColorStyle.r_200, BlendMode.srcIn)),
              ],
            ),
            contentPadding: EdgeInsets.fromLTRB(20, 4, 20, 24),
            content: Container(
              width: MediaQuery.of(context).size.width * 0.8,
              child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      textAlign: TextAlign.center,
                      text,
                      style: DaepiroTextStyle.body_1_b
                          .copyWith(color: DaepiroColorStyle.g_900),
                    ),
                  ]),
            ),
          );
        });
  }

  void showSnackbar(BuildContext context, bool isSuccess) {
    final overlay = Overlay.of(context);
    late OverlayEntry overlayEntry;
    overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        bottom: 50.0,
        left: 20.0,
        right: 20.0,
        child: Material(
          elevation: 8.0,
          borderRadius: BorderRadius.circular(8),
          color: Colors.black.withOpacity(0.6),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    isSuccess ? '게시글 작성이 완료되었습니다.' : '다시 시도해주세요.',
                    style: DaepiroTextStyle.body_2_m
                        .copyWith(color: DaepiroColorStyle.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
    overlay.insert(overlayEntry);
    Future.delayed(const Duration(seconds: 5), () {
      if (overlayEntry.mounted) {
        overlayEntry.remove();
      }
    });
  }
}
