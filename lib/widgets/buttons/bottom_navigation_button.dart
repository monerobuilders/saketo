import 'package:flutter/material.dart';

class BottomNavigationButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;

  const BottomNavigationButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: SizedBox(
              width: double.infinity,
              height: 70,
              child: MaterialButton(
                onPressed: onPressed,
                color: Colors.black,
                textColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  text,
                  style: const TextStyle(
                    fontSize: 25,
                    fontFamily: 'nunito',
                    fontWeight: FontWeight.w700,
                  ),
                ),
              )),
        )
    );
  }
}
