import 'dart:ui';

import 'package:daepiro/presentation/community/controller/community_town_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../cmm/DaepiroTheme.dart';

class CommunityTownAddressMenuScreen extends ConsumerWidget {

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(communityTownProvider);

    return Stack(
      children: [
        BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        ),
        Positioned(
          left: 0,
            right: 0,
            bottom: 20,
            child: Column(
              children: [
                ...List.generate(
                    state.townList.length,
                    (index) {
                      return addressMenuItem(index, ref, context, state.townList);
                    }
                ),
                townCertificationMenuItem(context)
              ],
            )
        )
      ],
    );
  }

  Widget addressMenuItem(int index, WidgetRef ref, BuildContext context, List<String> townList) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            ref.read(communityTownProvider.notifier).setSelectAddress(index);
            GoRouter.of(context).pop();
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  color: DaepiroColorStyle.g_50,
                  borderRadius: BorderRadius.circular(8)),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: Text(
                  townList[index],
                  textAlign: TextAlign.center,
                  style: DaepiroTextStyle.body_1_b
                      .copyWith(color: DaepiroColorStyle.g_700),
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 7)
      ],
    );
  }

  Widget townCertificationMenuItem(BuildContext context) {
    return GestureDetector(
      onTap: () {
        //TODO 동네인증 로직 추가
        GoRouter.of(context).pop();
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
              color: DaepiroColorStyle.g_700,
              borderRadius: BorderRadius.circular(8)),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Text(
              '동네 인증하러가기',
              textAlign: TextAlign.center,
              style: DaepiroTextStyle.body_1_b
                  .copyWith(color: DaepiroColorStyle.white),
            ),
          ),
        ),
      ),
    );
  }

}