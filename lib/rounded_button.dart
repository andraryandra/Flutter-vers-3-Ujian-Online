import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final String btnText;
  final Function onBtnPreseed;

  const RoundedButton(
      {Key? key, required this.btnText, required this.onBtnPreseed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5,
      color: Color.fromARGB(255, 86, 1, 245),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: MaterialButton(
          onPressed: () {
            onBtnPreseed();
          },
          minWidth: 320,
          height: 60,
          child: Text(
            btnText,
            style: const TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
      ),
    );
  }
}
