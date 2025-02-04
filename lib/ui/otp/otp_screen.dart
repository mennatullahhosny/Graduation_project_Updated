import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/ui/Home_Screen/home_screen.dart';
import 'package:graduation_project/ui/Theme/theme.dart';
import 'package:graduation_project/ui/otp/cubit/otp_cubit.dart';
import 'package:graduation_project/ui/otp/text_filed_otp.dart';
import 'package:graduation_project/ui/sign_up_screen/sign_up_screen.dart';
import 'package:graduation_project/ui/sing_in_screen/sign_in_screen.dart';

class OtpScreen extends StatefulWidget {
  static const String routName = 'otp';

  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final TextEditingController _otpController1 = TextEditingController();
  final TextEditingController _otpController2 = TextEditingController();
  final TextEditingController _otpController3 = TextEditingController();
  final TextEditingController _otpController4 = TextEditingController();
  final TextEditingController _otpController5 = TextEditingController();

  final String email = "example@gmail.com"; // هنجيب الإيميل من الشاشة السابقة

  void _submitOtp() {
    String otp = _otpController1.text +
        _otpController2.text +
        _otpController3.text +
        _otpController4.text +
        _otpController5.text;

    if (otp.length == 5) {
      context.read<OtpCubit>().verifyOtp(email, otp);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Please enter a valid OTP")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final String email = ModalRoute.of(context)?.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.of(context).pushReplacementNamed(HomeScreen.routName);
          },
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Icon(
              Icons.arrow_back_ios,
              color: MyTheme.blackColor,
              size: 30,
            ),
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title: Text(
          "Enter OTP",
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Enter The Confirmation Code",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),
            const SizedBox(height: 30),
            Center(
              child: Form(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: 80,
                      width: 70,
                      child: TextFiledOtpScreen(controller: _otpController1),
                    ),
                    SizedBox(
                      height: 80,
                      width: 70,
                      child: TextFiledOtpScreen(controller: _otpController2),
                    ),
                    SizedBox(
                      height: 80,
                      width: 70,
                      child: TextFiledOtpScreen(controller: _otpController3),
                    ),
                    SizedBox(
                      height: 80,
                      width: 70,
                      child: TextFiledOtpScreen(controller: _otpController4),
                    ),
                    SizedBox(
                      height: 80,
                      width: 70,
                      child: TextFiledOtpScreen(controller: _otpController5),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              "Verification code has been sent to your email",
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(fontSize: 18),
            ),
            const SizedBox(height: 20),
            BlocConsumer<OtpCubit, OtpState>(
              listener: (context, state) {
                if (state is OtpSuccess) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("OTP Verified Successfully!")),
                  );
                  // TODO: توجيه المستخدم للشاشة التالية
                } else if (state is OtpError) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(state.message)),
                  );
                }
              },
              builder: (context, state) {
                if (state is OtpLoading) {
                  return Center(child: CircularProgressIndicator());
                }
                return ElevatedButton(
                  onPressed: _submitOtp,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(11),
                    backgroundColor: MyTheme.orangeColor,
                  ),
                  child: Text(
                    "Continue",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
