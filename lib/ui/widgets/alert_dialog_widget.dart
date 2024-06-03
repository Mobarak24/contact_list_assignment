import 'package:flutter/material.dart';

class AlertDialogWidget extends StatelessWidget {
  const AlertDialogWidget({
    super.key,
    required this.deleteItem,
    required this.cancel,
  });

  final Function deleteItem;
  final Function cancel;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Confirmation'),
      content: const Text('Are you sure for delete?'),
      actions: [
        TextButton(
          onPressed: (){
            cancel();
          },
          child: const Icon(Icons.cancel),
        ),
        TextButton(
          onPressed: (){
            deleteItem();
          },
          child: const Icon(Icons.delete_outline_rounded),
        ),
      ],
    );
  }
}
