# AlatPay Payment SDK  

A package for integrating alatpay payment gateway for flutter.

## Developer

[Chukwuoma Gideon Chimemerie](https://gideonchukwuoma.vercel.app/)

[![Linkedin Badge](https://img.shields.io/badge/-Gideon-black?style=for-the-badge&logo=Linkedin&logoColor=white&link=https://www.linkedin.com/in/gideonchukwuoma/)](https://www.linkedin.com/in/gideonchukwuoma/)
[![Twitter Badge](https://img.shields.io/badge/-@egideonchuks-1ca0f1?style=for-the-badge&logo=twitter&logoColor=white&link=https://twitter.com/egideonchuks)](https://mobile.twitter.com/egideonchuks)
[![My Badge](https://img.shields.io/badge/-Gideon.Chukwuoma.Chimemerie-green?style=for-the-badge&logo=Google-Chrome&logoColor=white&link=https://gideonchukwuoma.vercel.app/)](https://gideonchukwuoma.vercel.app/)

## Installation

To use this package, add `alatpay_flutter` as a [dependency in your pubspec.yaml file](https://flutter.io/platform-plugins/).

```yaml
dependencies:
  alatpay_flutter:
```

## Example

How to use the flutter_alatpay package.

```dart

import 'dart:io';

import 'package:alatpay_flutter/alatpay_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

import 'screens/success.dart';
import 'src/constants.dart';
import 'src/controllers.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AlatPay Flutter',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: kAccentColor),
        useMaterial3: true,
      ),
      home: const PaymentScreen(),
    );
  }
}

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
//============= Boolean variables ===============\\
  bool isLoading = false;

//============= Function ===============\\
  void pay() {
    String apiKey = "alatPayPrimaryKey";
    String businessId = "alatPayBuinessId";
    String email = "johndoe@gmail.com";
    String phone = "+2348047589684";
    String firstName = "John";
    String lastName = "Doe";
    String currency = 'NGN';
    String amount = "20000";

    setState(() {
      isLoading = true;
    });

    //=========== Not so important ===========\\

    // Map meta = {
    //   "the_order_id": "order_id",
    //   'client_id': "user_id"
    // };

    //=========== End =============\\
    try {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) {
          return AlatPayWidget(
            apiKey: apiKey,
            businessId: businessId,
            email: email,
            phone: phone,
            firstName: firstName,
            lastName: lastName,
            currency: currency,
            amount: amount,
            // metaData: meta,
            onClose: () {
              Get.close(2);
            },
            onTransaction: (response) async {
              //============ Do something =============\\
              Get.to(const SuccessScreen());
            },
          );
        }),
      );
      setState(() {
        isLoading = false;
      });
    } on SocketException {
      ApiProcessorController.errorSnack("Please connect to the internet");
    } catch (e) {
      consoleLog(e.toString());
    }
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 10,
        title: Text(
          "AlatPay",
          style: TextStyle(
            color: Theme.of(context).appBarTheme.backgroundColor,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SafeArea(
          child: Center(
        child: ElevatedButton(
          onPressed: pay,
          style: ElevatedButton.styleFrom(
            disabledBackgroundColor: Colors.grey.shade300,
            backgroundColor: Theme.of(context).primaryColor,
            elevation: 10,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            shadowColor: Colors.black.withOpacity(0.4),
          ),
          child: isLoading
              ? const Padding(
                  padding: EdgeInsets.all(10),
                  child: CircularProgressIndicator(color: Colors.white),
                )
              : const Text(
                  "Pay now",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontFamily: "Sen",
                    fontWeight: FontWeight.w700,
                  ),
                ),
        ),
      )),
    );
  }
}

```
