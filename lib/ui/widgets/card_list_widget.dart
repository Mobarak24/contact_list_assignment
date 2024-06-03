import 'package:contact_list/entities/model.dart';
import 'package:contact_list/ui/utility/app_colors.dart';
import 'package:flutter/material.dart';

class CardListWidget extends StatelessWidget {
  const CardListWidget({super.key, required this.model});

  final Model model;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.cardColor,
      child: ListTile(
        leading: const Icon(Icons.contact_page_sharp),
        title: Text(
          model.name.toString(),
          style: const TextStyle(color: Colors.red),
        ),
        subtitle: Text(model.number.toString()),
        trailing: const Icon(
          Icons.phone,
          color: Colors.blue,
        ),
      ),
    );
  }
}
