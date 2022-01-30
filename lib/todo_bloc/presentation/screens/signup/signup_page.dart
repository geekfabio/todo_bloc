import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_bloc/todo_bloc/shared/themes/light_color.dart';
import 'package:todo_bloc/todo_bloc/shared/themes/style.dart';
import 'package:todo_bloc/todo_bloc/shared/widgets/ripple_extension.dart';
import 'package:todo_bloc/todo_bloc/presentation/screens/signup/components/signup_form.dart';
import 'package:todo_bloc/todo_bloc/shared/themes/theme.dart';
import 'package:todo_bloc/todo_bloc/shared/widgets/separator_box.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  @override
  Widget build(BuildContext context) {
    Widget _topText() {
      return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(
          children: [
            Icon(
              Icons.shield,
              color: Theme.of(context).iconTheme.color,
            ).ripple(() {}),
            Text(
              " TodoBloc®",
              style: Theme.of(context)
                  .primaryTextTheme
                  .subtitle1!
                  .copyWith(fontWeight: FontWeight.w600),
            ),
          ],
        ),
        const SeparatorBox.large(
          scale: 3.2,
        ),
        Text(
          "See TodoBloc in Action",
          style: Theme.of(context)
              .primaryTextTheme
              .subtitle2!
              .copyWith(fontWeight: FontWeight.w600),
        ),
        const SeparatorBox.medium(),
        SizedBox(
            width: AppTheme.screenWidth(context) / 3.1,
            child: AnimatedTextKit(
              animatedTexts: [
                TypewriterAnimatedText(
                  'see how TodoBloc can help you continiously improve your cuber securtiy rating, detect exposures and control risk!',
                  textStyle: Theme.of(context).primaryTextTheme.bodyText1,
                  speed: TransitionTimes.veryFast,
                ),
              ],
              totalRepeatCount: 4,
              pause: TransitionTimes.medium,
              displayFullTextOnTap: true,
              stopPauseOnTap: false,
            )),
        const SeparatorBox.medium(scale: 2),
      ]);
    }

    //TODO Refatorar Isto
    var fakeSlideDots = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
            width: 10,
            height: 10,
            margin: const EdgeInsets.symmetric(horizontal: 5),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(25)),
              color: LightColor.primaryColor,
            )),
        Container(
            width: 10,
            height: 10,
            margin: const EdgeInsets.symmetric(horizontal: 5),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(25)),
              color: LightColor.lightGrey,
            )),
        Container(
            width: 10,
            height: 10,
            margin: const EdgeInsets.symmetric(horizontal: 5),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(25)),
              color: LightColor.lightGrey,
            )),
      ],
    );
    print(AppTheme.screenHeight(context));
    return Scaffold(
      body: SafeArea(
          child: Row(
        children: [
          Expanded(
              child: Container(
            color: Theme.of(context).backgroundColor,
            child: Container(
              margin: const EdgeInsets.only(left: 40, right: 40, top: 40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _topText(),
                  const SignupForm(),
                  const SeparatorBox.xLarge(),
                  if (AppTheme.screenHeight(context) > 700)
                    Flexible(child: SizedBox(width: 360, child: fakeSlideDots))
                ],
              ),
            ),
          )),
          if (AppTheme.screenWidth(context) > 700)
            Expanded(
                child: Container(
              decoration:
                  const BoxDecoration(gradient: LightColor.colorGradientGrey),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/images/signup_ilustration.png",
                    width: AppTheme.screenWidth(context) / 1.5,
                    height: AppTheme.screenHeight(context) / 1.5,
                  ),
                  const SeparatorBox.xSmall(),
                  SizedBox(
                    width: AppTheme.screenWidth(context) / 3.1,
                    child: const Text(
                      'see how TodoBloc can help you continiously improve your cuber securtiy rating, detect exposures and control risk!',
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ))
        ],
      )),
    );
  }
}
