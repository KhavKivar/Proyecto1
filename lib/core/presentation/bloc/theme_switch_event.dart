import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

enum ThemeAppEnum { dark, light }

abstract class ThemeSwitchEvent extends Equatable {
  const ThemeSwitchEvent();

  @override
  List<Object> get props => [];
}

class ThemeChanged extends ThemeSwitchEvent {
  const ThemeChanged({required this.theme});
  final ThemeAppEnum theme;

  @override
  List<Object> get props => [theme];
}
