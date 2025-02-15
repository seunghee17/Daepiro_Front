import 'package:image_picker/image_picker.dart';
import 'package:photo_manager_image_provider/photo_manager_image_provider.dart';
import 'package:daepiro/presentation/community/controller/community_town_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:photo_manager/photo_manager.dart';
import '../../../../cmm/DaepiroTheme.dart';
import '../../../../data/model/Album.dart';
import '../../../../data/model/selected_image.dart';

class GalleryViewScreen extends ConsumerStatefulWidget {
  final List<SelectedImage> selectedImages;
  GalleryViewScreen({super.key, required this.selectedImages});

  @override
  _GalleryViewScreenState createState() => _GalleryViewScreenState();
}

class _GalleryViewScreenState extends ConsumerState<GalleryViewScreen> with WidgetsBindingObserver {
  List<AssetPathEntity>? _paths;
  List<Album> _albums = [];
  late List<AssetEntity> _images;
  int _currentPage = 0;
  late Album _currentAlbum;
  final _scrollController = ScrollController();

  Future<void> getAlbum() async {
    _paths = await PhotoManager.getAssetPathList(
      type: RequestType.all,
    );

    _albums = _paths!.map((e) {
      return Album(
        id: e.id,
        name: e.isAll ? '모든 사진' : e.name,
      );
    }).toList();

    await getPhotos(_albums[0], albumChange: true);
  }

  List<AssetEntity> _isAllCheck(List<AssetEntity> loadImages, bool isAll) {
    if (isAll) {
      const dummy = AssetEntity(id: 'camera', typeInt: 0, width: 0, height: 0);
      loadImages.insert(0, dummy);
    }
    return loadImages;
  }


  Future<void> getPhotos(
      Album album, {
        bool albumChange = false,
      }) async {
    _currentAlbum = album;
    albumChange ? _currentPage = 0 : _currentPage++;

    final getAlbum = _paths!.singleWhere((element) => element.id == album.id);
    final loadImages = await getAlbum.getAssetListPaged(
      page: _currentPage,
      size: 20,
    );

    setState(() {
      if (albumChange) {
        _images = _isAllCheck(loadImages, false);
      } else {
        _images.addAll(loadImages);
      }
    });
  }

  Future<int> _getAssetSize(AssetEntity entity) async {
    final file = await entity.originFile;
    if (file != null) {
      return await file.length(); // 파일 크기를 바이트 단위로 반환
    }
    return 0; // 파일이 없으면 0 반환
  }

  void _selectImage(SelectedImage image) async {
    final viewModel = ref.read(communityTownProvider.notifier);
    final sizeInBytes = await _getAssetSize(image.entity!);
    final sizeInMB = sizeInBytes / (1024 * 1024);
    if(sizeInMB > 300) {
      print('선택한 파일이 300MB초과');
      return;
    }

    final addedImageCheck = viewModel.addedImageCheck(image);

    if (addedImageCheck) {
      viewModel.removeImageFromGallery(image, false);
    } else {
      if(ref.read(communityTownProvider).selectedImages.length < 3) {
        final item = SelectedImage(entity: image.entity, file: image.file);
        viewModel.addImageFromGallery(item);
      }
    }

    if (!addedImageCheck && _scrollController.hasClients) {
      _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addObserver(this);
    getAlbum();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch(state) {
      case AppLifecycleState.resumed:
        getAlbum();
      default:
        break;
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance?.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(communityTownProvider);
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Container(
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              ref.read(communityTownProvider.notifier).setImageFromGallery([]);
                              GoRouter.of(context).pop();
                            },
                            child: SvgPicture.asset('assets/icons/icon_arrow_left.svg',
                                width: 24,
                                height: 24,
                                colorFilter: ColorFilter.mode(
                                    DaepiroColorStyle.g_900, BlendMode.srcIn)),
                          ),
                          Spacer(),
                          Text('${state.selectedImages.length}/3', style: DaepiroTextStyle.h6.copyWith(color: DaepiroColorStyle.g_800)),
                          Spacer(),
                          GestureDetector(
                              onTap: () async {
                                GoRouter.of(context).pop();
                              },
                              child: Text('추가', style: DaepiroTextStyle.body_1_m.copyWith(color: DaepiroColorStyle.g_400),))
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: NotificationListener<ScrollNotification>(
                    onNotification: (ScrollNotification scroll) {
                      final scrollPixels = scroll.metrics.pixels /
                          scroll.metrics.maxScrollExtent;
                      if (scrollPixels > 0.7) getPhotos(_currentAlbum);

                      return false;
                    },
                    child: _paths == null
                        ? const Center(child: CircularProgressIndicator())
                        : GridPhoto(
                      images: _images,
                      selectedImages: state.selectedImages,
                      onTap: _selectImage,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class GridPhoto extends StatelessWidget {
  List<AssetEntity> images;
  List<SelectedImage> selectedImages;
  ValueChanged<SelectedImage> onTap;

  GridPhoto({
    required this.images,
    required this.selectedImages,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  final picker = ImagePicker();

  void _loadCamera() async {
    final file = await picker.pickImage(source: ImageSource.camera);
    if (file != null) {
      final item = SelectedImage(entity: null, file: file);
      onTap(item);
    }
  }

  void _selectImage(AssetEntity e) {
    if(selectedImages.length <=3) {
      final item = SelectedImage(entity: e, file: null);
      onTap(item);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GridView(
      gridDelegate:
      const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
      children: images.map((e) {
        if (e.id == 'camera') {
          return _cameraButton();
        } else {
          return _gridPhotoItem(e);
        }
      }).toList(),
    );
  }

  Widget _cameraButton() {
    return GestureDetector(
      onTap: _loadCamera,
      child: Container(
        color: Colors.black,
        child: const Icon(
          CupertinoIcons.camera,
          color: Colors.white,
          size: 50,
        ),
      ),
    );
  }

  Widget _gridPhotoItem(AssetEntity e) {
    return GestureDetector(
      onTap: () {
        _selectImage(e);
      },
      child: Padding(
        padding: const EdgeInsets.all(1.0),
        child: Stack(
          children: [
            Positioned.fill(
              child: AssetEntityImage(
                e,
                isOriginal: false,
                fit: BoxFit.cover,
              ),
            ),
            _dimContainer(e),
            _selectNumberContainer(e)
          ],
        ),
      ),
    );
  }

  Widget _dimContainer(AssetEntity e) {
    final isSelected = selectedImages.any((element) => element.entity == e);
    return Positioned.fill(
      child: Container(
        decoration: BoxDecoration(
          color: isSelected ? Colors.black38 : Colors.transparent,
        ),
      ),
    );
  }

    Widget _selectNumberContainer(AssetEntity e) {
    final isSelected = selectedImages.any((element) => element.entity == e);
    return Positioned(
      right: 8,
        top: 8,
        child: Checkbox(
          visualDensity: VisualDensity.compact,
          side: BorderSide(color: Colors.transparent),
          activeColor: DaepiroColorStyle.o_500,
          checkColor: Colors.white,
          fillColor: MaterialStateProperty.resolveWith((states) {
            if(states.contains(MaterialState.selected)) {
              return DaepiroColorStyle.o_500;
            }
            return DaepiroColorStyle.g_75;
          }),
          value: isSelected,
          onChanged: (value) {
            if(value == true) {
              _selectImage(e);
            } else {
              final item = SelectedImage(entity: e, file: null);
                  onTap(item);
            }
          },
        )
    );
  }
}