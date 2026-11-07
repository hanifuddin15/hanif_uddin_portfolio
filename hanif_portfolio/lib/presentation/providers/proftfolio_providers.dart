import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final activeSectionProvider = StateProvider<String>((ref) => 'hero');

class ScrollControllerNotifier extends StateNotifier<ScrollController> {
  ScrollControllerNotifier() : super(ScrollController());

  void scrollTo(double offset) {
    state.animateTo(
      offset,
      duration: const Duration(milliseconds: 650),
      curve: Curves.easeInOutCubic,
    );
  }
}

final scrollControllerProvider =
    StateNotifierProvider<ScrollControllerNotifier, ScrollController>((ref) {
  return ScrollControllerNotifier();
});
