import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:studet_clean_arch/core/app.dart';
import 'package:studet_clean_arch/core/network/hive_service.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized;
  HiveService().init();
  runApp(const ProviderScope(child: App()));
}
