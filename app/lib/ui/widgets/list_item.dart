import 'package:flutter/material.dart';

// The base class for the different types of items the List can contain
abstract class ListItem {}

// A ListItem that contains data to display a heading
class HeadingItem implements ListItem {
  final String heading;

  HeadingItem(this.heading);
}

class HeadingTile extends StatelessWidget {
  final HeadingItem item;
  
  HeadingTile(this.item);
  
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(left: 18, top: 20, bottom: 8),
        child: Text(
          item.heading,
          style: Theme.of(context).textTheme.title.apply(
              color: Colors.yellowAccent.shade700,
              fontWeightDelta: 1,
          ),
        )
    );
  }
}

// A ListItem that contains data to display a message
class TextItem implements ListItem {
  final String title;
  final String body;

  TextItem(this.title, this.body);
}

class TextTile extends StatefulWidget {
  final TextItem item;

  TextTile(this.item);

  @override
  State createState() => TextTileState(item);
}

class TextTileState extends State<TextTile> {
  final TextItem item;

  TextTileState(this.item);

  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    return new Card(
        shape: BeveledRectangleBorder(),
        color: Colors.white,
        elevation: 2,
        child: InkWell(
          onTap: () {
            setState(() {
              _expanded = !_expanded;
            });
          },
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget> [
              Container(
                  padding: EdgeInsets.symmetric(horizontal: 18, vertical: 12),
                  child: Text(
                    item.title,
                    style: Theme.of(context).textTheme.body1.apply(
                        fontSizeFactor: 1.2
                    ),
                  ),
              ),
              Container(
                color: Colors.grey.shade300,
                height: 1,
              ),
            ]
          )
        ),
        margin: EdgeInsets.all(0),
    );
  }
}