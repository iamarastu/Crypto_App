import 'package:crypto_app/core/Shared/Widgets/glassmorphism/glassmorphism.dart';
import 'package:flutter/material.dart';


class PFTextField extends StatefulWidget {
  final String hint;
  final TextEditingController controller;
  final TextInputType inputType;
  final bool obscureText;
  final TextInputAction inputAction;
  final Function validator;
  final Function onChanged;
  final bool enabled;
  String? errorText;

  PFTextField(
      {required this.hint,
      required this.controller,
      required this.onChanged,
      this.inputType = TextInputType.text,
      this.obscureText = false,
      required this.validator,
      required this.inputAction,
      this.enabled = true,
      this.errorText});

  _PFTextFieldState createState() => _PFTextFieldState();
}

class _PFTextFieldState extends State<PFTextField> {
  late Color currentColor = const Color(0xffffffff);

  Color baseColor = const Color(0xffffffff);
  Color errorColor = const Color(0xf8661C51);
  Color hintColor = Color.fromARGB(248, 150, 150, 150);
  bool isHidden = false;

  @override
  void initState() {
    super.initState();

    isHidden = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      child: Padding(
        padding: EdgeInsets.all(4),
        child: Glassmorphism(
          blur: 8,
          hasBorder: false,
          opacity: 0.1,
          radius: 16,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: TextField(
              obscureText: widget.obscureText,
              // onChanged: (text) {
              //   // if (widget != null) {
              //   widget.onChanged(text);
              //   // }

              //   setState(() {
              //     if (!widget.validator(text) || text.length == 0) {
              //       currentColor = errorColor;
              //     } else {
              //       currentColor = baseColor;
              //     }
              //   });
              // },
              keyboardType: widget.inputType,
              textInputAction: widget.inputAction,
              enabled: widget.enabled,
              controller: widget.controller,
              decoration: InputDecoration(
                hintStyle: TextStyle(
                  color: hintColor,
                  fontFamily: "OpenSans",
                  fontWeight: FontWeight.w300,
                ),
                border: InputBorder.none,
                hintText: widget.hint,
                errorText: widget.errorText,
              ),
            ),
          ),
          // if (!widget.obscureText)
          //   IconButton(
          //     icon: isHidden
          //         ? const Icon(Icons.password)
          //         : const Icon(Icons.abc),
          //     onPressed: () {
          //       isHidden = !isHidden;
          //     },
          //   )
        ),
      ),
    );
  }
}