import 'package:flutter/material.dart';

class DigimonCard extends StatelessWidget {
  final String name;
  final String level;
  final String imgUrl;
  const DigimonCard(
      {Key? key, required this.name, required this.level, required this.imgUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 90,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 2, 16, 2),
          child: Card(
            child: ListTile(
                title: Text(name),
                subtitle: Text(level),
                trailing: Image.network(
                  imgUrl,
                  frameBuilder:
                      (context, child, frame, wasSynchronouslyLoaded) {
                    if (wasSynchronouslyLoaded) {
                      return child;
                    }
                    return AnimatedOpacity(
                      opacity: frame == null ? 0 : 1,
                      duration: const Duration(seconds: 5),
                      curve: Curves.easeOut,
                      child: child,
                    );
                  },
                )),
          ),
        ));
  }
}
