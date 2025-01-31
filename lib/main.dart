import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market/core/constant/key.dart';
import 'package:market/core/di/dependency_injection.dart';
import 'package:market/core/helper/bloc_observer.dart';
import 'package:market/market.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  setupGetIt();
  Bloc.observer = MyBlocObserver();
  await Supabase.initialize(
    url: KeySupabase.urlSupabase,
    anonKey: KeySupabase.apiKeySupabase,
  );
  runApp(const market());
}
