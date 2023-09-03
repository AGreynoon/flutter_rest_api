import 'package:flutter/material.dart';
import 'package:flutter_rest_api/model/user.dart';

class UserProfile extends StatelessWidget {
  final User profile;
  const UserProfile({required this.profile, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: ()=> Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: SingleChildScrollView(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.only(
                      top: 24 + MediaQuery.of(context).padding.top,
                      bottom: 24,
                    ),
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Image.network(profile.picture!.large!),
                        ),
                        const SizedBox(height: 15),
                        Text(profile.name!.first!, style: const TextStyle(fontSize: 30)),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30.0),
                  Card(
                    color: Colors.white,
                    margin: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
                    child: ListTile(
                      leading: const Icon(Icons.person),
                      title: Text(profile.fullName, style: const TextStyle(fontSize: 18)),
                    ),
                  ),
                  Card(
                    color: Colors.white,
                    margin: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
                    child: ListTile(
                      leading: const Text('Gender: '),
                      title: Text(profile.gender!, style: const TextStyle(fontSize: 18)),
                    ),
                  ),
                  Card(
                      color: Colors.white,
                      margin: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
                      child: ExpansionTile(
                        leading: const Icon(Icons.date_range_outlined),
                        title: const Text('Dob'),
                        children: [
                          ListTile(
                            leading: const Icon(Icons.cake_outlined),
                            title: Text(profile.dob!.date!.toString(),
                                style: const TextStyle(fontSize: 18)),
                          ),
                          ListTile(
                            leading: const Icon(Icons.person),
                            title: Text(profile.dob!.age!.toString(),
                                style: const TextStyle(fontSize: 18)),
                          ),
                        ],
                      )
                  ),
                  Card(
                    color: Colors.white,
                    margin: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
                    child: ListTile(
                      leading: const Icon(Icons.mail),
                      title: Text(profile.email!, style: const TextStyle(fontSize: 18)),
                    ),
                  ),
                  Card(
                    color: Colors.white,
                    margin: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
                    child: ListTile(
                      leading: const Icon(Icons.phone_android),
                      title: Text(profile.phone!, style: const TextStyle(fontSize: 18)),
                    ),
                  ),
                  Card(
                    color: Colors.white,
                    margin: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
                    child: ListTile(
                      leading: const Icon(Icons.phone),
                      title: Text(profile.cell!, style: const TextStyle(fontSize: 18)),
                    ),
                  ),
                  Card(
                    color: Colors.white,
                    margin: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
                    child: ListTile(
                      leading: const Icon(Icons.nat),
                      title: Text(profile.nat!, style: const TextStyle(fontSize: 18)),
                    ),
                  ),
                  Card(
                      color: Colors.white,
                      margin: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
                      child: ExpansionTile(
                        leading: const Icon(Icons.location_on_outlined),
                        title: const Text('Location'),
                        children: [
                          ListTile(
                            leading: const Text('Country: '),
                            title: Text(profile.location!.country!, style: const TextStyle(fontSize: 18)),
                          ),
                          ListTile(
                            leading: const Text('State: '),
                            title: Text(profile.location!.state!, style: const TextStyle(fontSize: 18)),
                          ),
                          ListTile(
                            leading: const Text('City: '),
                            title: Text(profile.location!.city!, style: const TextStyle(fontSize: 18)),
                          ),
                          ExpansionTile(
                            title: const Text('Street: '),
                            children: [
                              ListTile(
                                leading: const Text('Name: '),
                                title: Text(profile.location!.street!.name!, style: const TextStyle(fontSize: 18)),
                              ),
                              ListTile(
                                leading: const Text('Number: '),
                                title: Text(profile.location!.street!.number!.toString(), style: const TextStyle(fontSize: 18)),
                              ),
                            ],
                          ),
                          ListTile(
                            leading: const Text('Postcode: '),
                            title: Text(profile.location!.postcode!, style: const TextStyle(fontSize: 18)),
                          ),
                          ExpansionTile(
                            title: const Text('Coordinates: '),
                            children: [
                              ListTile(
                                leading: const Text('Latitude: '),
                                title: Text(profile.location!.coordinates!.latitude!, style: const TextStyle(fontSize: 18)),
                              ),
                              ListTile(
                                leading: const Text('Longitude: '),
                                title: Text(profile.location!.coordinates!.longitude!, style: const TextStyle(fontSize: 18)),
                              ),
                            ],
                          ),
                          ExpansionTile(
                            title: const Text('Time Zone: '),
                            children: [
                              ListTile(
                                leading: const Text('Offset: '),
                                title: Text(profile.location!.timezone!.offset!, style: const TextStyle(fontSize: 18)),
                              ),
                              ListTile(
                                leading: const Text('Description: '),
                                title: Text(profile.location!.timezone!.description!, style: const TextStyle(fontSize: 18)),
                              ),
                            ],
                          ),
                        ],
                      )
                  ),
                  Card(
                      color: Colors.white,
                      margin: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
                      child: ExpansionTile(
                        leading: const Icon(Icons.login),
                        title: const Text('Login'),
                        children: [
                          ListTile(
                            leading: const Icon(Icons.person),
                            title: Text(profile.login!.username!, style: const TextStyle(fontSize: 18)),
                          ),
                          ListTile(
                            leading: const Icon(Icons.lock),
                            title: Text(profile.login!.password!, style: const TextStyle(fontSize: 18)),
                          ),
                        ],
                      )
                  ),
                ],
              ),
          ),
        )
      ),
    );
  }

}
