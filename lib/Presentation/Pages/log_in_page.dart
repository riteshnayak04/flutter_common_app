import 'package:flutter/material.dart';
import 'package:flutter_common_widgets/Data/Models/log_in_model.dart';
import 'package:flutter_common_widgets/Data/Providers/log_in_provider.dart';
import 'package:flutter_common_widgets/Presentation/Pages/bottom_nav_bar_page.dart';
import 'package:flutter_common_widgets/Presentation/Utils/snack_bar.dart';
import 'package:provider/provider.dart';

class LogInPage extends StatelessWidget {
  const LogInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Log In'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const SizedBox(height: 16),
          Consumer<LogInProvider>(
            builder: (context, value, child) {
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
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email';
                        }
                        return null;
                      },
                      controller: value.emailController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter your email',
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Password',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        }
                        return null;
                      },
                      controller: value.passwordController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter your password',
                      ),
                    ),
                    const SizedBox(height: 35),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        fixedSize: const Size(350, 50),
                      ),
                      onPressed: () {
                        if (value.formKey.currentState!.validate()) {
                          value.logIn(
                            context: context,
                            logInModel: LogInModel(
                              email: value.emailController.text.trim(),
                              password: value.passwordController.text.trim(),
                            ),
                            onSuccess: () {
                              FocusScope.of(context).unfocus();
                              Navigator.popUntil(
                                  context, (route) => route.isFirst);
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const BottomNavBarPage(),
                                ),
                              );
                              SnackBarUtils.successSnackBar(
                                context,
                                'Log In success, email: ${value.emailController.text.trim()}',
                              );
                            },
                            onError: (error) {
                              FocusScope.of(context).unfocus();
                              SnackBarUtils.errorSnackBbar(context, error);
                            },
                          );
                        }
                      },
                      child: const Text('Log In'),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
