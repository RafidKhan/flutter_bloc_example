import 'package:flutter/material.dart';

class UpdateNameBottomSheet extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController userNameController;
  final VoidCallback onSave;
  final bool isEnabled;

  const UpdateNameBottomSheet({
    Key? key,
    required this.nameController,
    required this.emailController,
    required this.userNameController,
    required this.onSave,
    required this.isEnabled,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
        left: 16,
        right: 16,
        top: 20,
      ),
      color: Colors.white,
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            decoration: const InputDecoration(labelText: "Name"),
            controller: nameController,
          ),
          TextField(
            decoration: const InputDecoration(labelText: "Email"),
            controller: emailController,
          ),
          TextField(
            decoration: const InputDecoration(labelText: "User Name"),
            controller: userNameController,
          ),
          ElevatedButton(
            onPressed: isEnabled ? onSave : null,
            child: const Text("Save"),
          ),
        ],
      ),
    );
  }
}
