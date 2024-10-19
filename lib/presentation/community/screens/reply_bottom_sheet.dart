import 'package:daepiro/presentation/community/community_view_model.dart';
import 'package:daepiro/presentation/widgets/DaepiroTheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

class ReplyBottomSheet extends ConsumerStatefulWidget {

  @override
  ReplyBottomSheetState createState() => ReplyBottomSheetState();
}

class ReplyBottomSheetState extends ConsumerState<ReplyBottomSheet> {
  final TextEditingController replyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final communityViewModel = ref.watch(communityViewModelProvider);
    return communityViewModel.when(
        data: (state) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                headerWidget(),
                Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          //댓글들 담아야함
                        ],
                      ),
                    )
                ),

              ],
            ),
          );
        },
        error: (error, state) => Center(child: Text('error: ${error}')),
        loading: () => const Center(child: CircularProgressIndicator()),);
  }

  Widget headerWidget() {
    return Container(
      child: Row(
        children: [
          Text('댓글',
            style: DaepiroTextStyle.body_1_b.copyWith(color: DaepiroColorStyle.g_900),
          )
        ],
      ),
    );
  }

  Widget footerWidget() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(color: DaepiroColorStyle.g_50)
        )),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 19),
        child: Row(
          children: [
            SvgPicture.asset('assets/icons/photo.svg',
                width: 28,
                height: 28,
                colorFilter: ColorFilter.mode(DaepiroColorStyle.g_800, BlendMode.srcIn)
            ),
            SizedBox(width: 12),
            TextField(
              onTapOutside: (event) => FocusManager.instance.primaryFocus?.unfocus(),
              decoration: InputDecoration(
                filled: true,
                isDense: true,
                hintText: '댓글을 작성해주세요.',
                fillColor: DaepiroColorStyle.g_50,
                hintStyle: DaepiroTextStyle.body_2_m.copyWith(color: DaepiroColorStyle.g_200),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

}