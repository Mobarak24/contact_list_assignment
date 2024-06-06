import 'package:contact_list/entities/model.dart';
import 'package:contact_list/ui/widgets/alert_dialog_widget.dart';
import 'package:contact_list/ui/widgets/card_list_widget.dart';
import 'package:flutter/material.dart';

class ContactListScreen extends StatefulWidget {
  const ContactListScreen({super.key});

  @override
  State<ContactListScreen> createState() => _ContactListScreenState();
}

class _ContactListScreenState extends State<ContactListScreen> {
  final TextEditingController _nameTEController = TextEditingController();
  final TextEditingController _numberTEController = TextEditingController();
  List<Model> contactList = [];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Contact List',
          style: TextStyle(fontSize: 18),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              TextField(
                controller: _nameTEController,
                decoration: const InputDecoration(hintText: 'Name'),
                keyboardType: TextInputType.text,
              ),
              const SizedBox(height: 8),
              TextField(
                controller: _numberTEController,
                decoration: const InputDecoration(hintText: 'Number'),
                keyboardType: TextInputType.number,
                maxLength: 11,
              ),
              const SizedBox(height: 8),
              ElevatedButton(
                onPressed: () {
                  final name = _nameTEController.text.trim();
                  final number = _numberTEController.text.trim();
                  if (name.isEmpty || number.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('field required!')));
                  } else {
                    _addContact();
                  }
                },
                child: const Text(
                  'Add',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                  itemCount: contactList.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onLongPress: () {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialogWidget(
                                deleteItem: () {
                                  _onDelete(index);
                                },
                                cancel: () {
                                  Navigator.pop(context);
                                },
                              );
                            },
                        );
                      },
                      child: CardListWidget(model: contactList[index]),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onDelete(int index) {
    contactList.removeAt(index);
    if (mounted) {
      setState(() {});
    }
    Navigator.pop(context);
  }

  void _addContact() {
    Model model = Model(
      _nameTEController.text.trim(),
      _numberTEController.text.trim(),
    );
    contactList.add(model);
    setState(() {});
    _nameTEController.clear();
    _numberTEController.clear();
  }

  @override
  void dispose() {
    _nameTEController.dispose();
    _numberTEController.dispose();
    super.dispose();
  }
}
