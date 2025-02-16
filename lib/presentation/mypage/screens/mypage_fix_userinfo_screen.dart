import 'package:daepiro/cmm/DaepiroTheme.dart';
import 'package:daepiro/presentation/mypage/controller/mypage_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class MyPageFixUserinfoScreen extends ConsumerStatefulWidget {
  const MyPageFixUserinfoScreen({super.key});

  @override
  MyPageFixUserinfoState createState() => MyPageFixUserinfoState();
}

class MyPageFixUserinfoState extends ConsumerState<MyPageFixUserinfoScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController nicknameController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(myPageProvider);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      nameController.text = state.realName;
      nicknameController.text = state.nickName;
    });

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              headerWidget(context, ref),
              const SizedBox(height: 8),
              Text('이름', style: DaepiroTextStyle.h6.copyWith(color: DaepiroColorStyle.g_900)),
              const SizedBox(height: 8),
              nameTextField(nameController),
              const SizedBox(height: 24),
              Text('닉네임', style: DaepiroTextStyle.h6.copyWith(color: DaepiroColorStyle.g_900)),
              const SizedBox(height: 8),
              nickNameTextField(nicknameController),
              const SizedBox(height: 24),
              Text('계정', style: DaepiroTextStyle.h6.copyWith(color: DaepiroColorStyle.g_900)),
              const SizedBox(height: 8),
              emailTextField()
            ],
          ),
        ),
      ),
    );
  }

  //헤더 위젯
  Widget headerWidget(BuildContext context, WidgetRef ref) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: GestureDetector(
            onTap: () => GoRouter.of(context).pop(),
            child: SvgPicture.asset('assets/icons/icon_arrow_left.svg',
                width: 24,
                height: 24,
                colorFilter:
                    const ColorFilter.mode(DaepiroColorStyle.g_900, BlendMode.srcIn)),
          ),
        ),
        const Spacer(),
        Text('프로필 수정',
            style:
                DaepiroTextStyle.h6.copyWith(color: DaepiroColorStyle.g_800)),
        const Spacer(),
        GestureDetector(
          onTap: () async {
            await ref.read(myPageProvider.notifier).setMyProfiles(nameController.text, nicknameController.text);
            ref.read(myPageProvider.notifier).getMyProfiles();
            GoRouter.of(context).pop();
          },
          child: Text('저장',
              style: DaepiroTextStyle.body_1_m
                  .copyWith(color: DaepiroColorStyle.o_500)),
        )
      ],
    );
  }

  //이름 입력란
  Widget nameTextField(TextEditingController controller) {
    return Stack(
      children: [
        TextField(
            controller: controller,
            onTapOutside: (event) =>
                FocusManager.instance.primaryFocus?.unfocus(),
            style: DaepiroTextStyle.body_1_m.copyWith(
                color: DaepiroColorStyle.g_900, decorationThickness: 0),
            decoration: InputDecoration(
              filled: true,
              isDense: true,
              contentPadding: const EdgeInsets.all(16),
              fillColor: DaepiroColorStyle.g_50,
              focusedBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(4)),
                  borderSide:
                      BorderSide(width: 1.5, color: DaepiroColorStyle.g_75)),
              enabledBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(4)),
                  borderSide:
                      BorderSide(width: 1, color: DaepiroColorStyle.g_50)),
              suffixIcon: Padding(
                padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                child: SvgPicture.asset('assets/icons/icon_edit.svg',
                    width: 24,
                    height: 24,
                    colorFilter: const ColorFilter.mode(
                        DaepiroColorStyle.g_200, BlendMode.srcIn)),
              ),
            ))
      ],
    );
  }

  //닉네임 입력란
  Widget nickNameTextField(TextEditingController controller) {
    return Stack(
      children: [
        TextField(
            controller: controller,
            onTapOutside: (event) =>
                FocusManager.instance.primaryFocus?.unfocus(),
            style: DaepiroTextStyle.body_1_m.copyWith(
                color: DaepiroColorStyle.g_900, decorationThickness: 0),
            decoration: InputDecoration(
              filled: true,
              isDense: true,
              contentPadding: const EdgeInsets.all(16),
              fillColor: DaepiroColorStyle.g_50,
              focusedBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(4)),
                  borderSide:
                  BorderSide(width: 1.5, color: DaepiroColorStyle.g_75)),
              enabledBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(4)),
                  borderSide:
                  BorderSide(width: 1, color: DaepiroColorStyle.g_50)),
              suffixIcon: Padding(
                padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                child: SvgPicture.asset('assets/icons/icon_edit.svg',
                    width: 24,
                    height: 24,
                    colorFilter: const ColorFilter.mode(
                        DaepiroColorStyle.g_200, BlendMode.srcIn)),
              ),
            ))
      ],
    );
  }

  //이메일 입력란
  Widget emailTextField() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: DaepiroColorStyle.g_50
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text('카카오', style: DaepiroTextStyle.body_1_m.copyWith(color: DaepiroColorStyle.g_200)),
            const Spacer(),
            Text('victoria@naver', style: DaepiroTextStyle.body_1_m.copyWith(color: DaepiroColorStyle.g_200)),
          ],
        ),
      )
    );
  }
}
