import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:shahadmartapplication/core/services/send_otp_to_back.dart';
import 'package:shahadmartapplication/screens/home_screen.dart';
import 'package:shahadmartapplication/screens/navigation_bar.dart';

class SendOtpToBackendScreen extends StatelessWidget {
  final String phoneNumber;

  const SendOtpToBackendScreen({super.key, required this.phoneNumber});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Enter OTP'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            OtpTextField(
              numberOfFields: 5,
              borderColor: Colors.red,
              showFieldAsBox: true,
              onCodeChanged: (String code) {
                //handle validation or checks here
              },
              onSubmit: (code) {
                // Callback when user has entered the OTP
                sendOtpToBackend( phoneNumber,code);
                // Navigate to the HomeScreen if OTP verification is successful
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NavBar(),
                  ),
                );
              }, // end onSubmit
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
