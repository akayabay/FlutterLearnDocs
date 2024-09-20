import 'dart:ui';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:themedata_rvrpod/models/theme_data_model.dart';

// Easy level provider
final themeDataStateProvider = StateProvider<Brightness>((ref) => Brightness.dark);

// ChangeNotifer hard level provider
final themeDataNotiferProvider = ChangeNotifierProvider((ref) => ThemeDataModel());
