import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_bloc/signup/presentation/screens/models/signup/user_model.dart';
import 'package:todo_bloc/signup/shared/themes/style.dart';
import 'package:todo_bloc/signup/shared/themes/theme.dart';
import 'package:todo_bloc/signup/shared/widgets/separator_box.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({Key? key}) : super(key: key);

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    Future<void> procurarNif() async {
      isLoading = true;
      await Future.delayed(const Duration(seconds: 2));
      setState(() {
        isLoading = false;
      });
    }

    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                "Nome",
                textAlign: TextAlign.start,
                style: Theme.of(context).primaryTextTheme.bodyText1,
              ),
              const SeparatorBox.small(),
            ],
          ),
          const SeparatorBox.small(),
          const TextField(
            maxLength: 50,
            decoration: InputDecoration(
              counterText: "",
              constraints: BoxConstraints(maxWidth: 360, maxHeight: 40),
            ),
          ),
          const SeparatorBox.small(),
          Text(
            "Email",
            textAlign: TextAlign.start,
            style: Theme.of(context).primaryTextTheme.bodyText1,
          ),
          const SeparatorBox.small(),
          const TextField(
            maxLength: 50,
            obscureText: true,
            decoration: InputDecoration(
              counterText: "",
              constraints: BoxConstraints(maxWidth: 360, maxHeight: 40),
            ),
          ),
          const SeparatorBox.small(),
          Text(
            "Password",
            textAlign: TextAlign.start,
            style: Theme.of(context).primaryTextTheme.bodyText1,
          ),
          const SeparatorBox.small(),
          TextFormField(
            maxLength: 50,
            key: const Key("field_nif"),
            onChanged: (String value) {},
            decoration: const InputDecoration(
              counterText: "",
              constraints: BoxConstraints(maxWidth: 360, maxHeight: 40),
            ),
          ),
          const SeparatorBox.medium(),
          TextButton(
            onPressed: () {
              setState(() {
                procurarNif();
              });
            },
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Continuar   ",
                  style: TextStyle(color: Colors.white),
                ),
                if (isLoading == true)
                  SizedBox(
                      width: 15,
                      height: 15,
                      child: CircularProgressIndicator(
                        color: Theme.of(context).backgroundColor,
                      ))
                else
                  const Icon(CupertinoIcons.arrow_right, size: 16)
              ],
            ),
            style: TextButton.styleFrom(
              shape:
                  const RoundedRectangleBorder(borderRadius: Corners.mdBorder),
              maximumSize: const Size(360, 50),
              primary: Colors.white,
              enableFeedback: isLoading,
              backgroundColor: Theme.of(context).primaryColor,
              elevation: 1,
              minimumSize: const Size(355, 50),
            ),
          ),
        ],
      ),
    );
  }
}
