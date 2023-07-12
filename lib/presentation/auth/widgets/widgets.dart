import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../utils/utils.dart';

class AuthWidget {
  ElevatedButton loginButton(BuildContext context,
      {required void Function()? onPressed,
      isContinue = true,
      isUpdate = false}) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          elevation: 5,
          shadowColor: Colors.black,
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
          fixedSize: Size(sW(context) / 1.5, 20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: const Text("Sign In"));
  }

  ElevatedButton verifyButton(BuildContext context, {isContinue = true}) {
    return ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          elevation: 5,
          shadowColor: Colors.black,
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
          fixedSize: Size(sW(context) / 2, 20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("verifying"),
            spaceWidth(15),
            const CupertinoActivityIndicator(
              color: Colors.white,
            )
          ],
        ));
  }

  Widget field({
    required cntr,
    required txt,
    required ic,
    Function()? onTap,
    ispsw = false,
  }) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        onTap: onTap,

        controller: cntr,
        validator: (value) {
          if (value!.isEmpty) {
            return "*required";
          } else {
            return null;
          }
        },
        // keyboardType: TextInputType.number,

        style: const TextStyle(fontSize: 11),

        decoration: InputDecoration(
          fillColor: Colors.grey[200],
          filled: true,
          // contentPadding: const EdgeInsets.symmetric(horizontal: 5),
          hintText: txt,
          errorStyle: const TextStyle(
            color: Colors.grey,
          ),
          hintStyle: const TextStyle(fontSize: 11, color: Colors.grey),
          suffixIcon: Icon(
            ic,
            size: 20,
            color: Colors.grey,
          ),
          errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey[200]!),
              borderRadius: BorderRadius.circular(10)),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey[200]!),
              borderRadius: BorderRadius.circular(10)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey[200]!),
              borderRadius: BorderRadius.circular(10)),
          focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey[200]!),
              borderRadius: BorderRadius.circular(10)),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey[200]!),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
