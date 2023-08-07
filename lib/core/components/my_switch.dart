import 'package:flutter/material.dart';

class MySwitch extends StatefulWidget {
  final bool? initValue;
  final Function onChanged;
  final Color? activeColor;

  const MySwitch({
    Key? key,
    required this.onChanged,
    this.initValue,
    this.activeColor,
  }) : super(key: key);

  @override
  State<MySwitch> createState() => _MySwitchState();
}

class _MySwitchState extends State<MySwitch> {
  late bool value;

  @override
  void initState() {
    if (widget.initValue == null) {
      value = false;
    } else {
      value = widget.initValue!;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Switch.adaptive(
      activeColor: widget.activeColor,
      value: value,
      onChanged: (bool? enabled) {
        if (enabled != null) {
          value = !value;
          setState(() {
            widget.onChanged(enabled);
          });
        }
      },
    );
  }
}
