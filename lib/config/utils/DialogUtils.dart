import 'package:flutter/material.dart';

void showSimpleAlert(
  BuildContext context,
  String title,
  String content, {
  String btnPositive = 'OK',
  Function()? btnPositiveCallback,
  String btnNegative = 'Cancel',
  Function()? btnNegativeCallback,
}) {
  var alert = AlertDialog(
    title: Text(title,
        style: Theme.of(context)
            .textTheme
            .titleMedium
            ?.copyWith(color: Colors.black87, fontWeight: FontWeight.bold)),
    content: Text(content, style: Theme.of(context).textTheme.bodyMedium),
    actions: <Widget>[
      TextButton(
        onPressed: btnPositiveCallback ??
            () {
              Navigator.of(context).pop();
            },
        child: Text(btnPositive, style: Theme.of(context).textTheme.labelLarge),
      )
    ],
  );

  if (btnNegativeCallback != null) {
    alert.actions?.add(
      TextButton(
        onPressed: btnNegativeCallback,
        child: Text(btnNegative, style: Theme.of(context).textTheme.labelLarge),
      ),
    );
  }

  showDialog(context: context, builder: (BuildContext context) => alert);
}
