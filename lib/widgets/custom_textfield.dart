import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quickensol_task/constants/colors.dart';

class CustomTextField extends StatefulWidget {
  final String placeholder;
  final String label;
  final bool isPassword;
  final TextEditingController controller;

  const CustomTextField({
    super.key,
    required this.placeholder,
    required this.label,
    this.isPassword = false,
    required this.controller,
  });

  @override
  State createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _obscureText = false;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.isPassword;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: GoogleFonts.dmSans(
            fontWeight: FontWeight.w700,
            fontSize: 16,
            color: grey,
          ),
        ),
        TextField(
          textAlign: TextAlign.start,
          controller: widget.controller,
          style: widget.isPassword
              ? _obscureText
                  ? widget.controller.text.isEmpty
                      ? GoogleFonts.dmSans(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        )
                      : GoogleFonts.dmSans(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 6)
                  : GoogleFonts.dmSans(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    )
              : GoogleFonts.dmSans(fontSize: 18, fontWeight: FontWeight.w700),
          obscureText: widget.isPassword ? _obscureText : false,
          decoration: InputDecoration(
            border: UnderlineInputBorder(
              borderSide: BorderSide(
                color: white,
              ),
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: white,
              ),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: black,
              ),
            ),
            suffixIcon: widget.isPassword
                ? IconButton(
                    icon: Icon(
                      _obscureText ? Icons.visibility_off : Icons.visibility,
                      color: Colors.grey[600],
                      size: 20,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },
                  )
                : null,
            hintText: widget.placeholder,
            hintStyle: GoogleFonts.poppins(
              fontSize: 18,
              color: Colors.grey[400],
            ),
          ),
        ),
      ],
    );
  }
}
