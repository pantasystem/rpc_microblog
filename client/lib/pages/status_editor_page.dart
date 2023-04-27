
import 'dart:developer';

import 'package:client/providers/repositories.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class StatusEditorPage extends ConsumerStatefulWidget {
  const StatusEditorPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return StatusEditorPageState();
  }
}

class StatusEditorPageState extends ConsumerState {
  final _formKey = GlobalKey<FormState>();
  final _inputContentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: const Text("投稿作成"),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextFormField(
                controller: _inputContentController,
                decoration: const InputDecoration(
                  labelText: "投稿内容",
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "投稿内容を入力してください";
                  }
                  return null;
                },
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ref.read(statusRepositoryProvider).create(
                      text: _inputContentController.text,
                    ).then((value) {
                      log('投稿したデータ: $value');
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("投稿しました")),
                      );
                    });

                  }
                },
                child: const Text("投稿"),
              ),
            ],
          ),
        ),
      )
    );
  }
}