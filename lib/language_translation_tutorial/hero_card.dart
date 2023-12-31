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
                  "https://th.bing.com/th/id/OIP.Gf3H25kZENKPHzgwzAzmVQHaHa?w=213&h=213&c=7&r=0&o=5&pid=1.7",
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
