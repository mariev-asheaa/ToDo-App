import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {

    on<AuthEvent>((event, emit) async {
      if(event is LoginEvent){
        try {
          final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
              email: event.email,
              password: event.password
          );
          emit(LoginSuccess());
        }
        on FirebaseAuthException catch (e) {
          if (e.code == 'user-not-found') {
            print('No user found for that email.');
            emit(LoginFailur(errormessage: 'User not found'));
          } else if (e.code == 'wrong-password') {
            print('Wrong password provided for that user.');
            emit(LoginFailur(errormessage: 'Wrong password'));
          }
        }
      }


      else if(event is RegisterEvent){
        try {
          final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: event.email,
            password: event.password,
          );
          await credential.user!.sendEmailVerification();
          emit(EmailVerification());


          await Future.delayed(Duration(seconds: 2));
          while (!await FirebaseAuth.instance.currentUser!.reload().then((_) => FirebaseAuth.instance.currentUser!.emailVerified)) {
            await Future.delayed(Duration(seconds: 2));
          }
          emit(RegisterSuccess());

          // Adding user to Firestore
          String uid = credential.user!.uid;
          await FirebaseFirestore.instance.collection('users').doc(uid).set({
            'full_name': event.name,
            'email': event.email,
            'uid': uid,
          });


        } on FirebaseAuthException catch (e) {
          if (e.code == 'weak-password') {
            print('The password provided is too weak.');
            emit(RegisterFailur(errormessage: 'The password provided is too weak'));
          } else if (e.code == 'email-already-in-use') {
            print('The account already exists for that email.');
            emit(RegisterFailur(errormessage: 'The account already exists for that email.'));
          }
        } catch (e) {
          emit(RegisterFailur(errormessage: 'Something went wrong please try again'));
        }
      }

      else if (event is GoogleSignInEvent) {
        try {
          final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
          if (googleUser == null) {
            emit(GoogleSignInFailure(errormessage: "Google sign-in was canceled"));
            return;
          }
          final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

          final OAuthCredential credential = GoogleAuthProvider.credential(
            accessToken: googleAuth.accessToken,
            idToken: googleAuth.idToken,
          );
          final UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(credential);
          final User? user = userCredential.user;

          if (user != null) {
            DocumentReference userDoc = FirebaseFirestore.instance.collection('users').doc(user.uid);
            DocumentSnapshot userSnapshot = await userDoc.get();

            if (!userSnapshot.exists) {
              await userDoc.set({
                'full_name': user.displayName ?? "",
                'email': user.email,
                'phone':user.phoneNumber??'Add phone number',
                'uid': user.uid,
              });
            }
            emit(GoogleSignInSuccess());
          }
        } catch (e) {
          emit(GoogleSignInFailure(errormessage: "Google Sign-In failed: $e"));
        }
      }


      else if (event is SignOutEvent){
        GoogleSignIn googleSignin=GoogleSignIn();
        googleSignin.disconnect();
        await FirebaseAuth.instance.signOut();
      }
      else if(event is ForgetPasswordEvent){
        await FirebaseAuth.instance.sendPasswordResetEmail(email:event.email);
      }
    });
  }
}