import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:test_swift_dynamics_app/src/pages/home_page.dart';

import '../bloc/user_bloc/user_bloc.dart';
import '../models/userlist.dart';

class CreatePage extends StatefulWidget {
  const CreatePage({Key? key}) : super(key: key);

  @override
  State<CreatePage> createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  int currentStep = 0;
  TextEditingController fullName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController numPhone = TextEditingController();
  TextEditingController hNum = TextEditingController();
  TextEditingController county = TextEditingController();
  TextEditingController district = TextEditingController();
  TextEditingController province = TextEditingController();
  TextEditingController postCode = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create"),
      ),
      body: BlocProvider<UserBloc>(
        create: (context) => UserBloc(),
        child: Stepper(
          steps: getStep(),
          currentStep: currentStep,
          onStepContinue: () {
            final lastStep = currentStep == getStep().length - 1;
            if (lastStep) {
              final newUser = UserList(
                fullName: fullName.text,
                email: email.text,
                numPhone: numPhone.text,
                hNum: hNum.text,
                county: county.text,
                district: district.text,
                province: province.text,
                postCode: postCode.text,
              );
              final userEvent = UserEventCreate(user: newUser);
              BlocProvider.of<UserBloc>(context).add(userEvent);
              showWarningDialog(context, 'Create Success');
            }
            setState(() {
              currentStep += 1;
            });
          },
          onStepCancel:
          currentStep == 0 ? null : () => setState(() => currentStep -= 1),
        ),
      ),
    );
  }



  List<Step> getStep() => [
        Step(
          state: currentStep > 0 ? StepState.complete : StepState.indexed,
          isActive: currentStep >= 0,
          title: Text("About You"),
          content: Column(
            children: [
              _TextInput(fullName, "First Name"),
              _TextInput(email, "Email"),
              _TextInput(numPhone, "Telephone"),
            ],
          ),
        ),
        Step(
          state: currentStep > 1 ? StepState.complete : StepState.indexed,
          isActive: currentStep >= 1,
          title: Text("Address"),
          content: Column(
            children: [
              _TextInput(hNum, "House No."),
              _TextInput(county, "County"),
              _TextInput(district, "District"),
              _TextInput(province, "Province"),
              _TextInput(postCode, "PostCode"),
            ],
          ),
        ),
        Step(
          state: currentStep > 2 ? StepState.complete : StepState.indexed,
          isActive: currentStep >= 1,
          title: Text("Complete"),
          content: Column(
            children: [],
          ),
        ),
      ];

  _TextInput(control, hint) {
    return SizedBox(
      height: 65.0,
      child: TextField(
        controller: control,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          contentPadding: EdgeInsets.all(8),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              width: 1.0,
              color: Colors.grey,
            ),
            borderRadius: BorderRadius.circular(
              6.0,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              width: 2.0,
              color: Colors.grey,
            ),
            borderRadius: BorderRadius.circular(
              6.0,
            ),
          ),
          hintText: '$hint',
          hintStyle: TextStyle(
            fontSize: 13.0,
            fontWeight: FontWeight.bold,
            color: Colors.black45,
          ),
        ),
      ),
    );
  }

  showWarningDialog(context, msg) {
    Alert(
        context: context,
        title: "Success!!",
        desc: msg,
        image: Image.network(
          "https://icons.iconarchive.com/icons/custom-icon-design/flatastic-2/128/success-icon.png"
        ),
        buttons: [
          DialogButton(
            child: Text(
              "OK",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => HomePage(),
              ),
            ),
            color: Color.fromARGB(255, 34, 184, 96),
            radius: BorderRadius.circular(5.0),
          ),
        ]).show();
  }
}
