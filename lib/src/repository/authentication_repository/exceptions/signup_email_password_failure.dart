class SignUpWithEmailAndpasswordFailure {
  final String message;

  const SignUpWithEmailAndpasswordFailure(
    [
      this.message = "An Unknown error occurred."
    ]
  );

  factory SignUpWithEmailAndpasswordFailure.code(String code) {
    switch(code) {
      case 'weak-password' : 
        return const SignUpWithEmailAndpasswordFailure('Please enter a stronger password.');
      case 'invalid-email' : 
        return const SignUpWithEmailAndpasswordFailure('Email is not valid or badly formatted.');
      case 'email-already-in-use' : 
        return const SignUpWithEmailAndpasswordFailure('An account already exists for thst email.');
      case 'operation-not-allowed' : 
        return const SignUpWithEmailAndpasswordFailure('operation is not allowed. Please contact support.');
      case 'user-disabled' : 
        return const SignUpWithEmailAndpasswordFailure('This user has been disabled. Please contact support for help.');
      default: 
        return const SignUpWithEmailAndpasswordFailure();
    }
  }
}  