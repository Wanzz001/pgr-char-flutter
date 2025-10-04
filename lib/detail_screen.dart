import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class DetailScreen extends StatelessWidget {
  final Map<String, dynamic> char;

  const DetailScreen({super.key, required this.char});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("Character Details"), backgroundColor: Colors.red),
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth > 1000) {
            return SingleChildScrollView(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      Image.asset(
                        char['banner'] ?? 'images/alpha_banner.png',
                        height: constraints.maxHeight * 0.7,
                      ),
                      Positioned(
                        top: 20,
                        left: 450,
                        child: Image.asset(
                          char['img_faction'] ?? 'images/faction_gr.png',
                          height: 80,
                        ),
                      ),
                      Positioned(
                        top: 20,
                        child: Image.asset(
                          char['img_role'] ?? 'images/class_attacker.png',
                          height: 80,
                        ),
                      )
                    ],
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        children: [
                          Text(
                            char['name'],
                            style: const TextStyle(
                                fontSize: 26, fontWeight: FontWeight.bold),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          ),
                          const SizedBox(height: 20),
                          Row(
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(right: 20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Class",
                                      style: TextStyle(fontSize: 18),
                                    ),
                                    Text("Faction",
                                        style: TextStyle(fontSize: 15)),
                                    Text("Weapon",
                                        style: TextStyle(fontSize: 15)),
                                    Text("Element",
                                        style: TextStyle(fontSize: 15)),
                                  ],
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    char['role'],
                                    style: const TextStyle(fontSize: 15),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                  ),
                                  Text(
                                    char['faction'],
                                    style: const TextStyle(fontSize: 15),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                  ),
                                  Text(
                                    char['weapon'],
                                    style: const TextStyle(fontSize: 15),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                  ),
                                  Text(
                                    char['element'],
                                    style: const TextStyle(fontSize: 15),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 12, right: 12, bottom: 20),
                            child: Column(
                              children: [
                                const Text("Information",
                                    style: TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold)),
                                const SizedBox(height: 10),
                                Text(
                                  char['info'],
                                  style: const TextStyle(fontSize: 15),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 5,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          } else {
            return SingleChildScrollView(
              child: Column(
                children: [
                  Stack(
                    children: [
                      Image.asset(
                        char['banner'] ?? 'images/alpha_banner.png',
                        height: 400,
                      ),
                      Positioned(
                        top: 20,
                        left: 290,
                        child: Image.asset(
                          char['img_faction'] ?? 'images/faction_gr.png',
                          height: 80,
                        ),
                      ),
                      Positioned(
                        top: 20,
                        child: Image.asset(
                          char['img_role'] ?? 'images/class_attacker.png',
                          height: 80,
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8, bottom: 20),
                    child: Text(
                      char['name'],
                      style: const TextStyle(
                          fontSize: 26, fontWeight: FontWeight.bold),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
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
                          ],
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            char['role'],
                            style: const TextStyle(fontSize: 15),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          ),
                          Text(
                            char['faction'],
                            style: const TextStyle(fontSize: 15),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          ),
                          Text(
                            char['weapon'],
                            style: const TextStyle(fontSize: 15),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          ),
                          Text(
                            char['element'],
                            style: const TextStyle(fontSize: 15),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          ),
                        ],
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 20, left: 12, right: 12, bottom: 20),
                    child: Column(
                      children: [
                        const Text("Information",
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold)),
                        const SizedBox(height: 10),
                        Text(
                          char['info'],
                          style: const TextStyle(fontSize: 15),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 5,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Share.share(
              'Check out details of ${char['name']} in ${char['link']}',
              subject: 'Character Details');
        },
        tooltip: 'Share on social media',
        child: const Icon(Icons.share),
      ),
    );
  }
}
