import 'package:flutter/material.dart';
import 'package:market/core/constant/key.dart';
import 'package:market/market.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  await Supabase.initialize(
    url: KeySupabase.urlSupabase,
    anonKey: KeySupabase.apiKeySupabase,
  );
  runApp(const market());
}
