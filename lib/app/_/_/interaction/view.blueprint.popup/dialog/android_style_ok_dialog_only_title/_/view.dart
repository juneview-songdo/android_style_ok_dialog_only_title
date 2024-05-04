import 'package:flutter/material.dart';

import '../../../../../../../../main.dart';
import '_/state_child.dart';
import '_/state_mother.dart';

class NewView extends StatefulWidget {
  NewView(
      {super.key,
      required this.title,
      this.okLabel,
      required this.onOk});

  final String title;
  final String? okLabel;
  final VoidCallback onOk;

  @override
  State<NewView> createState() => StateChild();
}

class NewViewState extends State<NewView> with StateMother {
  @override
  Widget build(BuildContext context) {
    return Container(
        constraints: BoxConstraints(maxWidth: 300), // maxWidth
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.title)
                .textStyle(Theme.of(context).textTheme.headlineSmall!)
                .fontWeight(FontWeight.bold),
            Gap(20),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                    widget.onOk();
                  },
                  child:
                      Text(widget.okLabel ?? "OK").fontWeight(FontWeight.bold),
                ),
              ],
            ),
          ],
        ).padding(horizontal: 25, vertical: 30));
  }
}

main() async {
  return buildApp(
      appHome: NewView(
          title: 'Title',
          onOk: () {
            print('OK');
          }).center());
}
