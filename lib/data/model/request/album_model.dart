import 'package:photo_manager/photo_manager.dart';

///* 사진첩 내 앨벌 모델
class AlbumModel {
  ///* 앨범 id
  final String? id;

  ///* 앨범 이름
  final String? name;

  ///* 앨범 내부 사진 리스트
  final List<AssetEntity>? images;

  AlbumModel({
    required this.id,
    required this.name,
    required this.images,
  });

  AlbumModel.fromJson(dynamic json)
      : this(
    id: json['id'] ?? '',
    name: json['name'] ?? '',
    images: json['images'] ?? [],
  );

  factory AlbumModel.fromGallery(
      String id, String name, List<AssetEntity> images) {
    return AlbumModel(id: id, name: name, images: images);
  }
}