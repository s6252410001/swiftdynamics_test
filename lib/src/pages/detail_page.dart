import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../bloc/user_bloc/user_bloc.dart';
import '../models/userlist.dart';
import 'home_page.dart';

class DetailPage extends StatefulWidget {
  int numUser;


  DetailPage({Key? key, required this.numUser}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {

  final List<UserList> user = [];


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, userState) {
        return Scaffold(
          appBar: AppBar(
            title: Text("${userState.userList[widget.numUser].fullName}"),
          ),
          body: Center(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    top: 60,
                    bottom: 50,
                  ),
                  child: SizedBox(
                    height: 180,
                    width: 210,
                    child: CircleAvatar(
                      child: Image.network(
                          "https://icons.iconarchive.com/icons/hopstarter/soft-scraps/128/User-Executive-Green-icon.png"),
                    ),
                  ),
                ),
                Container(
                    child: Column(
                  children: [
                    _textDetail("FullName",
                        "${userState.userList[widget.numUser].fullName}"),
                    _textDetail(
                        "Email", "${userState.userList[widget.numUser].email}"),
                    _textDetail("Phone",
                        "${userState.userList[widget.numUser].numPhone}"),
                    _textDetail("House No.",
                        "${userState.userList[widget.numUser].hNum}"),
                    _textDetail("County",
                        "${userState.userList[widget.numUser].county}"),
                    _textDetail("District",
                        "${userState.userList[widget.numUser].district}"),
                    _textDetail("Province",
                        "${userState.userList[widget.numUser].province}"),
                    _textDetail("PostCode",
                        "${userState.userList[widget.numUser].postCode}"),
                    Padding(
                      padding: const EdgeInsets.only(top: 50),
                      child: ElevatedButton(
                        onPressed: () {
                          UserList user = userState.userList[widget.numUser];
                          confirmDialog(
                            context,
                            "Confirm Delete ?",
                                () {
                              context.read<UserBloc>().add(UserEventDelete(user: user));
                              showWarningDialog(context, "Delete Success", () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => HomePage(),
                                  ),
                                );
                              });
                            },
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Color.fromARGB(255, 255, 0, 0),
                        ),
                        child: Text(
                          "DELETE",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
              ],
            ),
          ),
        );
      },
    );
  }

  _textDetail(type, value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Text(
        "$type : $value",
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
      ),
    );
  }

  confirmDialog(context, String msg, VoidCallback onConfirm) {
    Alert(
      context: context,
      title: "Warning!!",
      desc: msg,
      image: Image.network(
        "https://icons.iconarchive.com/icons/custom-icon-design/flatastic-9/128/Warning-icon.png",
      ),
      buttons: [
        DialogButton(
          child: Text(
            "Confirm",
            style: TextStyle(color: Colors.black, fontSize: 20),
          ),
          onPressed: onConfirm,
          color: Color.fromARGB(255, 34, 184, 96),
          radius: BorderRadius.circular(5.0),
        ),
        DialogButton(
          child: Text(
            "Cancel",
            style: TextStyle(color: Colors.black, fontSize: 20),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
          color: Color.fromARGB(255, 255, 0, 0),
          radius: BorderRadius.circular(5.0),
        ),
      ],
    ).show();
  }

  showWarningDialog(context, String msg, VoidCallback onOK) {
    Alert(
      context: context,
      title: "Success!!",
      desc: msg,
      image: Image.network(
        "https://icons.iconarchive.com/icons/custom-icon-design/flatastic-2/128/success-icon.png",
      ),
      buttons: [
        DialogButton(
          child: Text(
            "OK",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: onOK,
          color: Color.fromARGB(255, 34, 184, 96),
          radius: BorderRadius.circular(5.0),
        ),
      ],
    ).show();
  }


}
