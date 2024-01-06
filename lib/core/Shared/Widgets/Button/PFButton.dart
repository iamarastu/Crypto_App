import 'package:flutter/material.dart';

class PFButton extends StatefulWidget {
  final VoidCallback onPressed;
  final bool isProcessing;
  final String title;
  final IconData? icon;
  final bool isSecondary;

  const PFButton({super.key, required this.onPressed, required this.isProcessing, required this.title, required this.icon, required this.isSecondary});

  @override
  _PFButtonState createState() => _PFButtonState();
}

class _PFButtonState extends State<PFButton> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140,
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(255, 48, 209, 117),
            blurRadius: _isPressed ? 0 : 16,
            blurStyle: BlurStyle.normal,
            offset: _isPressed ? const Offset(0, 0) : Offset(0, 8),
            spreadRadius: -1,
          ),
        ],
        color: widget.isSecondary ? Color(0xff583E68) : Colors.black,
        borderRadius: const BorderRadius.all(Radius.circular(24)),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: const BorderRadius.all(Radius.circular(24)),
          onTap: widget.onPressed,
          onTapDown: (_) {
            setState(() {
              _isPressed = true;
            });
          },
          onTapUp: (_) {
            setState(() {
              _isPressed = false;
            });
          },
          onTapCancel: () {
            setState(() {
              _isPressed = false;
            });
          },
          child: Ink(
            decoration: BoxDecoration(
              color: _isPressed ? Color.fromARGB(197, 21, 21, 21) : Colors.black,
              borderRadius: BorderRadius.all(Radius.circular(24)),
            ),
            child: Container(
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(vertical: 8),
              child: widget.isProcessing
                  ? Center(
                      child: Container(
                        height: 30,
                        width: 30,
                        child: const CircularProgressIndicator(
                          strokeWidth: 1.5,
                          color: Colors.white,
                        ),
                      ),
                    )
                  : Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            widget.title,
                            style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600),
                          ),
                          if (widget.icon != null)
                            Icon(
                              widget.icon,
                              size: 30,
                            )
                        ],
                      ),
                    ),
            ),
          ),
        ),
      ),
    );
  }
}