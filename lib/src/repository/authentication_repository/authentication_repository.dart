import 'package:cyclone/src/features/authentication/screens/on_boarding/on_boarding_screen.dart';
import 'package:cyclone/src/features/authentication/screens/school_select/school_select.dart';
import 'package:cyclone/src/features/authentication/screens/welcome/welcome_screen.dart';
import 'package:cyclone/src/features/core/screens/profile/profile.dart';
import 'package:cyclone/src/repository/authentication_repository/exceptions/signup_email_password_failure.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();


  //Variable
  final _auth = FirebaseAuth.instance;
  late final Rx<User?> firebaseUser;
  var verificationId = ''.obs;

  @override
  void onReady() {
    Future.delayed(const Duration(seconds: 6));
    firebaseUser = Rx<User?>(_auth.currentUser);
    firebaseUser.bindStream(_auth.userChanges());
    ever(firebaseUser, _setInitialScreen);
  }


  _setInitialScreen(User? user) {
    user == null ? Get.offAll(() => const OnBoardingScreen()) : Get.offAll(() => const ProfileScreen());
  }


  Future<void> phoneAuthentication(String phoneNumber) async {
    await _auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (credential) async {
        await _auth.signInWithCredential(credential);
      }, 
      codeSent: ((verificationId, resendToken) {
        this.verificationId.value = verificationId;
      }), 
      timeout: const Duration(seconds: 60),
      codeAutoRetrievalTimeout: ((verificationId) {
        this.verificationId.value = verificationId;
      }),
      verificationFailed: (e) {
        if (e.code == 'invalid-phone-number') {
          Get.snackbar('error', 'The provided phone number is not valid.', duration: const Duration(seconds: 5));
        } else {
          Get.snackbar('error', 'Something went wrong. Try again.', duration: const Duration(seconds: 5));
        }
      }, 

    );
  }

  Future<bool> verifyOTP (String otp) async {
    var credentials = await _auth.signInWithCredential(
      PhoneAuthProvider.credential(
        verificationId: verificationId.value, 
        smsCode: otp, 
      ),
    );
    return credentials.user != null ? true : false;
  }

  Future<void> createUserWithEmailAndPassword(String email, String password) async {
    try { 
     await _auth.createUserWithEmailAndPassword(email: email, password: password);
     Get.snackbar('success', 'User successfuly created!');
     firebaseUser.value != null ? Get.offAll(() => const SchoolSelectScreen()) : Get.to(() => const WelcomeScreen());
    } on FirebaseAuthException catch(e) {
      final ex = SignUpWithEmailAndpasswordFailure.code(e.code);
      Get.snackbar('FIREBASE AUTH EXCEPTION', ex.message, duration: const Duration(seconds: 5),);
      throw ex;
    }  catch (_) {
      const ex = SignUpWithEmailAndpasswordFailure();
      Get.snackbar('FIREBASE AUTH EXCEPTION', ex.message, duration: const Duration(seconds: 5));
      throw ex;
    }
  }

  Future<void> loginUserWithEmailAndPassword(String email, String password) async {
    try { 
     await _auth.signInWithEmailAndPassword(email: email, password: password);
    firebaseUser.value != null ? Get.offAll(() => const ProfileScreen()) : Get.to(() => const WelcomeScreen());
    } on FirebaseAuthException catch(e) {
      //login with email and password logic
    }  catch (_) {}
  }

  Future<void> logout() async => await _auth.signOut();
}