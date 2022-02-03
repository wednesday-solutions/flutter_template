import 'dart:async';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/foundation/logger/logger.dart';
import 'package:flutter_template/presentation/entity/effect/effect.dart';
import 'package:flutter_template/presentation/entity/screen/screen.dart';
import 'package:flutter_template/presentation/entity/screen/screen_state.dart';
import 'package:rxdart/rxdart.dart';

abstract class BaseViewModel<SCREEN extends Screen,
    SCREEN_STATE extends ScreenState> extends StateNotifier<SCREEN_STATE> {
  final List<StreamSubscription> _streamSubscriptions =
      List.empty(growable: true);

  SCREEN? _screen;

  final _effectController = StreamController<Effect?>();

  Stream<Effect?> get effectStream => _effectController.stream;

  @protected
  onInit();

  @protected
  onBind(SCREEN? screen) {}

  BaseViewModel(SCREEN_STATE state) : super(state) {
    log.d("$runtimeType onInit.");
    onInit();
  }

  SCREEN? get screen => _screen;

  bind(SCREEN? screenData) {
    _screen = screenData;
    log.d("$runtimeType onBind.");
    onBind(screen);
  }

  setState(SCREEN_STATE Function(SCREEN_STATE state) reducer) {
    final newState = reducer(state);
    if (!const DeepCollectionEquality().equals(state, newState)) {
      state = newState;
    }
  }

  setEffect(Effect effect) {
    _effectController.add(effect);
    _effectController.add(null);
  }

  listen<T>({
    required Stream<T> stream,
    required void Function(T data) onData,
  }) {
    final subscription = stream.listen(onData);
    _streamSubscriptions.add(subscription);
  }

  listenDebounce<T>({
    required Stream<T> stream,
    required Duration debounceDuration,
    required void Function(T data) onData,
  }) {
    final subscription = stream.debounceTime(debounceDuration).listen(onData);
    _streamSubscriptions.add(subscription);
  }

  @override
  void dispose() {
    super.dispose();
    log.d("$runtimeType onDispose.");
    for (var subscription in _streamSubscriptions) {
      subscription.cancel();
    }
  }
}
