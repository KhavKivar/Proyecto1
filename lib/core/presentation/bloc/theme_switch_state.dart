import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import 'theme_switch_event.dart';

abstract class ThemeState extends Equatable {
  const ThemeState();

  @override
  List<Object> get props => [];
}

class ActiveThemeState extends ThemeState {
  const ActiveThemeState({required this.theme});
  final ThemeAppEnum theme;
  @override
  List<Object> get props => [theme];
}
