import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:sample/models/person.dart';
import 'package:sample/utils/random_gen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<StatefulWidget> createState() => _App();
}

class _App extends State<App> {
  bool isLoading = true;
  Person person = defaultPerson;
  final TextEditingController _nameController = TextEditingController();

  void loadState() async {
    final sp = await SharedPreferences.getInstance();

    final persistedData = sp.getString("user");

    if (persistedData == null) {
      setState(() {
        isLoading = false;
      });
      return;
    }

    setState(() {
      person = Person.fromJson(jsonDecode(persistedData));
      _nameController.text = person.name;
      isLoading = false;
    });
  }

  Future<void> persist() async {
    final sp = await SharedPreferences.getInstance();

    person = person.copyWith(name: _nameController.text);

    sp.setString("user", jsonEncode(person));
  }

  @override
  void initState() {
    loadState();
    super.initState();
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  void handleIdGeneration() async {
    setState(() {
      isLoading = true;
    });
    final randInt = getRandomInteger();

    person = person.copyWith(id: randInt);

    await persist();

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: isLoading
            ? const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Loading..."),
                  SizedBox(
                    width: 20,
                  ),
                  SizedBox(
                    height: 30,
                    width: 30,
                    child: CircularProgressIndicator(),
                  ),
                ],
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextField(
                    controller: _nameController,
                    decoration: const InputDecoration(
                      constraints: BoxConstraints(maxWidth: 200),
                      label: Text("Name"),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text("Id : ${person.id}"),
                  const SizedBox(
                    height: 40,
                  ),
                  TextButton(
                    onPressed: handleIdGeneration,
                    child: const Text("Generate ID"),
                  ),
                  TextButton(
                    onPressed: persist,
                    child: const Text("Persist"),
                  ),
                ],
              ),
      ),
    );
  }
}
