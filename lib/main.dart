import 'package:flutter/material.dart';
import 'package:noto/screens/init.dart';
Future<void> main() async
{
  // Ensure we have Flutter's bindings available before accessing Isar & sharedPrefs
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const NotoApp());
}

class NotoApp extends StatelessWidget
{
  const NotoApp({ super.key });

  @override
  Widget build(BuildContext context)
  {
    return MaterialApp(
      home: const NotoScreenInit(),
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.amber
      ),
    );
  }
}
