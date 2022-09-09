import 'package:amorium/controller/auth/user_information_controller.dart';
import 'package:amorium/models/user_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const List<String> genders = ['Male', 'Female', 'Non Binary'];

class UserInformationScreen extends StatefulWidget {
  static const String routeName = '/user-information-screen';
  const UserInformationScreen({Key? key}) : super(key: key);

  @override
  State<UserInformationScreen> createState() => _UserInformationScreenState();
}

class _UserInformationScreenState extends State<UserInformationScreen> {
  final _formKey = GlobalKey<FormState>();
  String gender = '';
  String preference = '';

  UserModel user = UserModel(
    firstName: "",
    lastName: "",
    email: "",
    sex: "",
    preference: "",
    phoneNumber: "",
    profilePhoto: "",
  );

  void saveUserForm() {
    _formKey.currentState!.save();
    setState(() {
      // user.phoneNumber =
    });
    // send data to repo here
    print(user.toMap());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("User Information"),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  icon: Icon(Icons.person),
                  hintText: 'Enter your first name',
                  labelText: 'First Name',
                ),
                onSaved: (newValue) {
                  user.firstName = newValue!;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  icon: Icon(Icons.person),
                  hintText: 'Enter your last name',
                  labelText: 'Last Name',
                ),
                onSaved: (newValue) {
                  user.lastName = newValue!;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  icon: Icon(Icons.email),
                  hintText: 'Enter your email',
                  labelText: 'Email',
                ),
                keyboardType: TextInputType.emailAddress,
                onSaved: (newValue) {
                  if (newValue != null) user.email = newValue;
                },
              ),
              DropdownButtonFormField(
                hint: const Text("Select Gender"),
                isDense: true,
                items: genders
                    .map(
                      (e) => DropdownMenuItem(
                        value: e,
                        child: Text(e),
                      ),
                    )
                    .toList(),
                onChanged: (newValue) {
                  setState(
                    () {
                      if (newValue != null) gender = newValue as String;
                    },
                  );
                },
              ),
              DropdownButtonFormField(
                hint: const Text("Select Preference"),
                isDense: true,
                items: genders
                    .map(
                      (e) => DropdownMenuItem(
                        value: e,
                        child: Text(e),
                      ),
                    )
                    .toList(),
                onChanged: (newValue) {
                  setState(
                    () {
                      if (newValue != null) preference = newValue as String;
                    },
                  );
                },
              ),
              CupertinoButton.filled(
                onPressed: saveUserForm,
                child: const Text("NEXT"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
