import 'dart:io';
import 'package:daepiro/data/model/request/community_writing_edit_request.dart';
import 'package:daepiro/domain/usecase/community/community_article_delete_usecase.dart';
import 'package:daepiro/domain/usecase/community/community_article_edit_usecase.dart';
import 'package:daepiro/domain/usecase/community/community_article_like_usecase.dart';
import 'package:daepiro/domain/usecase/community/community_article_writing_usecase.dart';
import 'package:daepiro/domain/usecase/community/community_dongnae_content_detail_usecase.dart';
import 'package:daepiro/domain/usecase/community/community_dongnae_content_usecase.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:photo_manager/photo_manager.dart';
import '../../../data/model/request/community_comment_post_request.dart';
import '../../../data/model/request/community_disaster_edit_request.dart';
import '../../../data/model/response/report_request.dart';
import '../../../data/model/selected_image.dart';
import '../../../domain/usecase/community/community_article_report_usecase.dart';
import '../../../domain/usecase/community/community_comment_write_usecase.dart';
import '../../../domain/usecase/community/community_disaster_delete_usecase.dart';
import '../../../domain/usecase/community/community_disaster_edit_usecase.dart';
import '../../../domain/usecase/community/community_reply_like_usecase.dart';
import '../../../domain/usecase/community/community_reply_report_usecase.dart';
import '../state/community_town_state.dart';
import 'community_disaster_view_model.dart';

final communityTownProvider =
    StateNotifierProvider<CommunityTownViewModel, CommunityTownState>((ref) {
  return CommunityTownViewModel(ref);
});

class CommunityTownViewModel extends StateNotifier<CommunityTownState> {
  final Ref ref;
  final FlutterSecureStorage storage = FlutterSecureStorage();
  var _currentPage = 0;

  CommunityTownViewModel(this.ref) : super(CommunityTownState()) {
    _initState();
  }

  Future<void> _initState() async {
    await setUserAddressList();
  }

  Future<void> loadContent() async {
    if (!state.isDongNaeHasMore) return;
    state = state.copyWith(isDongNaeLoading: true);
    final newPage = _currentPage + 1;
    final currentList = state.contentList;
    try {
      final result = await ref.read(getCommunityDongNaeUseCaseProvider(
              CommunityDongnaeContentUseCase(
                  category: state.townCategory == '전체'
                      ? null
                      : ContentCategory.getNamedByCategory(state.townCategory),
                  status: 'ACTIVE',
                  //address: state.selectLongTownAddress,
                  address: '서울특별시 강남구',
                  page: newPage,
                  size: 10))
          .future);
      final lastContent = result.data?.empty ?? false;
      if (lastContent) {
        state = state.copyWith(
          isDongNaeHasMore: false,
          isDongNaeLoading: false,
        );
        return;
      }
      final newContent = result.data?.content ?? [];
      _currentPage = newPage;
      state = state.copyWith(
        contentList: List.from(currentList)..addAll(newContent),
        isDongNaeHasMore: true,
      );
    } catch (e) {
      print('동네생활 viewmodel 에러발생 ${e}');
    } finally {
      state = state.copyWith(isDongNaeLoading: false);
    }
  }

  Future<void> selectButton(String type) async {
    state = state.copyWith(
        isDongNaeLoading: true,
        townCategory: type,
        isDongNaeHasMore: true,
        contentList: []);
    _currentPage = 0;
    await loadContent();
  }

  String parseCommentTime(String timeText) {
    if (timeText == '') {
      return '';
    }
    DateTime dateTime = DateTime.parse(timeText).toLocal();
    DateTime currentTime = DateTime.now();
    Duration differ = currentTime.difference(dateTime);

    if (differ.inMinutes < 1) {
      return '방금 전';
    } else if (differ.inMinutes < 60) {
      return '${differ.inMinutes}분전';
    } else if (differ.inHours < 24) {
      return '${differ.inHours} 시간전';
    } else {
      return '${differ.inDays}일전';
    }
  }

  Future<void> getContentDetail(int id) async {
    _currentPage = 0;
    final result = await ref.read(
        getCommunityDongNaeContentDetailUseCaseProvider(
                CommunityDongNaeContentDetailUseCase(id: id))
            .future);
    state = state.copyWith(
        contentDetail: result.data!,
        townReplyList: result.data!.comments,
        selectContentId: result.data?.id,
        contentList: []);
  }

  Future<void> setArticleLike() async {
    await ref.read(getArticleLikeUseCaseProvider(
            CommunityArticleLikeUseCase(id: state.selectContentId!))
        .future);
    await getContentDetail(state.selectContentId!);
  }

  void setLoadingState(bool value) {
    state = state.copyWith(isDongNaeLoading: value);
  }

  //글쓰기 타입 지정
  void setCategoryState(String category) {
    state = state.copyWith(writingTownCategory: category);
  }

  //신고하기 유형 선택
  void setReortType(String type) {
    state = state.copyWith(reportType: type);
  }

  //댓글 신고하기 api
  Future<void> sendReplyReportContent(
      int id, String detail, String email) async {
    await ref.read(communityReplyReportUseCaseProvider(
            CommunityReplyReportUseCase(
                id: id,
                communityReplyReportRequest: ReportRequest(
                    detail: detail,
                    type: ReportCategory.getNamedByCategory(state.reportType),
                    email: email)))
        .future);
  }

  //게시글 신고하기
  Future<void> sendArticleReportContent(
      int id, String detail, String email) async {
    await ref.read(communityArticleReportUseCaseProvider(
            CommunityArticleReportUseCase(
                id: id,
                communityArticleRequest: ReportRequest(
                    detail: detail,
                    type: ReportCategory.getNamedByCategory(state.reportType),
                    email: email)))
        .future);
  }
//TODO
  Future<void> setUserAddressList() async {
    List<String> addressList = [];
    List<String> longAddressList = [];
    int idx = 0;
    while (true) {
      String address = await storage.read(key: 'shortAddress_$idx') ?? '';
      String longAddress = await storage.read(key: 'fullAddress_$idx') ?? '';
      print('여기여기 ${address} & ${longAddress}');
      if (address == '') {
        break;
      } else {
        addressList.add(address);
        longAddressList.add(longAddress);
        idx++;
      }
    }
    state = state.copyWith(
      townList: addressList,
      townLongAddressList: longAddressList,
      selectLongTownAddress: longAddressList[0],
      selectTown: addressList[0],
    );
  }

  void setSelectAddress(int index) {
    state = state.copyWith(
      selectTown: state.townList[index],
      selectLongTownAddress: state.townLongAddressList[index],
    );
  }

  //대댓글 선택 상태 지정
  void setChildCommentState(bool value) {
    state = state.copyWith(isChildCommentState: value);
  }

  void setParentCommentId(int parentCommentId) {
    //답글작성할때 필요
    state = state.copyWith(parentCommentId: parentCommentId);
  }

  //댓글 좋아요
  Future<void> replyLike(int id) async {
    await ref.read(
        communityReplyLikeUseCaseProvider(CommunityReplyLikeUseCase(id: id))
            .future);
    await getContentDetail(state.selectContentId!);
  }

  Future<void> deleteReply(int id) async {
    await ref.read(
        getDisasterDeleteUseCaseProvider(CommunityDisasterDeleteUsecase(id: id))
            .future);
    await getContentDetail(state.selectContentId!);
  }

  void setEditState(bool value) {
    if (state.isChildCommentState) {
      state = state.copyWith(
        isEditChildCommentState: value,
      );
    } else {
      state = state.copyWith(
        isEditState: value,
      );
    }
  }

  void setReplyId(int commentId) {
    if (state.isChildCommentState) {
      state = state.copyWith(editChildCommentId: commentId);
    } else {
      state = state.copyWith(editCommentId: commentId);
    }
  }

  Future<void> editReply(String body) async {
    if (state.isChildCommentState) {
      await ref.read(getCommunityDisasterEditUseCaseProvider(
              CommunityDisasterEditUsecase(
                  id: state.editChildCommentId,
                  communityDisasterEditRequest:
                      CommunityDisasterEditRequest(body: body)))
          .future);
    } else {
      await ref.read(getCommunityDisasterEditUseCaseProvider(
              CommunityDisasterEditUsecase(
                  id: state.editCommentId,
                  communityDisasterEditRequest:
                      CommunityDisasterEditRequest(body: body)))
          .future);
    }
    await getContentDetail(state.selectContentId!);
  }

  //대댓글 작성
  Future<void> setReplyComment(String message, int parentCommentId) async {
    await ref
        .read(communityCommentWriteUseCaseProvider(CommunityCommentWriteUsecase(
            communityCommentPostRequest: CommunityCommentPostRequest(
      body: message,
      parentCommentId: parentCommentId,
      articleId: state.selectContentId,
    ))).future);
    await getContentDetail(state.selectContentId!);
  }

  Future<void> setComment(String message) async {
    await ref
        .read(communityCommentWriteUseCaseProvider(CommunityCommentWriteUsecase(
            communityCommentPostRequest: CommunityCommentPostRequest(
      body: message,
      articleId: state.selectContentId,
    ))).future);
    await getContentDetail(state.selectContentId!);
  }

  Future<List<MultipartFile>> changeMultiPart() async {
    List<MultipartFile> multipartFiles = [];
    for (var image in state.selectedImages) {
      final file = await image.entity!.originFile;
      final multiPartFile = await MultipartFile.fromFile(file!.path,
          filename: file.uri.pathSegments.last);
      multipartFiles.add(multiPartFile);
    }
    return multipartFiles;
  }

  Future<bool> setArticle(String title, String body) async {
    final imageData = await changeMultiPart();
    try {
      final result = await ref.read(setCommunityArticleWritingUseCaseProvider(
              CommunityArticleWritingUseCase(
                  articleCategory: ContentCategory.getNamedByCategory(
                      state.writingTownCategory),
                  title: title,
                  body: body,
                  visibility: state.isVisible,
                  longitude: 127.0495556,
                  latitude: 37.514575,
                  attachFileList: imageData))
          .future);
      _currentPage = 0;
      state = state.copyWith(contentList: []);
      if (result.code != 1000) {
        return false;
      } else {
        return true;
      }
    } catch (e) {
      print('게시글 편집 오류 발생 $e');
      return false;
    }
  }

  Future<bool> editArticle(String title, String body) async {
    final imageData = await changeMultiPart();
    try {
      final result = await ref.read(setCommunityArticleEditUseCaseProvider(
              CommunityArticleEditUseCase(
                  id: state.selectContentId!,
                  communityWritingEditRequest: CommunityWritingEditRequest(
                      articleType: 'DONGNE',
                      articleCategory: ContentCategory.getNamedByCategory(
                          state.writingTownCategory),
                      visibility: state.isVisible,
                      title: title,
                      body: body),
                  attachFileList: imageData))
          .future);
      if (result.code != 1000) {
        return false;
      } else {
        return true;
      }
    } catch (e) {
      print('게시글 편집 오류 발생 $e');
      return false;
    }
  }

  Future<bool> deleteArticle() async {
    try {
      final result = await ref.read(setCommunityArticleDeleteUseCaseProvider(
              CommunityArticleDeleteUseCase(id: state.selectContentId!))
          .future);
      if (result.code != 1000) {
        return false;
      }
      state = state.copyWith(
          selectContentId: 0,
          isDongNaeLoading: true,
          isDongNaeHasMore: true,
          contentList: []);
      _currentPage = 0;
      await loadContent();
      return true;
    } catch (e) {
      return false;
    }
  }

  void setArticleDeleteState(bool value) {
    state = state.copyWith(deleteArticle: value);
  }

  Future<void> setVisibleState() async {
    bool value = state.isVisible;
    state = state.copyWith(isVisible: !value);
    if (state.isVisible) {
      await getUserLocation();
    }
  }

  void clearWritingState() {
    state = state.copyWith(
      isVisible: false,
      writingTownCategory: '',
    );
  }

  Future<void> getUserLocation() async {
    var status = await Permission.location.status;
    if (status.isGranted) {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      state = state.copyWith(
        latitude: position.latitude,
        longitude: position.longitude,
      );
    } else {
      await Permission.location.request();
    }
  }

  void addImageFromGallery(SelectedImage image) {
    final currentList = List<SelectedImage>.from(state.selectedImages);
    currentList.add(image);
    state = state.copyWith(selectedImages: currentList);
  }

  void removeImageFromGallery(SelectedImage? image, bool isEditState) {
    var updatedList = List<SelectedImage>.from(state.selectedImages);
    if (isEditState) {
      updatedList.remove(image);
    } else {
      updatedList = state.selectedImages
          .where((e) => !_addedImageCheck(image!, e))
          .toList();
    }
    state = state.copyWith(
      selectedImages: updatedList,
    );
  }

  void convertFileToAssetEntity() async {
    final fileUrls = state.contentDetail.files;
    List<SelectedImage> convertResult = [];

    for (String fileUrl in fileUrls) {
      try {
        final response = await http.get(Uri.parse(fileUrl));
        if (response.statusCode == 200) {
          //로컬 임시저장소에 저장
          final tempDir = Directory.systemTemp;
          final filePath = '${tempDir.path}/${fileUrl.split('/').last}';
          final file = File(filePath);
          await file.writeAsBytes(response.bodyBytes);

          final assetEntity = await PhotoManager.editor.saveImageWithPath(
            filePath,
            title: filePath.split('/').last, // 파일명 추출
          );
          convertResult.add(SelectedImage(entity: assetEntity, file: null));
        }
      } catch (e) {
        print('파일 다운로드 실패');
      }
    }
    state = state.copyWith(selectedImages: convertResult);
  }

  bool addedImageCheck(SelectedImage image) {
    return state.selectedImages.any((e) => _addedImageCheck(image, e));
  }

  bool _addedImageCheck(SelectedImage image, SelectedImage compareImage) {
    return image.entity == compareImage.entity &&
        image.file == compareImage.file;
  }

  void setImageFromGallery(List<SelectedImage> images) {
    state = state.copyWith(selectedImages: images);
  }
}

enum ContentCategory {
  ALL('ALL'),
  LIFE('LIFE'),
  TRAFFIC('TRAFFIC'),
  SAFE('SAFE'),
  OTHER('OTHER');

  final String value;

  const ContentCategory(this.value);

  String getCategory() {
    switch (this) {
      case ContentCategory.LIFE:
        return '일상';
      case ContentCategory.TRAFFIC:
        return '교통';
      case ContentCategory.SAFE:
        return '치안';
      case ContentCategory.OTHER:
        return '기타';
      default:
        return '전체';
    }
  }

  static String getByValue(String value) {
    return ContentCategory.values
        .firstWhere((el) => el.value == value)
        .getCategory();
  }

  static String getNamedByCategory(String category) {
    return ContentCategory.values
        .firstWhere((el) => el.getCategory() == category)
        .name;
  }
}
