import 'package:doc_storage/Views/login.dart';
import 'package:doc_storage/Views/make_doc.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text("Home"),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const Login()),
                  );
                },
                icon: const Icon(Icons.logout))
          ],
        ),
        body: Container(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 4.0,
                  mainAxisSpacing: 8.0,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const MakeDoc()),
                        );
                      },
                      child: Card(
                        color: Colors.indigo.shade500,
                        child: const Center(
                            child: Text(
                          "Make Doc",
                          style: TextStyle(color: Colors.white),
                        )),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Card(
                        color: Colors.indigo.shade500,
                        child: const Center(
                            child: Text(
                          "Store",
                          style: TextStyle(color: Colors.white),
                        )),
                      ),
                    ),
                  ]),
            ),
          ],
        )));
  }
}
