import 'package:cyclone/src/features/authentication/screens/on_boarding/on_boarding_screen.dart';
import 'package:cyclone/src/features/authentication/screens/school_select/school_select.dart';
import 'package:cyclone/src/features/authentication/screens/welcome/welcome_screen.dart';
import 'package:cyclone/src/features/core/screens/home/home.dart';
import 'package:cyclone/src/repository/authentication_repository/exceptions/signup_email_password_failure.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();


  //Variable
  final _auth = FirebaseAuth.instance;
  late final Rx<User?> firebaseUser;

  @override
  void onReady() {
    Future.delayed(const Duration(seconds: 6));
    firebaseUser = Rx<User?>(_auth.currentUser);
    firebaseUser.bindStream(_auth.userChanges());
    ever(firebaseUser, _setInitialScreen);
  }


  _setInitialScreen(User? user) {
    user == null ? Get.offAll(() => const OnBoardingScreen()) : Get.offAll(() => const HomeScreen());
  }

  Future<void> createUserWithEmailAndPassword(String email, String password) async {
    try { 
     await _auth.createUserWithEmailAndPassword(email: email, password: password);
     firebaseUser.value != null ? Get.offAll(() => const SchoolSelectScreen()) : Get.to(() => const WelcomeScreen());
    } on FirebaseAuthException catch(e) {
      final ex = SignUpWithEmailAndpasswordFailure.code(e.code);
      // ignore: avoid_print
      print('FIREBASE AUTH EXCEPTION - ${ex.message}');
      throw ex;
    }  catch (_) {
      const ex = SignUpWithEmailAndpasswordFailure();
      // ignore: avoid_print
      print('FIREBASE AUTH EXCEPTION - ${ex.message}');
      throw ex;
    }
  }

  Future<void> loginUserWithEmailAndPassword(String email, String password) async {
    try { 
     await _auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch(e) {
      
    }  catch (_) {}
  }

  Future<void> logout() async => await _auth.signOut();
}