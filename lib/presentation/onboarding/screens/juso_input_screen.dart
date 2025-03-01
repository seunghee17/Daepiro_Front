import 'package:daepiro/presentation/mypage/controller/mypage_viewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import '../../../cmm/DaepiroTheme.dart';
import '../../../cmm/button/secondary_filled_button.dart';
import '../controller/onboarding_view_model.dart';

class JusoInputScreen extends ConsumerStatefulWidget {
  final String? type;
  final String? index;
  final String? userName;
  final bool fromMyPage;

  const JusoInputScreen({super.key, this.type, this.index, this.userName, required this.fromMyPage});

  @override
  JusoInputState createState() => JusoInputState();
}

class JusoInputState extends ConsumerState<JusoInputScreen> {
  final TextEditingController jusoController = new TextEditingController();
  final ScrollController scrollController = ScrollController();
  final FocusNode focusNode = FocusNode();
  Set<int> selected = Set();
  int currentPage = 1;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    Future(() {
      ref.read(onboardingStateNotifierProvider.notifier).initSearchHistory();
      ref.read(myPageProvider.notifier).initSearchHistory();
    });
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent && !isLoading) {
        loadMoreJuso();
      }
    });
  }

  Future<void> loadMoreJuso() async {
    if (!isLoading) {
      setState(() {
        isLoading = true;
        currentPage++;
      });
      if(widget.fromMyPage) {
        await ref.read(myPageProvider.notifier).getJusoList(
            jusoController.text,
            currentPage,
            true);
      } else {
        await ref.read(onboardingStateNotifierProvider.notifier).getJusoList(
            jusoController.text,
            currentPage,
            true
        );
      }
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(onboardingStateNotifierProvider);
    final resultAddress = ref.watch(onboardingStateNotifierProvider.notifier);
    return Scaffold(
      body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 16),
                headerWidget(widget.userName ?? ''),
                SizedBox(height: 24),
                jusoInputTextField(ref, jusoController, focusNode),
                SizedBox(height: 16),
                Text(
                  '검색결과',
                  style: DaepiroTextStyle.body_2_m.copyWith(
                      color: DaepiroColorStyle.g_400),
                ),
                SizedBox(height: 8),
                if(state.isError || (focusNode.hasFocus && resultAddress.inputJusoList.isEmpty))
                  searchErrorWidget(),
                if(!state.isError)
                  Expanded(
                    child: ListView.builder(
                        controller: scrollController,
                        itemCount: resultAddress.inputJusoList.length + 1,
                        itemBuilder: (context, index) {
                          if (index == resultAddress.inputJusoList.length)
                            return Container();
                          var jusoList = resultAddress.inputJusoList.toList();
                          var juso = jusoList[index].toString();
                          bool isTapped = selected.contains(index);
                          return Container(
                            child: ListTile(
                                tileColor: isTapped
                                    ? DaepiroColorStyle.g_50
                                    : DaepiroColorStyle.white,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    side: BorderSide(
                                        color: DaepiroColorStyle.white)
                                ),
                                title: Text(
                                  juso,
                                  style: DaepiroTextStyle.body_1_m.copyWith(
                                      color: DaepiroColorStyle.g_900),
                                ),
                                onTap: () async {
                                  setState(() {
                                    selected.add(index);
                                  });
                                  if(widget.fromMyPage == false) {
                                    if (widget.index == '0') {
                                      ref.read(onboardingStateNotifierProvider
                                          .notifier).addHomeJuso(juso);
                                    } else if (widget.index == '1') {
                                      ref.read(onboardingStateNotifierProvider
                                          .notifier).addFirstJuso(juso);
                                    } else {
                                      ref.read(onboardingStateNotifierProvider
                                          .notifier).addSecondJuso(juso);
                                    }
                                    ref.read(
                                        onboardingStateNotifierProvider.notifier)
                                        .initSearchHistory();
                                  } else {
                                    if (widget.index == '0') {
                                      ref.read(myPageProvider
                                          .notifier).addHomeJuso(juso);
                                    } else if (widget.index == '1') {
                                      ref.read(myPageProvider
                                          .notifier).addFirstJuso(juso);
                                    } else {
                                      ref.read(myPageProvider
                                          .notifier).addSecondJuso(juso);
                                    }
                                    ref.read(
                                        myPageProvider.notifier)
                                        .initSearchHistory();
                                  }
                                  GoRouter.of(context).pop();
                                }
                            ),
                          );
                        }
                    ),
                  )
              ],
            ),
          )
      ),
    );
  }

  Widget headerWidget(String userName) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        IconButton(
            visualDensity: VisualDensity.compact,
            onPressed: () {
              GoRouter.of(context).pop();
            },
            icon: SvgPicture.asset(
                'assets/icons/icon_arrow_left.svg',
                colorFilter: ColorFilter.mode(
                    DaepiroColorStyle.g_900, BlendMode.srcIn))),
        SizedBox(height: 32),
        Row(
          children: [
            Text(
              '${userName}님의 ',
              style: DaepiroTextStyle.h5.copyWith(
                  color: DaepiroColorStyle.g_900),
            ),
            SizedBox(width: 8),
            typeChipWidget(),
            SizedBox(width: 8),
            Text(
              '어디인가요?',
              style: DaepiroTextStyle.h5.copyWith(
                  color: DaepiroColorStyle.g_900),
            ),
          ],
        ),
      ],
    );
  }

  Widget searchErrorWidget() {
    return Expanded(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                '올바르지 않은 주소예요',
                style: DaepiroTextStyle.body_1_b.copyWith(
                    color: DaepiroColorStyle.g_600),
              ),
              SizedBox(height: 4),
              Text(
                  '동/읍/면/리 주소로 다시 검색해주세요.',
                  style: DaepiroTextStyle.body_2_m.copyWith(
                      color: DaepiroColorStyle.g_600)),
            ],
          ),
        ));
  }

  Widget typeChipWidget() {
    return SecondaryFilledButton(
        onPressed: () {},
        radius: 99,
        backgroundColor: DaepiroColorStyle.g_600,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                  widget.type == '집'
                      ? 'assets/icons/icon_home.svg'
                      : 'assets/icons/icon_location_24.svg',
                  colorFilter: ColorFilter.mode(
                      DaepiroColorStyle.white, BlendMode.srcIn)
              ),
              Text(
                widget.type!,
                style: DaepiroTextStyle.body_2_b.copyWith(
                    color: DaepiroColorStyle.white),
              ),
            ],
          ),
        )
    );
  }

  //주소 입력창
  Widget jusoInputTextField(WidgetRef ref, TextEditingController controller, FocusNode focusNode) {
    return Stack(
      children: [
        TextField(
          onTapOutside: (event) =>
              FocusManager.instance.primaryFocus?.unfocus(),
          controller: controller,
          cursorColor: DaepiroColorStyle.g_900,
          style: DaepiroTextStyle.body_1_m.copyWith(
              color: DaepiroColorStyle.g_900,
              decorationThickness: 0
          ),
          onChanged: (text) async {
            await ref.read(onboardingStateNotifierProvider.notifier)
                .getJusoList(controller.text, 0, false);
            setState(() {});
          },
          focusNode: focusNode,
          decoration: InputDecoration(
            filled: true,
            isDense: true,
            contentPadding: EdgeInsets.all(16),
            fillColor: DaepiroColorStyle.g_50,
            hintText: '동/읍/면/리',
            hintStyle: DaepiroTextStyle.body_1_m.copyWith(
                color: DaepiroColorStyle.g_200),
            suffixIcon: Padding(
                padding: EdgeInsets.symmetric(vertical: 16),
                child: controller.text.length > 0 ?
                GestureDetector(
                  onTap: controller.clear,
                  child: SvgPicture.asset(
                      'assets/icons/icon_close.svg',
                      colorFilter: ColorFilter.mode(
                          DaepiroColorStyle.g_400, BlendMode.srcIn)
                  ),
                ) :
                SvgPicture.asset('assets/icons/icon_search.svg',
                    colorFilter: ColorFilter.mode(
                        DaepiroColorStyle.g_200, BlendMode.srcIn))
            ),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(4)),
                borderSide: BorderSide(
                    width: 1.5,
                    color: DaepiroColorStyle.g_75
                )
            ),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(4)),
                borderSide: BorderSide(width: 1, color: DaepiroColorStyle.g_50)
            ),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(4)),
                borderSide: BorderSide(width: 1, color: DaepiroColorStyle.g_50)
            ),
          ),
        ),
      ],
    );
  }
}