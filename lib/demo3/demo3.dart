import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'demo3.g.dart';

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

class PreviousButton extends ConsumerWidget {
  const PreviousButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 如果不是第一页，那么前一页按钮可用
    // final bool canGoToPreviousPage = ref.watch(pageIndexProvider) != 0;
    // 上面这段代码的问题是，每当我们更改当前页面时，“previous”按钮将重新构建。
    // 在理想情况下，我们希望按钮仅在激活和停用之间更改时重新构建。所以将逻辑从widget中抽离出来
    final bool canGoToPreviousPage = ref.watch(canGoToPreviousPageProvider);
    //
    void goToPreviousPage() {
      ref.read(pageIndexProvider.notifier).goToPreviousPage();
    }

    return ElevatedButton(
      onPressed: canGoToPreviousPage ? goToPreviousPage : null,
      child: const Text('上一页'),
    );
  }
}

void demo3() {
  runApp(const ProviderScope(child: MaterialApp(home: NewWidget())));
}

class NewWidget extends ConsumerWidget {
  const NewWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final int pageIndex = ref.watch(pageIndexProvider);

    return Column(
      children: [
        Text("当前在第$pageIndex页"),
        Row(
          children: [
            const PreviousButton(),
            ElevatedButton(
                onPressed: () {
                  ref.read(pageIndexProvider.notifier).goToNextPage();
                },
                child: const Text("下一页")),
          ],
        ),
      ],
    );
  }
}
//这个例子主要讲的是将canGoToPreviousPage逻辑从widget中抽离到provider中,
// 利用provider的特性,只有canGoToPreviousPage变化时,才会重新构建widget,
// 来提高性能,避免不必要的重绘
