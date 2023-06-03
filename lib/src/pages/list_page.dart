import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_swift_dynamics_app/src/bloc/user_bloc/user_bloc.dart';
import 'package:test_swift_dynamics_app/src/pages/detail_page.dart';

class ListPage extends StatefulWidget {
  const ListPage({Key? key}) : super(key: key);

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text("List View"),
          bottom: TabBar(
            tabs: [
              Tab(text: 'User'),
              Tab(text: 'Province'),
            ],
          ),
        ),
        body: BlocBuilder<UserBloc, UserState>(
          builder: (context, userState) {
            return TabBarView(
              children: [
                ListView.separated(
                  separatorBuilder: (context, index) {
                    return Divider(height: 5, color: Colors.grey);
                  },
                  itemCount: userState.userList.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text("${userState.userList[index].fullName}"),
                      subtitle: Text("${userState.userList[index].province}"),
                      leading: Icon(Icons.person, size: 60),
                      trailing: Icon(Icons.arrow_forward_ios),
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailPage(numUser: index),
                        ),
                      ),
                    );
                  },
                ),
                ListView.separated(
                  separatorBuilder: (context, index) {
                    return Divider(height: 5, color: Colors.grey);
                  },
                  itemCount: userState.userList.length,
                  itemBuilder: (context, index) {
                    final sortedList = userState.userList.toList()
                      ..sort((a, b) => a.province.compareTo(b.province));

                    final user = sortedList[index];

                    return ListTile(
                      title: Text("${user.fullName}"),
                      subtitle: Text("${user.province}"),
                      leading: Icon(Icons.person, size: 60),
                      trailing: Icon(Icons.arrow_forward_ios),
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailPage(numUser: index),
                        ),
                      ),
                    );
                  },
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
