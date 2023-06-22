import 'package:flutter/material.dart';

// ignore: must_be_immutable
class NotoComponentsBookTile extends StatelessWidget
{
  Route<Object?>? materialPageRoute;
  
  late String _heading;
  late String _description;
  late void Function()? onTap;
  
  // Optional w/ alternate constructor
  Image? _image;

  NotoComponentsBookTile({
    MaterialPageRoute? materialPageRoute,
    required String heading,
    required String description,
    this.onTap,
    super.key
  })
  {
    _heading = heading;
    _description = description;
  }

  NotoComponentsBookTile.image({
    MaterialPageRoute? materialPageRoute,
    required String heading,
    required String description,
    required Image image,
    this.onTap,
    super.key
  })
  {
    _heading = heading;
    _description = description;
    _image = image;
  }

  @override
  Widget build(BuildContext context)
  {
    return Card(
      elevation: 1.0,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: InkWell(
          borderRadius: BorderRadius.circular(8),
          onTap: onTap,
          child: Row(
            children: [
              _image ?? const SizedBox.shrink(),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        _heading,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      Text(
                        _description,
                        overflow: TextOverflow.ellipsis,
                      )
                    ],
                  )
                )
              ),
            ]
          )
        ),
      )
    );    
  }
}

