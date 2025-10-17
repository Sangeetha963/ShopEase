import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Global provider to manage app theme
final themeModeProvider = StateProvider<ThemeMode>((ref) => ThemeMode.light);
