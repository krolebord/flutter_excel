import 'package:flutter/material.dart';
import 'package:flutter_excel/hooks/use_disposable_hook.dart';

ScrollController useCustomScrollController(
  ScrollController Function() create,
  {List<Object>? keys}
) {
  return useDisposable(
    create: create,
    dispose: (controller) => controller.dispose()
  );
}