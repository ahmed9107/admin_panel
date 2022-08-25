import 'package:estore_admin_panel/controllers/auth_controllers/login_controller.dart';
import 'package:estore_admin_panel/utils/class/handling_data_view.dart';
import 'package:estore_admin_panel/view/widgets/big_text.dart';
import 'package:estore_admin_panel/view/widgets/custom_button.dart';
import 'package:estore_admin_panel/view/widgets/custom_input_field.dart';
import 'package:estore_admin_panel/view/widgets/small_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: GetBuilder<LoginController>(
        builder: (controller) {
          return HandlingDataView(
            statusRequest: controller.statusRequest,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: screenHeight *0.05),
                  SizedBox(
                    height: screenHeight *0.20,
                    child: Center(child: Image.asset(
                      'assets/images/a.png',
                      color: Theme.of(context).primaryColorLight,
                      width: 100
                    )),
                  ),
                  const SizedBox(height: 15),
                  Container(
                    margin: const EdgeInsets.only(left: 15, right:15),
                    width: double.maxFinite,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        BigText(text: 'Welcome', size: 32),
                        SizedBox(height: 10),
                        SmallText(text: 'Sign in to your account'),
                      ],
                    ),
                  ),
                  const SizedBox(height: 25),
                  CustomInputField(
                    type: TextInputType.emailAddress,
                    hint: 'enterEmail'.tr,
                    controller:controller.emailController,
                    bgColor: controller.emailError
                      ? Colors.red.withOpacity(0.3)
                      : Theme.of(context).cardColor,
                    suffixIcon: Icons.email,
                  ),
                  CustomInputField(
                    type: TextInputType.text,
                    hint: 'enterPass'.tr,
                    obscure: controller.isHidePassword,
                    controller:controller.passwordController,
                    bgColor: controller.emptyError
                      ? Colors.red.withOpacity(0.3)
                      : Theme.of(context).cardColor,
                    suffixIcon: Icons.remove_red_eye,
                    showPass: () {controller.showPassword();},
                  ),
                  const SizedBox(height: 15),
                  CustomButtonAuth(
                    text: 'login'.tr, 
                    onPressed: () {
                      controller.login();
                    }
                  ),
                ],
              ),
            ),
          );
        }
      ),
    );
  }
}