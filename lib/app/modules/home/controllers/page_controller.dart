import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PagesController extends GetxController {
  RxList<bool> statuses = [true, false, false].obs;
  PageController initialScreenController = PageController(keepPage: true);
  RxInt initialPageControllerIndex = 0.obs;
  int get initialPageIndex => initialPageControllerIndex.value;
  List<bool> get statusesValue => statuses.value;
  void updateStatus(int index, bool status) {
    statuses[index] = status;
  }

  void reset() {
    initialPageControllerIndex.value = 0;
    statuses.clear();
    statuses.addAll([true, false, false]);
  }

  void updateInitialIndex(int index) {
    initialPageControllerIndex.value = index;
  }

  Future<void> animateInitialPageToPrevious() async {
    initialPageControllerIndex.value = initialPageIndex - 1;
    await initialScreenController.previousPage(
      duration: 500.milliseconds,
      curve: Curves.easeIn,
    );
  }

  Future<void> animateInitialPageToNext() async {
    initialPageControllerIndex.value = initialPageIndex + 1;

    await initialScreenController.nextPage(
        duration: 500.milliseconds, curve: Curves.easeIn);
  }

  Future<void> forceAnimateToSecureWalletScreen() async {
    statuses = [true, true, false].obs;
    initialPageControllerIndex.value = 1;
    await initialScreenController.animateToPage(1,
        duration: 500.milliseconds, curve: Curves.easeIn);
  }

  @override
  void onClose() {}
  @override
  void onReady() {
    super.onReady();
  }
}
