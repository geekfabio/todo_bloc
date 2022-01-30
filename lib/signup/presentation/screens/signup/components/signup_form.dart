import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_bloc/signup/presentation/screens/models/signup/user_model.dart';
import 'package:todo_bloc/signup/shared/themes/style.dart';
import 'package:todo_bloc/signup/shared/widgets/separator_box.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({Key? key}) : super(key: key);

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  bool isLoading = false;
  UserModel? model;
  final TextEditingController _controller = TextEditingController();
  final TextEditingController _controllerNome = TextEditingController();
  final TextEditingController _controllerAniversario = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Future<void> procurarNif(String value) async {
      isLoading = true;
      Future.delayed(const Duration(seconds: 3));
      var response = await http
          .get(Uri.parse('https://api.gov.ao/consultarBI/v2/?bi=$value'));
      var pardeJson = json.decode(response.body);
      if (response.statusCode == 200 &&
          pardeJson.toString().contains("ID_NUMBER")) {
        setState(() {
          model = UserModel.fromJson(pardeJson[0]);
          _controller.text = model!.iDNUMBER.toString();
          _controllerNome.text =
              model!.fIRSTNAME.toString() + " " + model!.lASTNAME.toString();
          _controllerAniversario.text = model!.bIRTHDATE.toString();
        });
      }
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
                "Numero do BI/NIF",
                textAlign: TextAlign.start,
                style: Theme.of(context).primaryTextTheme.bodyText1,
              ),
              const SeparatorBox.small(),
              if (isLoading == true)
                SizedBox(
                    width: 15,
                    height: 15,
                    child: CircularProgressIndicator(
                      color: Theme.of(context).primaryColor,
                    ))
            ],
          ),
          const SeparatorBox.small(),
          TextField(
            maxLength: 50,
            controller: _controller,
            decoration: const InputDecoration(
              counterText: "",
              constraints: BoxConstraints(maxWidth: 360, maxHeight: 40),
            ),
          ),
          const SeparatorBox.small(),
          Text(
            "Nome Completo",
            textAlign: TextAlign.start,
            style: Theme.of(context).primaryTextTheme.bodyText1,
          ),
          const SeparatorBox.small(),
          TextField(
            maxLength: 50,
            controller: _controllerNome,
            decoration: const InputDecoration(
              counterText: "",
              constraints: BoxConstraints(maxWidth: 360, maxHeight: 40),
            ),
          ),
          const SeparatorBox.small(),
          Text(
            "Data de Aniversario",
            textAlign: TextAlign.start,
            style: Theme.of(context).primaryTextTheme.bodyText1,
          ),
          const SeparatorBox.small(),
          TextFormField(
            maxLength: 50,
            key: const Key("field_nif"),
            controller: _controllerAniversario,
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
                procurarNif(_controller.text);
              });
            },
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  "Continuar  ",
                  style: TextStyle(color: Colors.white),
                ),
                Icon(CupertinoIcons.arrow_right, size: 16)
              ],
            ),
            style: TextButton.styleFrom(
              shape:
                  const RoundedRectangleBorder(borderRadius: Corners.mdBorder),
              maximumSize: const Size(360, 50),
              primary: Colors.white,
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
