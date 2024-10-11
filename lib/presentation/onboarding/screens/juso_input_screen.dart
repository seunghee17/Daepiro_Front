import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import '../../widgets/DaepiroTheme.dart';
import '../../widgets/button/secondary_filled_button.dart';
import '../controller/onboarding_controller.dart';

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
  Set<int> selected = Set();
  int currentPage = 1;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    Future(() {
      ref.read(onboardingControllerProvider.notifier).initSearchHistory();
    });
    jusoController.addListener(updateList);
    scrollController.addListener(() {
      if(scrollController.position.pixels == scrollController.position.maxScrollExtent && !isLoading) {
        loadMoreJuso();
      }
    });
  }

  void updateList() async {
    if(jusoController.text.length >= 1) {
      setState(() {
        currentPage = 1;
      });
      ref.read(onboardingControllerProvider.notifier).getJusoList(jusoController.text, currentPage, false);
    }
  }

  Future<void> loadMoreJuso() async {
    if(!isLoading) {
      setState(() {
        isLoading = true;
        currentPage++;
      });
      await ref.read(onboardingControllerProvider.notifier).getJusoList(
        jusoController.text,
        currentPage,
        true
      );
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(onboardingControllerProvider);
    return Scaffold(
      body: SafeArea(
        child: state.when(
            data: (state) {
              return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                        padding: EdgeInsets.symmetric(vertical: 20),
                      child:
                        IconButton(
                          onPressed: () {
                            GoRouter.of(context).pop();
                          },
                          icon: SvgPicture.asset(
                            'assets/icons/arrow_left.svg',
                              colorFilter: ColorFilter.mode(DaepiroColorStyle.g_900, BlendMode.srcIn)
                          ),
                        )
                    ),
                    SizedBox(height: 16,),
                    Row(
                      children: [
                        Text(
                            '${state.userName}님 ',
                          style: DaepiroTextStyle.h5.copyWith(color: DaepiroColorStyle.g_900),
                        ),
                        typeChipWidget(),
                        Text(
                          ' 어디에 있나요?',
                          style: DaepiroTextStyle.h5.copyWith(color: DaepiroColorStyle.g_900),
                        ),
                      ],
                    ),
                    SizedBox(height: 24),
                    TextField(
                      controller: jusoController,
                      style: DaepiroTextStyle.body_1_m.copyWith(
                          color: DaepiroColorStyle.g_900,
                          decorationThickness: 0
                      ),
                      decoration: InputDecoration(
                        filled: true,
                        isDense: true,
                        contentPadding: EdgeInsets.all(16),
                        fillColor: DaepiroColorStyle.g_50,
                        hintText: '동/읍/면/리',
                        hintStyle: DaepiroTextStyle.body_1_m.copyWith(color: DaepiroColorStyle.g_200),
                        suffixIcon: Padding(
                          padding: EdgeInsets.all(16),
                            child: SvgPicture.asset('assets/icons/search.svg',colorFilter: ColorFilter.mode(DaepiroColorStyle.g_200, BlendMode.srcIn))
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
                    SizedBox(height: 16),
                    Text(
                      '검색결과',
                      style: DaepiroTextStyle.body_2_m.copyWith(color: DaepiroColorStyle.g_400),
                    ),
                    SizedBox(height: 8),
                    Expanded(
                      child: ListView.builder(
                        controller: scrollController,
                        itemCount: state.jusoListState.length+1,
                        itemBuilder: (context, index) {
                          if(state.isError) {
                            return Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '올바르지 않은 주소예요',
                                    style: DaepiroTextStyle.body_1_b.copyWith(color: DaepiroColorStyle.g_600),
                                  ),
                                  SizedBox(height: 4),
                                  Text(
                                      '다시 검색해주세요',
                                    style: DaepiroTextStyle.body_2_m.copyWith(color: DaepiroColorStyle.g_600)
                                  ),
                                ],
                              ),
                            );
                          }
                         if(index == state.jusoListState.length)
                            return Container();
                          var jusoList = state.jusoListState.toList();
                          var juso = jusoList[index].toString();
                          bool isTapped = selected.contains(index);
                          return Container(
                            child: ListTile(
                              tileColor: isTapped ? DaepiroColorStyle.g_50 : DaepiroColorStyle.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                                side: BorderSide(color: DaepiroColorStyle.white)
                              ),
                              title: Text(
                                juso,
                                style: DaepiroTextStyle.body_1_m.copyWith(color: DaepiroColorStyle.g_900),
                              ),
                              onTap: () async {
                                setState(() {
                                  selected.add(index);
                                });
                                await ref.read(onboardingControllerProvider.notifier).addJuso(juso, int.parse(widget.index!));
                                await ref.read(onboardingControllerProvider.notifier).initSearchHistory();
                                GoRouter.of(context).pop();
                              }
                            ),
                          );
                        }
                      ),
                    )
                  ],
                ),
              );
            },
            error: (error, stack) => Text('에러: ${error}'),
            loading: () => const CircularProgressIndicator()
        ),
      ),
    );
  }

  Widget typeChipWidget() {
    return SecondaryFilledButton(
      onPressed: (){},
      radius: 99,
      backgroundColor: DaepiroColorStyle.g_600,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
              widget.type=='집' ? 'assets/icons/home.svg' : 'assets/icons/location.svg',
              colorFilter: ColorFilter.mode(DaepiroColorStyle.white, BlendMode.srcIn)
          ),
          Text(
            widget.type!,
            style: DaepiroTextStyle.body_2_b.copyWith(color: DaepiroColorStyle.white),
          ),
        ],
      ),
    );
  }

}