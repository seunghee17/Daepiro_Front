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

  const JusoInputScreen({super.key, this.type, this.index});

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
      await ref.read(onboardingStateNotifierProvider.notifier).getJusoList(
          jusoController.text,
          currentPage,
          true, ref
      );
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(onboardingStateNotifierProvider);
    return Scaffold(
      body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 16),
                headerWidget(state.userName),
                SizedBox(height: 24),
                jusoInputTextField(ref, jusoController, focusNode),
                SizedBox(height: 16),
                Text(
                  '검색결과',
                  style: DaepiroTextStyle.body_2_m.copyWith(
                      color: DaepiroColorStyle.g_400),
                ),
                SizedBox(height: 8),
                if(state.isError || (focusNode.hasFocus && state.jusoListState.isEmpty))
                  searchErrorWidget(),
                if(!state.isError)
                  Expanded(
                    child: ListView.builder(
                        controller: scrollController,
                        itemCount: state.jusoListState.length + 1,
                        itemBuilder: (context, index) {
                          if (index == state.jusoListState.length)
                            return Container();
                          var jusoList = state.jusoListState.toList();
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
            if(userName.length >=4)
              Text(
                '${userName.substring(1, 3)}님 ',
                style: DaepiroTextStyle.h5.copyWith(
                    color: DaepiroColorStyle.g_900),
              ),
            if(userName.length <4)
              Text(
                '${userName}님 ',
                style: DaepiroTextStyle.h5.copyWith(
                    color: DaepiroColorStyle.g_900),
              ),
            SizedBox(width: 8),
            typeChipWidget(),
            SizedBox(width: 8),
            Text(
              '어디에 있나요?',
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
                  '다시 검색해주세요',
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
          style: DaepiroTextStyle.body_1_m.copyWith(
              color: DaepiroColorStyle.g_900,
              decorationThickness: 0
          ),
          onChanged: (text) async {
            await ref.read(onboardingStateNotifierProvider.notifier)
                .getJusoList(controller.text, 0, false, ref);
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
                //TODO 삭제 버튼이 조건적으로 있어야함
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