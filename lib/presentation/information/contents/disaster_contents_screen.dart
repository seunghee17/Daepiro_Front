import 'package:daepiro/presentation/information/component/disaster_contents_preview_item.dart';
import 'package:daepiro/presentation/information/contents/disaster_contents_state.dart';
import 'package:daepiro/presentation/information/contents/disaster_contents_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import '../../../cmm/DaepiroTheme.dart';

class DisasterContentsScreen extends ConsumerWidget {
  const DisasterContentsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(disasterContentsStateNotifierProvider);

    ref.listen<DisasterContentsState>(disasterContentsStateNotifierProvider, (previous, next) {
      if (next.isLoading) {

      }
    });

    return Scaffold(
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: DaepiroColorStyle.white,
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        context.pop();
                      },
                      child: SvgPicture.asset(
                        'assets/icons/icon_arrow_left.svg',
                        alignment: Alignment.centerLeft,
                        colorFilter: const ColorFilter.mode(DaepiroColorStyle.g_900, BlendMode.srcIn),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        '재난 콘텐츠',
                        style: DaepiroTextStyle.h6.copyWith(
                          color: DaepiroColorStyle.g_800,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        context.push('/searchDisasterContents');
                      },
                      child: SvgPicture.asset(
                        'assets/icons/icon_search.svg',
                        alignment: Alignment.centerRight,
                        colorFilter: const ColorFilter.mode(DaepiroColorStyle.g_900, BlendMode.srcIn),
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(height: 1.5, color: DaepiroColorStyle.g_50),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(12),
                  child: ListView.builder(
                      itemCount: viewModel.contentsList.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return DisasterContentsItem(
                            title: viewModel.contentsList[index].title ?? "",
                            imagePath: viewModel.contentsList[index].thumbnailUrl ?? "",
                            from: viewModel.contentsList[index].source ?? "",
                            date: viewModel.contentsList[index].publishedAt ?? "",
                            eye: viewModel.contentsList[index].viewCount ?? 0,
                            save: viewModel.contentsList[index].likeCount ?? 0,
                            bodyUrl: viewModel.contentsList[index].bodyUrl ?? ""
                        );
                      }
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}
