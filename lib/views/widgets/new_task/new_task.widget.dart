import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sample/controllers/tasks.controller.dart';

void showNewTaskForm(BuildContext context) {
  showModalBottomSheet(
      context: context,
      builder: (context) => const NewTask(),
      isScrollControlled: true,
      useSafeArea: true);
}

class NewTask extends ConsumerStatefulWidget {
  const NewTask({super.key});

  @override
  ConsumerState<NewTask> createState() => _NewTaskState();
}

class _NewTaskState extends ConsumerState<NewTask> {
  final _formKey = GlobalKey<FormState>();

  String _title = "";
  String _description = "";

  void handleSubmit() async {
    final isValid = _formKey.currentState!.validate();

    if (!isValid) return;

    _formKey.currentState!.save();

    await ref
        .read(tasksControllerProvider.notifier)
        .addNewTask(_title, _description);
  }

  @override
  Widget build(BuildContext context) {
    final tasksController = ref.watch(tasksControllerProvider);

    return SizedBox(
      width: double.infinity,
      child: SingleChildScrollView(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom + 20,
          top: 20,
          left: 20,
          right: 20,
        ),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "New Task",
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              const SizedBox(
                height: 40,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text("Title"),
                ),
                enabled: !tasksController.isLoading,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Title is required";
                  }
                  return null;
                },
                onSaved: (newValue) {
                  _title = newValue ?? "";
                },
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text("Description"),
                ),
                enabled: !tasksController.isLoading,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Description is required";
                  }
                  return null;
                },
                onSaved: (newValue) {
                  _description = newValue ?? "";
                },
              ),
              const SizedBox(
                height: 20,
              ),
              FilledButton(
                onPressed: tasksController.isLoading ? null : handleSubmit,
                child: const Text("Submit"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
