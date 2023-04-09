import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tuterritorio/core/presentation/bloc/theme_switch_event.dart';
import 'package:tuterritorio/core/presentation/bloc/theme_switch_state.dart';
import 'package:tuterritorio/core/theme/theme.dart';

class ThemeBloc extends Bloc<ThemeSwitchEvent, ThemeState> {
  @override
  ThemeBloc() : super(ActiveThemeState(theme: ThemeAppEnum.light)) {
    on<ThemeChanged>((event, emit) async {
      emit(ActiveThemeState(theme: event.theme));
    });
  }
}
