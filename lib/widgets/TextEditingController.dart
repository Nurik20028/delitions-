import 'package:flutter/material.dart';

class MyFormController extends StatefulWidget {
  const MyFormController({super.key});

  @override
  State<MyFormController> createState() => _MyFormState();
}

class _MyFormState extends State<MyFormController> {
  final TextEditingController nameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    nameController.text = 'Initial Name';
    // Добавить прослушиватель для обновлений в реальном времени:
    nameController.addListener(printLatestValue);
  }

  void printLatestValue() {
    print('Text field value: ${nameController.text}');
  }

  @override
  void dispose() {
    // Очищаем контроллер после удаления виджета:
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('TextEditingController Example')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(labelText: 'Enter your name'),
            ),
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      content: Text('You entered: ${nameController.text}'),
                    );
                  },
                );
              },
              child: const Text('Show Entered Text'),
            ),
          ],
        ),
      ),
    );
  }
}
