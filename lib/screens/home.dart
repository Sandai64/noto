import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:noto/components/book_tile.dart';
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

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Your books',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w300
              ),
            ),
            const SizedBox(height: 8),
            // ENUMERATE BOOKS HERE
            NotoComponentsBookTile.image(
              heading: 'Les fleurs du mal',
              description: "1857 · Charles Baudelaire",
              image: Image.asset("assets/img/dummy_vh.jpg", cacheHeight: 100, cacheWidth: 100, height: 100, width: 100,)
            ),
          ],
        ),
      )
    );
  }
}
