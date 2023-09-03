import 'package:flutter/material.dart';
import 'package:flutter_rest_api/model/user.dart';
import 'package:flutter_rest_api/screen/profile.dart';
import 'package:flutter_rest_api/services/user_api.dart';


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<User> users = [];
  bool searchBoolean = false;
  bool isLoading = true;
  List<User> searched_users = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchUsers();
  }

  Future<void>fetchUsers() async{
    final response = await UserApi.fetchUsers();
    setState(() {
      users = response;
      searched_users = users;
      isLoading = false;
    });
  }
  void searchUsers(String query) {
    if (query.isEmpty) {
      setState(() {
        searched_users = users;
      });
    } else {
      setState(() {
        searched_users = users.where((user) {
          final fullName = user.fullName.toLowerCase();
          return fullName.contains(query.toLowerCase());
        }).toList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: !searchBoolean ? const Text('Rest Api Call') : searchTextField(),
          centerTitle: true,
          actions: !searchBoolean
              ? [
            IconButton(
                icon: const Icon(Icons.search),
                onPressed: () {
                  setState(() {
                    searchBoolean = true;
                  });
                })
          ]
              : [
            IconButton(
                icon: const Icon(Icons.clear),
                onPressed: () {
                  setState(() {
                    searchBoolean = false;
                    searched_users = users;
                  });
                }
            )
          ]
      ),
      body: Visibility(
        visible: isLoading,
          replacement: RefreshIndicator(
            onRefresh: fetchUsers,
            child: ListView.builder(
                itemCount: searched_users.length,
                itemBuilder: (context, index){
                  final user = searched_users[index];
                  return ListTile(
                    leading: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(80),
                        child: Image.network(user.picture!.large!),
                      ),
                    ),
                    title: Text(user.fullName),
                    onTap: (){
                      Navigator.push(context,
                          MaterialPageRoute(builder:
                              (context) => UserProfile(profile: user)));
                    },
                  );
                }
            ),
          ),
        child:const Center(child: CircularProgressIndicator()),
      ),
    );
  }
  Widget searchTextField() {
    return TextField(
      onChanged: searchUsers,
      autofocus: true,
      cursorColor: Colors.black,
      style: const TextStyle(
        color: Colors.black,
        fontSize: 20,
      ),
      textInputAction: TextInputAction.search,
      decoration: const InputDecoration(
        enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white)
        ),
        focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white)
        ),
        hintText: 'Search',
        hintStyle: TextStyle(
          color: Colors.black,
          fontSize: 20,
        ),
      ),
    );
  }
}
