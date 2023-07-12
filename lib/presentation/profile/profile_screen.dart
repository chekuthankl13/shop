import 'package:flutter/material.dart';
import 'package:task/logic/bloc_export.dart';
import 'package:task/models/auth/auth_model.dart';
import 'package:task/presentation/product/productlist_screen.dart';
import 'package:task/utils/utils.dart';

class ProfileScreen extends StatefulWidget {
  final AuthModel credentials;
  const ProfileScreen({required this.credentials, super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 29, 59, 29),
        centerTitle: true,
        leading: const SizedBox(),
        title: const Text(
          "Profile",
          style: TextStyle(fontSize: 15, color: Colors.white),
        ),
      ),
      body: ListView(
        shrinkWrap: true,
        physics: const ScrollPhysics(),
        children: [
          Container(
            height: 100,
            padding: const EdgeInsets.all(10),
            color: Colors.white,
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.network(
                    widget.credentials.img,
                    height: 40,
                    width: 40,
                    fit: BoxFit.cover,
                  ),
                ),
                spaceWidth(40),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("hi"),
                    Text(widget.credentials.userName),
                    Text(
                      widget.credentials.email,
                      style: const TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                    Text(widget.credentials.gender,
                        style:
                            const TextStyle(fontSize: 12, color: Colors.grey)),
                  ],
                ),
              ],
            ),
          ),
          spaceHeight(5),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: ElevatedButton.icon(
                onPressed: () {
                  navigatorKey.currentState!.push(
                    MaterialPageRoute(
                        builder: (context) => BlocProvider(
                              create: (context) => ProductsCubit(
                                  apiRepository: context.read<ApiRepository>())
                                ..getAllPdt(),
                              child: const AllProductListScreen(),
                            )),
                  );
                },
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    backgroundColor: Color.fromARGB(255, 29, 59, 29),
                    foregroundColor: Colors.white),
                icon: const Icon(Icons.category_outlined),
                label: const Text('List Products')),
          ),
          spaceHeight(10),
          const Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Your informations",
              style: TextStyle(color: Colors.grey),
            ),
          ),
          spaceHeight(5),
          tile(ic: Icons.note_add, txt: "Order History"),
          tile(ic: Icons.person_add_alt_1_rounded, txt: "Address Book"),
          tile(ic: Icons.edit, txt: "Edit Profile"),
          tile(ic: Icons.notifications, txt: "Notification"),
          spaceHeight(10),
          const Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Others",
              style: TextStyle(color: Colors.grey),
            ),
          ),
          spaceHeight(5),
          tile(ic: Icons.note_add, txt: "Support"),
          tile(ic: Icons.send, txt: "Share"),
          tile(ic: Icons.info, txt: "About us"),
          tile(ic: Icons.lock_open_outlined, txt: "change Password"),
          tile(ic: Icons.logout, txt: "Logout"),
        ],
      ),
    );
  }

  ListTile tile({required txt, required ic}) {
    return ListTile(
      leading: Icon(
        ic,
        color: Colors.grey,
        size: 25,
      ),
      title: Text(
        txt,
        style: const TextStyle(
            fontSize: 12, color: Colors.grey, fontWeight: FontWeight.bold),
      ),
    );
  }
}
