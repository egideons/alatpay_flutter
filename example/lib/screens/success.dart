import 'package:flutter/material.dart';

import '../src/my_app_bar.dart';

class SuccessScreen extends StatefulWidget {
  const SuccessScreen({Key? key}) : super(key: key);

  @override
  State<SuccessScreen> createState() => _SuccessScreenState();
}

class _SuccessScreenState extends State<SuccessScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: MyAppBar(
          title: "", elevation: 10, actions: [], backgroundColor: Colors.white),
      body: SafeArea(
          child: Center(
        child: Text("Payment Successful !!"),
      )),
    );
  }
}
