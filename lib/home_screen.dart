import 'package:flutter/material.dart';

import 'add_char.dart';
import 'data.dart';
import 'detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    // Cek apakah platform adalah web/desktop
    return Scaffold(
      appBar: AppBar(
        title: const Text("PGR Char Wiki"),
        backgroundColor: Colors.red,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 10),
        itemCount: CharData.data.length,
        itemBuilder: (context, index) {
          final char = CharData.data[index];
          return GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => DetailScreen(char: char),
                ),
              );
            },
            child: ListTile(
              leading: CircleAvatar(
                radius: 35,
                backgroundImage: AssetImage(
                  char['profile'] ?? 'images/alpha_profile.png',
                ),
              ),
              title: Text(char['name'], style: const TextStyle(fontSize: 20)),
              subtitle: Text(
                char['role'],
                style: const TextStyle(fontSize: 14),
              ),
              trailing: IconButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text("Delete Character"),
                        content: const Text(
                          "Are you sure to delete this character?",
                        ),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.of(context).pop(),
                            child: const Text("Cancel"),
                          ),
                          TextButton(
                            onPressed: () {
                              setState(() {
                                CharData.data.removeAt(index);
                              });
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                    'Delete character successfully!',
                                  ),
                                ),
                              );
                              Navigator.of(context).pop();
                            },
                            child: const Text("Delete"),
                          ),
                        ],
                      );
                    },
                  );
                },
                icon: const Icon(Icons.delete),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final newChar = await Navigator.of(
            context,
          ).push(MaterialPageRoute(builder: (context) => const AddChar()));
          if (newChar != null) {
            setState(() {});
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
