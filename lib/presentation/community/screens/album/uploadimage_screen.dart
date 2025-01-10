import 'package:daepiro/cmm/DaepiroTheme.dart';
import 'package:daepiro/presentation/community/controller/community_town_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:photo_manager_image_provider/photo_manager_image_provider.dart';
import '../../../../data/model/request/album_model.dart';
import '../../controller/community_disaster_view_model.dart';

//이미지 개별 이미지
class Uploadimage extends ConsumerWidget {
  //final void Function()? onTap;
  final AssetEntity entity;
  final BoxFit fit;
  final AlbumModel photo;

  const Uploadimage(
      {super.key, required this.entity, required this.fit, required this.photo});

  @override
  Widget build(BuildContext contextm, WidgetRef ref) {
    final state = ref.watch(communityTownProvider);
    return Stack(
      children: [
        AssetEntityImage(entity, fit: fit, isOriginal: false),
        Positioned(
            top: 8,
            right: 8,
            child: Checkbox(
                visualDensity: VisualDensity.compact,
                side: BorderSide(color: Colors.transparent),
                activeColor: DaepiroColorStyle.o_500,
                checkColor: DaepiroColorStyle.g_75,
                fillColor: MaterialStateProperty.resolveWith((state) {
                  if (!state.contains(MaterialState.selected)) {
                    return DaepiroColorStyle.g_75;
                  }
                  return null;
                }),
                value: ref.watch(communityTownProvider.select((state) =>
                    state.selectAlbums.contains(photo))),
                onChanged: (bool? value) {
                  if (value == true && state.selectAlbums.length <= 3) {
                    ref.read(communityTownProvider.notifier).addSelectedAlbum(photo);
                  } else {
                    ref.read(communityTownProvider.notifier).deselectPhoto(photo);
                  }
                }
            )
        )
      ],
    );
  }
}

class AlbumScreen extends ConsumerWidget {
  const AlbumScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(communityTownProvider);
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
              child: (state.albums.isNotEmpty)
                  ? GridView.builder(
                  gridDelegate:
                  const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 1,
                    childAspectRatio: 0.7,
                  ),
                  itemCount:
                  state.albums[state.currentAlbumIndex].images!.length,
                  itemBuilder: (context, index) =>
                      Uploadimage(
                          entity: state
                              .albums[state.currentAlbumIndex].images![index],
                          fit: BoxFit.cover,
                          // onTap: () {
                          //   print('눌림');
                          // },
                        photo: state.albums[state.currentAlbumIndex],
                          ))
                  : Container())
        ],
      ),
    );
  }
}
