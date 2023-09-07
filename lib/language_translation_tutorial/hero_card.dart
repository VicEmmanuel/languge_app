import 'package:flutter/material.dart';

class HeroCard extends StatelessWidget {
  final String name;

  final String born;

  final String bio;

  final String? imagePath;

  final String placeholderImagePath = 'assets/images/placeholder.jpg';

  const HeroCard({
    Key? key,
    this.name = '',
    this.born = '',
    this.bio = '',
    this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(2),
                child: Image.network(
                  "data:image/jpeg;base64,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",
                  width: 100,
                  height: 100,
                ),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 4),
                    child: Text(
                      name,
                      style: theme.textTheme.headline6,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 2, bottom: 4),
                    child: Text(
                      born.isEmpty ? '' : 'Born $born',
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.w300),
                    ),
                  ),
                  Text(
                    bio,
                    style: TextStyle(fontSize: 14),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
