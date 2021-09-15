import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

T useDisposable<T>({
  required T Function() create,
  required void Function(T disposable) dispose,
  List<Object>? keys
}) {
  return use(_DisposableHook<T>(
    create: create,
    dispose: dispose,
    keys: keys
  ));
}

class _DisposableHook<T> extends Hook<T> {
  final T Function() create;
  final void Function(T disposable) dispose;

  const _DisposableHook({
    required this.create,
    required this.dispose,
    List<Object>? keys
  }) : super(keys: keys);

  @override
  HookState<T, Hook<T>> createState() =>
      _DisposableHookState<T>();
}

class _DisposableHookState<T> extends HookState<T, _DisposableHook<T>> {
  late final T _value;


  @override
  void initHook() {
    _value = hook.create();
  }

  @override
  void dispose() {
    hook.dispose(_value);
  }

  @override
  T build(BuildContext context) {
    return _value;
  }
}
