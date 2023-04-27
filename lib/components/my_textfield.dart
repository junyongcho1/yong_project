import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final controller;
  final String hintText;
  final bool obscureText;
  const MyTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (val) => val!.isEmpty ? '이메일을 확인하세요.' : null,
      controller: controller,
      keyboardType: TextInputType.emailAddress,
      obscureText: obscureText,
      decoration: InputDecoration(
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade400),
          ),
          fillColor: Colors.grey.shade200,
          filled: true,
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.grey[500])),
    );
  }
}

class MyPasswordTextField extends StatelessWidget {
  final controller;
  final String hintText;
  final bool obscureText;
  const MyPasswordTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (val) => val!.isEmpty ? '비밀번호를 확인하세요.' : null,
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
          suffixIcon: const Icon(Icons.visibility_off),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade400),
          ),
          fillColor: Colors.grey.shade200,
          filled: true,
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.grey[500])),
    );
  }
}

////////////////////////
class MyphoneNumerTextField extends StatelessWidget {
  final controller;
  final String hintText;
  final bool obscureText;
  const MyphoneNumerTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (val) => val!.isEmpty ? '전화번호를 확인하세요.' : null,
      controller: controller,
      keyboardType: TextInputType.number, //키보드 숫자
      //onSaved: (val) => int.parse(val!),
      // onSaved: (String? controller) {
      //   int? intcontroller = int.tryParse(controller!); // 입력받은 값을 int로 변환
      //   print(intcontroller);
      // },
      obscureText: obscureText,
      decoration: InputDecoration(
          //suffixIcon: const Icon(Icons.visibility_off),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade400),
          ),
          fillColor: Colors.grey.shade200,
          filled: true,
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.grey[500])),
    );
  }
}

////////////////////////
class MyaddressTextField extends StatelessWidget {
  final controller;
  final String hintText;
  final bool obscureText;
  const MyaddressTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (val) => val!.isEmpty ? '주소를 확인하세요.' : null,
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
          //suffixIcon: const Icon(Icons.visibility_off),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade400),
          ),
          fillColor: Colors.grey.shade200,
          filled: true,
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.grey[500])),
    );
  }
}

////////////////////////
class MyageTextField extends StatelessWidget {
  final controller;
  final String hintText;
  final bool obscureText;
  const MyageTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
    //required onSaved,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (val) => val!.isEmpty ? '나이를 확인하세요.' : null,
      controller: controller,
      keyboardType: TextInputType.number, //키보드 숫자
      //onSaved: (val) => int.parse(val!),
      // onSaved: (String? value) {
      //   int? intValue = int.tryParse(value!); // 입력받은 값을 int로 변환
      //   print(intValue);
      // },
      obscureText: obscureText,
      decoration: InputDecoration(
          //suffixIcon: const Icon(Icons.visibility_off),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade400),
          ),
          fillColor: Colors.grey.shade200,
          filled: true,
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.grey[500])),
    );
  }
}

////////////////////////
class MydisplayNameTextField extends StatelessWidget {
  final controller;
  final String hintText;
  final bool obscureText;
  const MydisplayNameTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (val) => val!.isEmpty ? '닉네임를 확인하세요.' : null,
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
          //suffixIcon: const Icon(Icons.visibility_off),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade400),
          ),
          fillColor: Colors.grey.shade200,
          filled: true,
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.grey[500])),
    );
  }
}
