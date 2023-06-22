import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:noto/misc/logging.dart';
import 'package:noto/screens/about.dart';
import 'package:noto/screens/reader.dart';

class NotoScreenHome extends StatelessWidget
{
  const NotoScreenHome({ super.key });

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      // HEADER
      appBar: AppBar(
        title: const Text(
          'Noto',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w300
          ),
        ),
        actions: [
          IconButton(
            onPressed: () async {
                FilePickerResult? result = await FilePicker.platform.pickFiles();

                if ( result != null )
                {
                  File file = File(result.files.single.path!);
                  Logging.debug("user picked valid file : ${result.files.single.path}");
                }
              },
            icon: const Icon(LucideIcons.plus),
          ),

          IconButton(
            onPressed: () => { Navigator.of(context).push(MaterialPageRoute(builder: (context) => const NotoScreenAbout())) },
            icon: const Icon(LucideIcons.helpCircle)
          )
        ],
      ),

      body: const Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 8,
          vertical: 8,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Your books',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w300
              ),
            ),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    LucideIcons.ban,
                    size: 48,
                  ),
                  SizedBox(height: 16),
                  Text("Work In Progress · Not Implemented")
                ]
              )
            )
          ],
        ),
      )
    );
  }
}
