import 'package:daepiro/domain/usecase/sponsor/delete_cheer_usecase.dart';
import 'package:daepiro/domain/usecase/sponsor/get_cheer_comment_list_usecase.dart';
import 'package:daepiro/domain/usecase/sponsor/get_sponsor_list_usecase.dart';
import 'package:daepiro/domain/usecase/sponsor/modify_cheer_usecase.dart';
import 'package:daepiro/domain/usecase/sponsor/write_cheer_usecase.dart';
import 'package:daepiro/presentation/sponsor/sponsor_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final sponsorStateNotifierProvider = StateNotifierProvider<SponsorViewModel, SponsorState>((ref) {
  return SponsorViewModel(ref);
});

class SponsorViewModel extends StateNotifier<SponsorState> {
  final StateNotifierProviderRef<SponsorViewModel, SponsorState> ref;

  SponsorViewModel(this.ref) : super(SponsorState()) {
    getSponsorList();
    getCheerCommentList();
  }


  // 후원목록 조회
  Future<void> getSponsorList() async {
    try {
      final response = await ref.read(
          getSponsorListUsecaseProvider(GetSponsorListUsecase()).future
      );

      state = state.copyWith(
        sponsorList: response.data ?? []
      );
    } catch (error) {
      print('후원목록 조회 에러: $error');
      state = state.copyWith(isLoading: false);
    }
  }

  // 응원메세지 조회
  Future<void> getCheerCommentList() async {
    try {
      final response = await ref.read(
          getCheerCommentListUsecaseProvider(GetCheerCommentListUsecase()).future
      );

      state = state.copyWith(
          cheerCommentList: response.data ?? []
      );
    } catch (error) {
      print('응원메세 조회 에러: $error');
      state = state.copyWith(isLoading: false);
    }
  }

  // 응원메세지 작성
  Future<void> writeCheerMessage(String message) async {
    try {
      final response = await ref.read(
          writeCheerUsecaseProvider(WriteCheerUsecase(content: message)).future
      );

      if (response.code == 1000) {
        getCheerCommentList();
      }
    } catch (error) {
      print('응원메세지 작성 에러: $error');
    }
  }

  // 응원메세지 수정
  Future<void> modifyCheerMessage(
      String message,
      String id
  ) async {
    try {
      final response = await ref.read(
          modifyCheerUsecaseProvider(ModifyCheerUsecase(
              content: message,
              id: id
          )).future
      );

      if (response.code == 1000) {
        getCheerCommentList();
      }
    } catch (error) {
      print('응원메세지 수정 에러: $error');
    }
  }

  // 응원메세지 삭제
  Future<void> deleteCheerMessage({required String id}) async {
    try {
      final response = await ref.read(
          deleteCheerUsecaseProvider(DeleteCheerUsecase(
              id: id
          )).future
      );

      if (response.code == 1000) {
        getCheerCommentList();
      }
    } catch (error) {
      print('응원메세지 삭제 에러: $error');
    }
  }

}
