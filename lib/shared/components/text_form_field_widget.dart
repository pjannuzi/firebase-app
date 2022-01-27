import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFormFieldWidget extends StatefulWidget {
  final String hint;
  final String? value;
  final Function(String)? onChanged;
  final TextInputType? typeKeyboard;
  final bool? isPassword;
  final bool align;
  const TextFormFieldWidget({
    Key? key,
    required this.hint,
    this.onChanged,
    this.typeKeyboard,
    this.isPassword = false,
    this.value,
    this.align = false,
  }) : super(key: key);

  @override
  _TextFormFieldWidgetState createState() => _TextFormFieldWidgetState();
}

class _TextFormFieldWidgetState extends State<TextFormFieldWidget> {
  bool passwordVisible = false;
  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: widget.onChanged,
      textAlign: widget.align ? TextAlign.center : TextAlign.start,
      keyboardType: widget.typeKeyboard == null
          ? TextInputType.text
          : widget.typeKeyboard,
      obscureText: widget.isPassword! && !passwordVisible ? true : false,
      decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          hintText: widget.hint,
          suffixIcon: widget.isPassword!
              ? IconButton(
                  icon: Icon(
                    passwordVisible ? Icons.visibility : Icons.visibility_off,
                  ),
                  onPressed: () {
                    setState(() {
                      passwordVisible = !passwordVisible;
                    });
                  },
                )
              : Container(
                  width: 1,
                  height: 1,
                )),
    );
  }
}
