library numeric_keyboard;

import 'package:flutter/material.dart';

typedef KeyboardTapCallback = void Function(String text);

class NumericKeyboard extends StatelessWidget {
  /// Color of the text [default = Colors.black]
  final Color textColor;

  /// Display a custom right icon
  final Icon? rightIcon;

  /// Action to trigger when right button is pressed
  final Function()? rightButtonFn;

  /// Display a custom left icon
  final Icon? leftIcon;

  /// Action to trigger when left button is pressed
  final Function()? leftButtonFn;

  /// Callback when an item is pressed
  final KeyboardTapCallback onKeyboardTap;

  /// Main axis alignment [default = MainAxisAlignment.spaceEvenly]
  final MainAxisAlignment mainAxisAlignment;

  /// The padding around the keyboard
  final EdgeInsets padding;

  /// The padding around the buttons
  final EdgeInsets? buttonPadding;

  /// Textstyle of the button labels
  final TextStyle? textStyle;

  /// This size (side length) of a button
  final double buttonSize;

  /// This border radius of a button
  final double borderRadius;

  NumericKeyboard(
      {Key? key,
      required this.onKeyboardTap,
      this.textColor = Colors.black,
      this.rightButtonFn,
      this.rightIcon,
      this.leftButtonFn,
      this.textStyle,
      this.leftIcon,
      this.buttonSize = 50,
      this.borderRadius = 45,
      this.buttonPadding,
      this.padding = const EdgeInsets.only(left: 32, right: 32, top: 20),
      this.mainAxisAlignment = MainAxisAlignment.spaceEvenly})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          ButtonBar(
            buttonPadding: buttonPadding,
            alignment: mainAxisAlignment,
            children: <Widget>[
              _calcButton('1'),
              _calcButton('2'),
              _calcButton('3'),
            ],
          ),
          ButtonBar(
            buttonPadding: buttonPadding,
            alignment: mainAxisAlignment,
            children: <Widget>[
              _calcButton('4'),
              _calcButton('5'),
              _calcButton('6'),
            ],
          ),
          ButtonBar(
            buttonPadding: buttonPadding,
            alignment: mainAxisAlignment,
            children: <Widget>[
              _calcButton('7'),
              _calcButton('8'),
              _calcButton('9'),
            ],
          ),
          ButtonBar(
            buttonPadding: buttonPadding,
            alignment: mainAxisAlignment,
            children: <Widget>[
              InkWell(
                  borderRadius: BorderRadius.circular(borderRadius),
                  onTap: leftButtonFn,
                  child: Container(alignment: Alignment.center, width: buttonSize, height: buttonSize, child: leftIcon)),
              _calcButton('0'),
              InkWell(
                  borderRadius: BorderRadius.circular(borderRadius),
                  onTap: rightButtonFn,
                  child: Container(alignment: Alignment.center, width: buttonSize, height: buttonSize, child: rightIcon))
            ],
          ),
        ],
      ),
    );
  }

  Widget _calcButton(String value) {
    return InkWell(
        borderRadius: BorderRadius.circular(borderRadius),
        onTap: () {
          onKeyboardTap(value);
        },
        child: Container(
          alignment: Alignment.center,
          width: buttonSize,
          height: buttonSize,
          child: Text(
            value,
            style: textStyle ?? TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: textColor),
          ),
        ));
  }
}
