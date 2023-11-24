// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';

// class PhoneNumberScreen extends StatefulWidget {
//   const PhoneNumberScreen({super.key});

//   @override
//   State<PhoneNumberScreen> createState() => _PhoneNumberScreenState();
// }

// class _PhoneNumberScreenState extends State<PhoneNumberScreen> {
//   TextEditingController phoneController = TextEditingController();
//   TextEditingController otpCodeController = TextEditingController();

//   FirebaseAuth auth = FirebaseAuth.instance;
//   String verifycationIDReceived = '';
//   bool otpCodeVisible = false;
//   String error = 'chưa có gì';

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Phone OTP'),
//       ),
//       body: Container(
//         margin: const EdgeInsets.all(10),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             TextField(
//               controller: phoneController,
//               decoration: const InputDecoration(labelText: 'Phone'),
//               keyboardType: TextInputType.phone,
//             ),
//             const SizedBox(height: 10),
//             Visibility(
//               visible: otpCodeVisible,
//               child: TextField(
//                 controller: otpCodeController,
//                 decoration: const InputDecoration(labelText: 'Code'),
//               ),
//             ),
//             const SizedBox(height: 10),
//             ElevatedButton(
//               child: Text(otpCodeVisible ? 'Login' : 'Verify'),
//               onPressed: () {
//                 if (otpCodeVisible) {
//                   verifyCode();
//                 } else {
//                   _verifyPhone();
//                 }
//               },
//             ),
//             Text(error),
//           ],
//         ),
//       ),
//     );
//   }

//   _verifyPhone() async {
//     await FirebaseAuth.instance.verifyPhoneNumber(
//       phoneNumber: '+84${phoneController.text.trim()}',
//       verificationCompleted: (PhoneAuthCredential credential) async {
//         await FirebaseAuth.instance.signInWithCredential(credential).then(
//           (value) async {
//             if (value.user != null) print('dang nhap thanh cong');
//           },
//         );
//       },
//       verificationFailed: (FirebaseAuthException exception) {
//         print(exception.message);
//       },
//       codeSent: (verificationId, forceResendingToken) {
//         verifycationIDReceived = verificationId;
//         otpCodeVisible = true;
//         setState(() {});
//       },
//       codeAutoRetrievalTimeout: (String verificationId) {
//         verifycationIDReceived = verificationId;
//       },
//       timeout: Duration(seconds: 60),
//     );
//   }

//   void verifyNumber() {
//     try {
//       auth.verifyPhoneNumber(
//         phoneNumber: phoneController.text.trim(),
//         verificationCompleted: (PhoneAuthCredential credential) async {
//           await auth.signInWithCredential(credential).then(
//             (value) {
//               print('dang nhap thanh cong');
//             },
//           );
//         },
//         verificationFailed: (FirebaseAuthException exception) {
//           setState(() {
//             print(exception.message);
//             error = exception.message.toString();
//           });
//         },
//         codeSent: (String verificationID, int? resendToken) {
//           verifycationIDReceived = verificationID;
//           otpCodeVisible = true;
//           setState(() {});
//         },
//         codeAutoRetrievalTimeout: (String verificationId) {},
//       );
//     } on FirebaseAuthException catch (e) {
//       print(e.message);
//     }
//   }

//   void verifyCode() async {
//     PhoneAuthCredential credential = PhoneAuthProvider.credential(
//       verificationId: verifycationIDReceived,
//       smsCode: otpCodeController.text,
//     );

//     await auth.signInWithCredential(credential).then((value) {
//       print('dang nhap thanh cong');
//     });
//   }
// }
