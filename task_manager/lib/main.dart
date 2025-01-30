import 'package:flutter/material.dart';

void main() {
  runApp(TaskManagerApp());
}

/// Основное приложение TaskManagerApp.
class TaskManagerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Task Manager',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TaskManagerHomePage(),
    );
  }
}

/// Главная страница приложения TaskManagerHomePage.
class TaskManagerHomePage extends StatefulWidget {
  @override
  _TaskManagerHomePageState createState() => _TaskManagerHomePageState();
}

class _TaskManagerHomePageState extends State<TaskManagerHomePage> {
  final List<String> _tasks = [];
  final TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Task Manager'),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _textController,
              decoration: InputDecoration(
                labelText: 'Enter task',
                suffixIcon: IconButton(
                  icon: Icon(Icons.add),
                  onPressed: _addTask,
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _tasks.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_tasks[index]),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () => _deleteTask(index),
                  ),
                  onTap: () => _editTask(index),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  /// Добавляет новую задачу в список задач.
  void _addTask() {
    setState(() {
      _tasks.add(_textController.text);
      _textController.clear();
    });
  }

  /// Удаляет задачу из списка задач.
  void _deleteTask(int index) {
    setState(() {
      _tasks.removeAt(index);
    });
  }

  /// Редактирует задачу в списке задач.
  void _editTask(int index) {
    _textController.text = _tasks[index];
    _deleteTask(index);
  }
}
