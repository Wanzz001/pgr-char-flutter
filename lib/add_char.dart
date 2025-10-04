import 'package:flutter/material.dart';

import 'data.dart';

class AddChar extends StatefulWidget {
  const AddChar({super.key});

  @override
  State<AddChar> createState() => _AddCharState();
}

class _AddCharState extends State<AddChar> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _roleController = TextEditingController();
  final TextEditingController _weaponController = TextEditingController();
  final TextEditingController _factionController = TextEditingController();
  final TextEditingController _infoController = TextEditingController();
  final TextEditingController _elementController = TextEditingController();
  final TextEditingController _linkController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Character'),
        backgroundColor: Colors.red,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Name',
              ),
            ),
            const SizedBox(height: 12.0),
            TextField(
              controller: _roleController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Role',
              ),
            ),
            const SizedBox(height: 12.0),
            TextField(
              controller: _weaponController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Weapon',
              ),
            ),
            const SizedBox(height: 12.0),
            TextField(
              controller: _factionController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Faction',
              ),
            ),
            const SizedBox(height: 12.0),
            TextField(
              controller: _infoController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Info',
              ),
            ),
            const SizedBox(height: 12.0),
            TextField(
              controller: _elementController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Element',
              ),
            ),
            const SizedBox(height: 12.0),
            TextField(
              controller: _linkController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Link',
              ),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                if (_nameController.text.isNotEmpty &&
                    _roleController.text.isNotEmpty &&
                    _weaponController.text.isNotEmpty &&
                    _factionController.text.isNotEmpty &&
                    _infoController.text.isNotEmpty &&
                    _elementController.text.isNotEmpty &&
                    _linkController.text.isNotEmpty) {
                  final newChar = {
                    'name': _nameController.text,
                    'role': _roleController.text,
                    'weapon': _weaponController.text,
                    'faction': _factionController.text,
                    'info': _infoController.text,
                    'element': _elementController.text,
                    'link': _linkController.text,
                  };
                  CharData.data.add(newChar);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Add character successfully!'),
                    ),
                  );
                  Navigator.pop(context, newChar);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Please fill all fields!'),
                    ),
                  );
                }
              },
              child: const Padding(
                padding: EdgeInsets.all(15.0),
                child: Text('Add Character'),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override 
dispose(){
    _nameController.dispose();
    _roleController.dispose();
    _weaponController.dispose();
    _factionController.dispose();
    _infoController.dispose();
    _elementController.dispose();
    _linkController.dispose();
    super.dispose();
}
}
