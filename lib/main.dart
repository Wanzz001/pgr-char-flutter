import 'package:flutter/material.dart';
import 'data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      darkTheme: ThemeData.dark(),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("PGR Char Wiki"),
          backgroundColor: Colors.red,
        ),
        body: ListView.builder(
          padding: const EdgeInsets.all(10),
          itemCount: CharData.data.length,
          itemBuilder: (context, index) {
            final char = CharData.data[index];
            return SingleChildScrollView(
                padding: const EdgeInsets.only(bottom: 10),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DetailScreen(char: char)));
                  },
                  child: Row(
                    children: [
                      ClipOval(
                        child: Image.asset(
                          char['profile'],
                          width: 80,
                          height: 80,
                        ),
                      ),
                      const SizedBox(width: 15),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            char['name'],
                            style: const TextStyle(fontSize: 20),
                          ),
                          Text(
                            char['role'],
                            style: const TextStyle(fontSize: 14),
                          )
                        ],
                      ),
                    ],
                  ),
                ));
          },
        ));
  }
}

class DetailScreen extends StatelessWidget {
  final Map<String, dynamic> char;

  const DetailScreen({super.key, required this.char});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("Character Details"), backgroundColor: Colors.red),
      body: SingleChildScrollView(
          child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                children: [
                  Image.asset(
                    char['banner']!,
                    height: 400,
                  ),
                  Positioned(
                    top: 20,
                    left: 290,
                    child: Image.asset(
                      char['img_faction']!,
                      height: 80,
                    ),
                  ),
                  Positioned(
                    top: 20,
                    child: Image.asset(
                      char['img_role']!,
                      height: 80,
                    ),
                  )
                ],
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8, bottom: 20),
            child: Text(
              char['name'],
              style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
          ),
          Row(
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 12, right: 20),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Class",
                        style: TextStyle(fontSize: 18),
                      ),
                      Text("Faction", style: TextStyle(fontSize: 15)),
                      Text("Weapon", style: TextStyle(fontSize: 15)),
                      Text("Element", style: TextStyle(fontSize: 15)),
                    ]),
              ),
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(char['role'], style: const TextStyle(fontSize: 15)),
                Text(char['faction'], style: const TextStyle(fontSize: 15)),
                Text(char['weapon'], style: const TextStyle(fontSize: 15)),
                Text(char['element'], style: const TextStyle(fontSize: 15)),
              ]),
            ],
          ),
          Padding(
              padding: const EdgeInsets.only(top: 20, left: 12, right: 12, bottom: 20),
              child: Column(
                  children: [
                    const Text("Information",
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold)),
                    SizedBox(height: 10),
                    Text(char['info'], style: TextStyle(fontSize: 15)),
                  ])),
        ],
      )),
    );
  }
}
