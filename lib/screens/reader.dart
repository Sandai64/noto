import 'package:flutter/material.dart';

class NotoScreenReader extends StatefulWidget
{
  const NotoScreenReader(this.title, { super.key });
  
  final String? title;

  @override
  State<NotoScreenReader> createState() => _NotoScreenReaderState();
}

class _NotoScreenReaderState extends State<NotoScreenReader>
{
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      body: SafeArea(
        child: Text("data -> title=${widget.title}")
      )
    );
  }
}