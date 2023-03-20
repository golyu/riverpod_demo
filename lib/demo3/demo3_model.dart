part of '../model/models.dart';

@riverpod
class PageIndex extends _$PageIndex {
  @override
  int build() => 0;

  //跳转上一页
  void goToPreviousPage() {
    state = state - 1;
  }

  //跳转下一页
  void goToNextPage() {
    state = state + 1;
  }
}

// 一个计算是否允许用户跳转到上一页的provider,类似于vue中的computed
@riverpod
bool canGoToPreviousPage(CanGoToPreviousPageRef ref) {
  return ref.watch(pageIndexProvider) != 0;
}
