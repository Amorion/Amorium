import 'package:amorium/common/utils/utils.dart';
import 'package:amorium/controller/auth/user_information_controller.dart';
import 'package:amorium/models/user_model.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

const List<String> sexs = ['Male', 'Female', 'Non Binary'];

class UserInformationScreen extends ConsumerStatefulWidget {
  static const String routeName = '/user-information-screen';
  const UserInformationScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<UserInformationScreen> createState() =>
      _UserInformationScreenState();
}

class _UserInformationScreenState extends ConsumerState<UserInformationScreen> {
  final _formKey = GlobalKey<FormState>();
  String sex = '';
  String preference = '';

  UserModel user = UserModel(
    firstName: "",
    lastName: "",
    email: "",
    sex: "",
    preference: "",
    phoneNumber: "X",
    profilePhoto: "X",
  );

  void saveUserForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      setState(() {
        // user.phoneNumber =
      });
      ref.read(userInformationControllerProvider).sendUserData(
            context: context,
            firstName: user.firstName,
            lastName: user.lastName,
            email: user.email,
            sex: user.sex,
            preference: user.preference,
          );
      print(user.toMap());
    }
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
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter a first name.";
                  }
                  return null;
                },
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
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter a last name.";
                  }
                  return null;
                },
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
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Email cannot be empty";
                  }
                  if (!EmailValidator.validate(value)) {
                    return "Enter a valid email.";
                  }
                  return null;
                },
              ),
              DropdownButtonFormField(
                hint: const Text("Select sex"),
                isDense: true,
                items: sexs
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
                      if (newValue != null) sex = newValue as String;
                    },
                  );
                },
                validator: (value) {
                  if (value == null) {
                    return "Please select a sex";
                  }
                  return null;
                },
                onSaved: (newValue) {
                  if (newValue != null) user.sex = sex;
                },
              ),
              DropdownButtonFormField(
                hint: const Text("Select Preference"),
                isDense: true,
                items: sexs
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
                onSaved: (newValue) {
                  if (newValue != null) user.preference = preference;
                },
                validator: (value) {
                  if (value == null) {
                    return "Please select a preference";
                  }
                  return null;
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
