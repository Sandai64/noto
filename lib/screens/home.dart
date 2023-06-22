import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:noto/components/book_tile.dart';
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
            onPressed: () => true,
            icon: const Icon(LucideIcons.plus),
          ),

          IconButton(
            onPressed: () => { Navigator.of(context).push(MaterialPageRoute(builder: (context) => const NotoScreenAbout())) },
            icon: const Icon(LucideIcons.helpCircle)
          )
        ],
      ),
      // BODY
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 8,
                right: 8,
                bottom: 8,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Your books (WIP counter)',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w300
                    ),
                  ),
                  // CARDS COLUMN
                  NotoComponentsBookTile.image(
                    heading: 'À la recherche du temps perdu',
                    description: 'Marcel Proust',
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => const NotoScreenReader(
                      'title'
                    ))),
                    image: Image.asset(
                      'assets/img/dummy_vh.jpg',
                      width: 76,
                      height: 76,
                      cacheHeight: 76,
                      cacheWidth: 76,
                    ),
                  ),
                ],
              ),
            )
          ],
        )
      )
    );
  }
}
