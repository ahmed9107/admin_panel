import 'package:estore_admin_panel/controllers/auth_controllers/login_controller.dart';
import 'package:estore_admin_panel/utils/class/handling_data_view.dart';
import 'package:estore_admin_panel/utils/functions/input_validator.dart';
import 'package:estore_admin_panel/view/widgets/big_text.dart';
import 'package:estore_admin_panel/view/widgets/custom_button.dart';
import 'package:estore_admin_panel/view/widgets/custom_input_field.dart';
import 'package:estore_admin_panel/view/widgets/small_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LargeScreenLogin extends StatelessWidget {
  const LargeScreenLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<LoginController>(
        builder: (controller) {
          return HandlingDataView(
            statusRequest: controller.statusRequest,
            child: Form(
              key: controller.formstate,
              child: Container(
                width: double.maxFinite,
                height: double.maxFinite,
                color: Theme.of(context).primaryColor,
                child: Center(
                  child: Container(
                    width: 500,
                    height: 600,
                    padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 25),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Theme.of(context).scaffoldBackgroundColor,
                    ),
                    child: Column(
                      children: [
                        SizedBox(
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
                          hint: 'enterName'.tr,
                          controller:controller.nameController,
                          bgColor: Theme.of(context).backgroundColor,
                          suffixIcon: Icons.email,
                          title: 'Name',
                          validate: (val){
                            return inputValidator(val!, 3, 15, 'username');
                          },
                        ),
                        CustomInputField(
                          type: TextInputType.text,
                          hint: 'enterPass'.tr,
                          obscure: controller.isHidePassword,
                          controller:controller.passwordController,
                          bgColor: Theme.of(context).backgroundColor,
                          suffixIcon: Icons.remove_red_eye,
                          showPass: () {controller.showPassword();},
                          title: 'Password',
                          validate: (val){
                            return inputValidator(val!, 3, 30, 'password');
                          },
                        ),
                        const SizedBox(height: 15),
                        CustomButton(
                          text: 'login'.tr, 
                          onPressed: () {
                            controller.login();
                          }
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          );
        }
      ),
    );
  }
}