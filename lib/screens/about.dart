import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:noto/config/static.dart';
import 'package:noto/misc/logging.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class NotoScreenAbout extends StatefulWidget
{
  const NotoScreenAbout({ super.key });

  @override
  State<NotoScreenAbout> createState() => _NotoScreenAboutState();
}

class _NotoScreenAboutState extends State<NotoScreenAbout>
{
  String? _appVersion;

  _NotoScreenAboutState()
  {
    _setVersionNumber();
  }

  Future<void> _setVersionNumber() async
  {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    Logging.debug('PackageInfo -> Got app version ${packageInfo.version}');
    
    setState(() {
      _appVersion = packageInfo.version;
    });
  }

  Future<void> _launchURL(String rawPath) async
  {
    Uri uri = Uri.parse(rawPath);

    if ( await canLaunchUrl(uri) )
    {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
      return;
    }
    
    throw "E: Couldn't launch $uri";
  }

  @override
  Widget build(BuildContext context)
  {
    return Scaffold
    (
      appBar: AppBar(
        title: const Text('About Noto'),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'E-book reader app.',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16
              ),
            ),
            Text('Erwan EGASSE, version $_appVersion'),
            (kDebugMode)
            ? const Text("Build: debug")
            : const Text("Build: release"),
            const SizedBox(height: 8.0),
            const SizedBox(
              height: 1.5,
              width: 100.0,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: Colors.black26
                ),
              )
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () => {
                    _launchURL( NotoStatic.projectLinks["github"]! )
                  },
                  icon: const Icon(LucideIcons.github)
                ),
                IconButton(
                  onPressed: () => {
                    _launchURL( NotoStatic.projectLinks["gitlab"]! )
                  },
                  icon: const Icon(LucideIcons.gitlab)
                ),
                IconButton(
                  onPressed: () => {
                    _launchURL( NotoStatic.projectLinks["twitch"]! )
                  },
                  icon: const Icon(LucideIcons.twitch)
                ),
                IconButton(
                  onPressed: () => {
                    _launchURL( NotoStatic.projectLinks["instagram"]! )
                  },
                  icon: const Icon(LucideIcons.instagram)
                ),
              ],
            ),
            ElevatedButton.icon(
              onPressed: null,
              label: const Text("Go to documentation (WIP)"),
              icon: const Icon(LucideIcons.externalLink),
            )
          ]
        )
      )
    );
  }
}