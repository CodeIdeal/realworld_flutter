import 'package:flutter/widgets.dart';

class KeepAliveWidget extends StatefulWidget {
  final Widget child;

  const KeepAliveWidget(this.child, {Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _KeepAliveState();
}

class _KeepAliveState extends State<KeepAliveWidget>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return widget.child;
  }
}

Widget keepAliveWrapper({required Widget child}) => KeepAliveWidget(child);
