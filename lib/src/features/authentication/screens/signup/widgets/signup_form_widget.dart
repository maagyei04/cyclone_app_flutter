import 'package:cyclone/src/constants/sizes.dart';
import 'package:cyclone/src/constants/text_strings.dart';
import 'package:flutter/material.dart';

class SignUpFormWidget extends StatelessWidget {
  const SignUpFormWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: tFormHeight - 10),
      child: Form(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    decoration: const InputDecoration(
                      label: Text(tFirstName),
                      prefixIcon: Icon(Icons.person_outline_outlined),
                    ),
                  ),
                ),
                const SizedBox(width: tFormHeight - 20,),
                Expanded(
                  child: TextFormField(
                    decoration: const InputDecoration(
                      label: Text(tLastName),
                      prefixIcon: Icon(Icons.person_outline_outlined),
                    ),
                  ),
                )
              ],
            ),

            const SizedBox(height: tFormHeight - 20,),

            TextFormField(
              decoration: const InputDecoration(
              label: Text(tPhoneNumber),
              prefixIcon: Icon(Icons.phone_android_outlined),
              ),
            ),
            
            const SizedBox(height: tFormHeight - 20,),
            
            TextFormField(
              decoration: const InputDecoration(
              label:Text(tEmail),
              hintText: tEmailHint,
              prefixIcon: Icon(Icons.email_outlined),
              ),
            ),
            
            const SizedBox(height: tFormHeight - 20,),
            
            TextFormField(
              decoration: const InputDecoration(
              label: Text(tPassword),
              prefixIcon: Icon(Icons.fingerprint),
              ),
            ),
            
            const SizedBox(height: tFormHeight - 20,),
            
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                child: Text(tSignup.toUpperCase()),
              ),
            )
          ],
        )
      ),
    );
  }
}