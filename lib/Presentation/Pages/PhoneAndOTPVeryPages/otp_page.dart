import 'package:flutter/material.dart';
import 'package:flutter_common_widgets/Data/Models/otp_model.dart';
import 'package:flutter_common_widgets/Logic/Providers/otp_provier.dart';
import 'package:flutter_common_widgets/Presentation/Pages/HomePages/home_page.dart';
import 'package:provider/provider.dart';

class OTPPage extends StatelessWidget {
  const OTPPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('OTP Page'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const SizedBox(height: 16),
          const Text(
            'OTP',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Consumer<OtpProvider>(builder: (context, value, child) {
            return Form(
              key: value.formKey,
              child: Column(
                children: [
                  TextFormField(
                    maxLength: 6,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your OTP';
                      } else if (value.length < 4) {
                        return 'Please enter valid OTP';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.number,
                    controller: value.otpController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter your OTP',
                    ),
                  ),
                  const SizedBox(height: 35),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      fixedSize: const Size(350, 50),
                    ),
                    onPressed: () {
                      if (value.formKey.currentState!.validate()) {
                        OTPModel otpModel = OTPModel(
                          userId: '1917',
                          otp: value.otpController.text,
                          adminId: '123456789',
                        );
                        value.otpVerify(
                          otpModel: otpModel,
                          onSuccess: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const HomePage(),
                              ),
                            );
                          },
                          onError: (error) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(error),
                              ),
                            );
                          },
                        );
                      }
                    },
                    child: value.isLoading == true
                        ? const CircularProgressIndicator(
                            color: Colors.deepPurple,
                          )
                        : const Text('Verify'),
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
