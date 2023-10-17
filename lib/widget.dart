import 'package:flutter/material.dart';
import 'constant.dart';

class WidgetBtn extends StatelessWidget {
  const WidgetBtn({
    Key? key,
    required this.type,
    required this.title,
    required this.icon,
    required this.act,
    required this.color,
  }) : super(key: key);
  final String type;
  final String title;
  final IconData icon;
  final VoidCallback act;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return type == 'elevate'
        ? ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
                backgroundColor: color,
                padding: const EdgeInsets.symmetric(
                    horizontal: defaultPadding + 20 * 1.5, vertical: 15),
                textStyle:
                    const TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
            onPressed: act,
            icon: Icon(icon),
            label: Text(title),
          )
        : OutlinedButton.icon(
            style: OutlinedButton.styleFrom(
                foregroundColor: color,
                side: BorderSide(color: color, width: 1),
                padding: const EdgeInsets.symmetric(
                    horizontal: defaultPadding + 20 * 1.5, vertical: 15),
                textStyle:
                    const TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
            onPressed: act,
            icon: Icon(icon),
            label: Text(title),
          );
  }
}

class MyTextField extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blueAccent.shade100),
            ),
            fillColor: const Color.fromARGB(255, 238, 248, 253),
            filled: true,
            hintText: hintText,
            hintStyle: TextStyle(color: Colors.blueAccent[500])),
      ),
    );
  }
}

class MyButton extends StatelessWidget {
  final Function()? onTap;
  final String textBtn;
  const MyButton({super.key, required this.onTap, required this.textBtn});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(25),
        margin: const EdgeInsets.symmetric(horizontal: 25),
        decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(
            textBtn,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}

class MyButtonProps extends StatelessWidget {
  final Function()? onTap;
  final String textBtn;
  final bool progress;
  const MyButtonProps(
      {super.key,
      required this.onTap,
      required this.textBtn,
      required this.progress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(25),
        margin: const EdgeInsets.symmetric(horizontal: 25),
        decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: progress == false
              ? Text(
                  textBtn,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                )
              : const CircularProgressIndicator(),
        ),
      ),
    );
  }
}

class SquareTile extends StatelessWidget {
  final String imagePath;
  const SquareTile({
    super.key,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white),
        borderRadius: BorderRadius.circular(16),
        color: const Color.fromARGB(255, 238, 248, 253),
      ),
      child: Image.asset(
        imagePath,
        height: 40,
      ),
    );
  }
}
