import 'package:flutter/material.dart';

class EditBox extends StatelessWidget {
  final String hint;
  final bool required;
  final Function(String)? onChange;
  final bool password;

  EditBox({required this.hint, this.required = false, this.onChange, this.password = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(4),
      child: TextFormField(
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          labelText: this.hint,
        ),
        obscureText: this.password,
        validator: (val){
          if (this.required && val!.isEmpty)
            return "field required";
        },
        onChanged: this.onChange,
      ),
    );
  }
}

class Button extends StatelessWidget {

  final String caption;
  final Function()? onPressed;
  final Icon? icon;

  Button({required this.caption, this.onPressed, this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(4),
      child: ElevatedButton(
        child: this.icon == null
          ? Text('$caption')
          : Row(
            children: [
              this.icon!,
              SizedBox(width: 5),
              Text('$caption')
            ],
          ),
        style: ButtonStyle(
          padding: MaterialStateProperty.resolveWith((states) => EdgeInsets.symmetric(horizontal: 28, vertical: 18))
        ),
        onPressed: this.onPressed, 
      ),
    );
  }
}

