import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marketfeed_clone/common/constants/app_colors.dart';
import 'package:marketfeed_clone/common/widgets/button.dart';
import 'package:marketfeed_clone/common/widgets/styles.dart';
import 'package:marketfeed_clone/fetures/authentication/view_model/login_view_model.dart';
import 'package:marketfeed_clone/utils/dimensions.dart';
import 'package:provider/src/provider.dart';

class EmailInputs extends StatelessWidget {
  const EmailInputs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: context.watch<LoginViewModel>().isAccountSetup,
      child: Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Setup your account",
              style: GoogleFonts.roboto(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: context.getWidth(5),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              'All your stock market needs in one place',
              style: GoogleFonts.roboto(
                color: AppColors.textGrey,
                fontSize: context.getWidth(3),
              ),
            ),
            Form(
              key: context.read<LoginViewModel>().formKey,
              child: Column(
                children: [
                  context.spacing(height: 1),
                  TextFormField(
                    controller:
                        context.read<LoginViewModel>().usernameController,
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                    decoration: Styles().inputStyle('Username'),
                  ),
                  context.spacing(height: 2),
                  TextFormField(
                    controller: context.read<LoginViewModel>().emailController,
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                    keyboardType: TextInputType.emailAddress,
                    decoration: Styles().inputStyle('Email'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'pls fill this field';
                      } else {
                        if (!RegExp(
                                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(value)) {
                          return 'pls enter valid email';
                        }
                      }
                      return null;
                    },
                  ),
                ],
              ),
            ),
            const Spacer(flex: 2),
            context.watch<LoginViewModel>().loading
                ? CupertinoActivityIndicator()
                : Button(
                    label: 'Continue',
                    onTap: context.read<LoginViewModel>().accountSetup,
                  ),
          ],
        ),
      ),
    );
  }
}
