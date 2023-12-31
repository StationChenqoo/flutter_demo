import 'package:flutter/material.dart';
import 'package:flutter_demo/model/SimpleKeyValue.dart';

class ItemsTopicJoinedWidget extends StatefulWidget {
  final List<SimpleKeyValue> datas;
  final onItemPress;
  final select;
  ItemsTopicJoinedWidget(
      {Key? key,
      required this.datas,
      required this.onItemPress,
      required this.select})
      : super(key: key);
  @override
  State<StatefulWidget> createState() => ItemsTopicJoinedState();
}

class ItemsTopicJoinedState extends State<ItemsTopicJoinedWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 32,
        padding: EdgeInsets.symmetric(horizontal: 6),
        child: ListView(
            scrollDirection: Axis.horizontal,
            children: widget.datas
                .map(
                  (e) => GestureDetector(
                      onTap: () {
                        widget.onItemPress(e);
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 6),
                        child: Text(
                          e.name,
                          style: TextStyle(
                              fontSize: 16,
                              color: widget.select == e.value
                                  ? Colors.black
                                  : Colors.grey,
                              fontWeight: widget.select == e.value
                                  ? FontWeight.w500
                                  : FontWeight.normal),
                        ),
                      )),
                )
                .toList()));
  }
}
