import 'package:flutter/material.dart';

import '../../../config/constant/color_constant.dart';

class CustomTextFormField extends StatefulWidget {
  final TextEditingController? ctrl;
  final String? hintText;
  final TextInputType? keyboardType;
  final Widget? prefixIcon;
  final String? name;
  final String? validationMsg;
  final int? maxLines;
  final bool formSubmitted;

  const CustomTextFormField(
      {Key? key,
      this.ctrl,
      this.hintText,
      this.keyboardType,
      this.prefixIcon,
      this.maxLines,
      this.formSubmitted = false,
      this.name,
      this.validationMsg})
      : super(key: key);

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool isTouched = false;
  bool _passwordVisible = false;

  @override
  void initState() {
    super.initState();
    _passwordVisible = false;
  }

  validateInput(value) {
    if (isTouched || widget.formSubmitted) {
      if (value != null && value?.toString() != '') {
        // if (widget.name == 'email') {
        //   if (value.isEmpty) {
        //     widget.validationMsg;
        //   } else {
        //     const pattern =
        //         r'(^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9]+\.[a-zA-Z0-9-.]+$)';
        //     final regExp = RegExp(pattern);

        //     if (!regExp.hasMatch(value.toString())) {
        //       return "Please enter valid email";
        //     }
        //   }
        // }
        // if (widget.name == "password") {
        //   if (value.isEmpty) {
        //     widget.validationMsg;
        //   }
        // }
        return null;
      }
      return widget.validationMsg;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: const TextStyle(color: kPrimaryColor, fontSize: 15),
      controller: widget.ctrl,
      keyboardType: widget.keyboardType,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (value) {
        return validateInput(value);
      },
      obscureText: widget.name == "password" ? !_passwordVisible : false,
      obscuringCharacter: '*',
      decoration: InputDecoration(
        labelText: widget.hintText,
        filled: true,
        fillColor: kWhiteColor,
        contentPadding: const EdgeInsets.fromLTRB(38, 0, 10, 0),
        hintStyle: const TextStyle(color: kGreyColor),
        labelStyle: const TextStyle(color: kBlackColor),
        prefixIcon: widget.prefixIcon,
        suffixIcon: widget.name == "password"
            ? IconButton(
                splashColor: kTransparentColor,
                highlightColor: kTransparentColor,
                icon: Icon(
                  _passwordVisible ? Icons.visibility : Icons.visibility_off,
                  color: kPrimaryColor,
                  size: 18,
                ),
                onPressed: () {
                  setState(() {
                    _passwordVisible = !_passwordVisible;
                  });
                },
              )
            : null,
        border: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.grey, // Default border color
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: kErrorColor, // Default border color
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        errorStyle: const TextStyle(color: kErrorColor),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.grey, // Default border color
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.grey, // Default border color
          ),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      maxLines: widget.maxLines,
      onChanged: (value) => {
        isTouched = true,
      },
    );
  }
}
