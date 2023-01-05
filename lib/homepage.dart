import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http_methods/base_client.dart';
import 'package:http_methods/user.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.black,
        title: const Text('Http Methods'),
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Buttons(
                onPressed: () async {
                  var response = await BaseClient().get('user/');

                  if (response == null) {
                    log('null');
                    return;
                  }
                  log('Successfull');
                  var users = userFromJson(response);
                  log(users.length.toString());
                  log(response);
                },
                text: 'Get',
                color: Colors.green),
            const SizedBox(
              height: 10,
            ),
            Buttons(
                onPressed: () async {
                  var user = User(
                    name: 'naveen',
                  );
                  var response = await BaseClient().post('user/', user);
                  log(response);
                  if (response == null) {
                    log('null');
                    return;
                  }
                  log('Successfull');
                },
                text: 'Post',
                color: Colors.blue),
            const SizedBox(
              height: 10,
            ),
            Buttons(
                onPressed: () async {
                  var id = 5;
                  var user = User(
                    name: 'naveen',
                  );
                  var response = await BaseClient().put('user/$id', user);
                  log(response);
                  if (response == null) {
                    log('null');
                    return;
                  }
                  log('Successfull');
                },
                text: 'Put',
                color: Colors.orange),
            const SizedBox(
              height: 10,
            ),
            Buttons(
                onPressed: () async {
                  var id = 6;
                  var response = await BaseClient()
                      .delete('user/$id')
                      .catchError((err) {});

                  if (response == null) {
                    log('null');
                    return;
                  }
                  log('Successfull');
                },
                text: 'Delete',
                color: Colors.red),
          ],
        ),
      ),
    );
  }
}

class Buttons extends StatelessWidget {
  Buttons(
      {Key? key,
      required this.onPressed,
      required this.color,
      required this.text})
      : super(key: key);
  void Function()? onPressed;
  String text;
  Color color;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style:
          ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(color)),
      onPressed: onPressed,
      child: Text(text),
    );
  }
}
