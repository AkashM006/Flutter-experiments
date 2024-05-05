import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sample/controllers/implmentation/tasks_impl.controller.dart';
import 'package:sample/utils/enums/controller_states.dart';

void showNewTaskForm(BuildContext context) {
  showModalBottomSheet(
    context: context,
    builder: (context) => const NewTask(),
    isScrollControlled: true,
    useSafeArea: true,
  );
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
        .read(tasksControllerImplProvider.notifier)
        .addTask(_title, _description);
  }

  @override
  Widget build(BuildContext context) {
    final tasksController = ref.watch(tasksControllerImplProvider);

    final bool isAddTaskLoading = tasksController.addTasksState.isLoading;

    ref.listen(
      tasksControllerImplProvider,
      (previous, next) {
        switch (next.addTasksState.status) {
          case ControllerStatus.success:
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Successfully Added the task")),
            );
            Navigator.of(context).pop();
            break;
          case ControllerStatus.failure:
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                behavior: SnackBarBehavior.floating,
                content: Text(
                  "Something went wrong when trying to create a new task. Please try again later!",
                ),
              ),
            );
            break;
          default:
            break;
        }
      },
    );

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
                enabled: !isAddTaskLoading,
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
                enabled: !isAddTaskLoading,
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
                onPressed: isAddTaskLoading ? null : handleSubmit,
                child: const Text("Submit"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
