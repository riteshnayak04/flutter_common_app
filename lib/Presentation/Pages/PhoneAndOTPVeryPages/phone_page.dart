import 'package:flutter/material.dart';
import 'package:flutter_common_widgets/Data/Models/phone_model.dart';
import 'package:flutter_common_widgets/Logic/Providers/phone_provier.dart';
import 'package:flutter_common_widgets/Presentation/Pages/PhoneAndOTPVeryPages/otp_page.dart';
import 'package:provider/provider.dart';

class PhonePage extends StatelessWidget {
  const PhonePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Phone Page'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const SizedBox(height: 16),
          Consumer<PhoneProvider>(builder: (context, value, child) {
            return Form(
              key: value.formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Email',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    maxLength: 10,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your phone number';
                      } else if (value.length < 10) {
                        return 'Please enter valid phone number';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.phone,
                    controller: value.phoneController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter your email',
                    ),
                  ),
                  const SizedBox(height: 35),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      fixedSize: const Size(350, 50),
                    ),
                    onPressed: () {
                      if (value.formKey.currentState!.validate()) {
                        PhoneModel phoneModel = PhoneModel(
                          deviceId: '21456789',
                          deviceType: 'android',
                          deviceToken: 'sdfsdf',
                          mobile: value.phoneController.text,
                          adminId: '2',
                        );
                        value.phoneVerify(
                          phoneModel: phoneModel,
                          onSuccess: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const OTPPage(),
                              ),
                            );
                            // snackbar
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                backgroundColor: Colors.green,
                                content: Text('Success'),
                              ),
                            );
                          },
                          onError: (error) {
                            // snackbar
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                backgroundColor: Colors.red,
                                content: Text(error),
                              ),
                            );
                          },
                        );
                      }
                    },
                    child: value.isLoading == true
                        ? const SizedBox(
                            height: 20,
                            width: 20,
                            child: CircularProgressIndicator(
                              color: Colors.deepPurple,
                            ),
                          )
                        : const Text('Log In'),
                  ),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }
}
