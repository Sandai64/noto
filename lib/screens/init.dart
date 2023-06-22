import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:noto/db/book.dart';
import 'package:noto/screens/home.dart';
import 'package:noto/screens/onboarding.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NotoScreenInit extends StatelessWidget
{
  const NotoScreenInit({ super.key });

  @override
  Widget build(BuildContext context)
  {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) async
      {
        // Initialize database
        // final appDir = await getApplicationDocumentsDirectory();
        // final isar = await Isar.open(
        //   [BookSchema],
        //   directory: appDir.path,
        // );

        // Obtain shared preferences
        // final SharedPreferences shared_prefs = await SharedPreferences.getInstance();
        
        // Workaround using BuildContext across asynchronous gaps
        if (context.mounted)
        {
          // Direct user to onboarding
          Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => NotoScreenOnboarding()), (_) => false);
          
          // Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => const NotoScreenHome()), (_) => false);
        }
          


        // final newUser = User()..name = 'Jane Doe'..age = 36;

        // await isar.writeTxn(() async {
        //   await isar.users.put(newUser); // insert & update
        // });

        // final existingUser = await isar.users.get(newUser.id); // get

        // await isar.writeTxn(() async {
        //   await isar.users.delete(existingUser.id!); // delete
        // });
      }
    );

    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(strokeWidth: 1.5),
      ),
    );
  }
}