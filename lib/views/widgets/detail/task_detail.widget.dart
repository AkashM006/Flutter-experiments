import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sample/controllers/implmentation/tasks_impl.controller.dart';
import 'package:sample/domain/task.model.dart';
import 'package:sample/utils/enums/controller_states.dart';

class TaskDetail extends ConsumerStatefulWidget {
  final TaskModel task;
  const TaskDetail({
    super.key,
    required this.task,
  });

  @override
  ConsumerState<TaskDetail> createState() => _TaskDetailState();
}

class _TaskDetailState extends ConsumerState<TaskDetail> {
  final _formKey = GlobalKey<FormState>();

  bool isTitleUpdated = false;
  bool isDescriptionUpdated = false;

  String _title = "";
  String _description = "";

  void _updateHandler() {
    if (!_formKey.currentState!.validate()) return;

    _formKey.currentState!.save();

    final newTask =
        widget.task.copyWith(title: _title, description: _description);

    ref.read(tasksControllerImplProvider.notifier).updateTask(newTask);
  }

  void _handleChange(name, value) {
    if (name == 'title') {
      setState(() {
        isTitleUpdated = widget.task.title != value;
      });
    } else {
      setState(() {
        isDescriptionUpdated = widget.task.description != value;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final tasksController = ref.watch(tasksControllerImplProvider);

    final isUpdating = tasksController.updateTaskState.isLoading;

    ref.listen(tasksControllerImplProvider, (previous, next) {
      switch (next.updateTaskState.status) {
        case ControllerStatus.success:
          Navigator.of(context).pop();
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Successfully updated the task"),
            ),
          );
          break;
        case ControllerStatus.failure:
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                next.updateTaskState.message,
              ),
            ),
          );
        default:
          break;
      }
    });

    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Form(
        key: _formKey,
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 600),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _formField(
                _requiredText('Title'),
                widget.task.title,
                onChanged: (title) => _handleChange('title', title),
                validator: (newValue) {
                  if (newValue == null || newValue.isEmpty) {
                    return "Title is required";
                  }
                  return null;
                },
                onSaved: (value) => _title = value!,
                enabled: !isUpdating,
              ),
              const SizedBox(
                height: 30,
              ),
              _formField(
                _requiredText('Description'),
                widget.task.description,
                onChanged: (description) =>
                    _handleChange('description', description),
                validator: (newValue) {
                  if (newValue == null || newValue.isEmpty) {
                    return "Description is required";
                  }
                  return null;
                },
                onSaved: (value) => _description = value!,
                enabled: !isUpdating,
              ),
              const SizedBox(
                height: 20,
              ),
              FilledButton(
                onPressed:
                    (isTitleUpdated || isDescriptionUpdated) && !isUpdating
                        ? _updateHandler
                        : null,
                child: const Text("Update"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _formField(
    Widget label,
    String initialValue, {
    void Function(String newValue)? onChanged,
    void Function(String? value)? onSaved,
    String? Function(String? newValue)? validator,
    bool enabled = true,
  }) {
    return TextFormField(
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        label: label,
      ),
      initialValue: initialValue,
      onChanged: onChanged,
      validator: validator,
      enabled: enabled,
      onSaved: onSaved,
    );
  }

  Widget _requiredText(String text) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: text,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          TextSpan(
            text: "*",
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(color: Theme.of(context).colorScheme.error),
          )
        ],
      ),
    );
  }
}
