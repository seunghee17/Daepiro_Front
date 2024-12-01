import 'package:daepiro/presentation/community/community_disaster_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:photo_manager_image_provider/photo_manager_image_provider.dart';

class AlbumChoiceScreen extends ConsumerWidget {
  const AlbumChoiceScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(communityDisasterProvider);
    return Scaffold(
      body: ListView.builder(
        itemCount: state.albums.length,
          itemBuilder: (context, index) => GestureDetector(
            onTap: () {
              ref.read(communityDisasterProvider.notifier).setCurrentAlbumIndex(index);
              GoRouter.of(context).go('/album_screen');
            },
            child: Row(
              children: [
                SizedBox(
                  width: 100,
                  height: 100,
                  child: AssetEntityImage(
                    state.albums[index].images![0],
                    fit: BoxFit.cover,
                    isOriginal: true,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(state.albums[index].name!),
                    Text('${state.albums[index].images!.length}')
                  ],
                )
              ],
            ),
          ),
      ));
  }


}