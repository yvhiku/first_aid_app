import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/constants/colors.dart';
import 'package:flutter_application_1/src/constants/image_strings.dart';
import 'package:flutter_application_1/src/constants/sizes.dart';
import 'package:flutter_application_1/src/constants/text_strings.dart';
import 'package:flutter_application_1/src/features/authentication/screens/contacts/contact_support.dart';
import 'package:flutter_application_1/src/features/authentication/screens/forget_password/otp/otp_screen.dart';
import 'package:get/get.dart';

class ForgetPassPhoneScreen extends StatelessWidget {
  ForgetPassPhoneScreen({super.key});

  final _formKey = GlobalKey<FormState>(); // Form key for validation
  final phoneController = TextEditingController(); // Controller for phone input

  // Phone validation regex (adjust according to your requirements)
  bool _isValidPhone(String phone) {
    return RegExp(r'^[0-9]{10,}$').hasMatch(phone);
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text(tOtpSubTitle),
        centerTitle: true,
        elevation: 0,
      ),
      body: Container(
        padding: EdgeInsets.all(tDefaultSize),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image(
                      image: AssetImage(tForgetPassPhoneImg),
                      height: height * 0.2,
                    ),
                    SizedBox(height: tDefaultSize + 20),
                    Text(
                      tForgotpass,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Poppins",
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Text(
                      tForgetPhoneSubTitle,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                        fontFamily: "Poppins",
                      ),
                    ),
                    SizedBox(height: 15.0),
                    TextFormField(
                      controller: phoneController,
                      keyboardType: TextInputType.phone,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your phone number';
                        } else if (!_isValidPhone(value)) {
                          return 'Enter a valid phone number (min 10 digits)';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        label: Text(tPhoneNum),
                        prefixIcon: Icon(Icons.phone),
                        labelStyle: TextStyle(color: tSecondaryColor),
                        border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 2.0,
                            color: tSecondaryColor,
                          ),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red, width: 2.0),
                        ),
                      ),
                    ),
                    SizedBox(height: 20.0),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            // If form is valid, proceed to OTP screen
                            Get.to(() => const OTPScreen());
                            // Optional: Show success message
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  'OTP sent to ${phoneController.text}',
                                ),
                                duration: Duration(seconds: 2),
                              ),
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: tPrimaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          padding: EdgeInsets.symmetric(vertical: 15.0),
                        ),
                        child: Text(
                          tNext,
                          style: TextStyle(
                            color: tCardBgColor,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              TextButton(
                onPressed: () => Get.to(() => const ContactSupportScreen()),
                child: Text.rich(
                  TextSpan(
                    text: tNeedHelp,
                    style: Theme.of(context).textTheme.bodyMedium,
                    children: [
                      TextSpan(
                        text: tContactSupport,
                        style: TextStyle(color: Colors.blue),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
