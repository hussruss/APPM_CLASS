import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TaskListScreen extends StatefulWidget {
  @override
  State<TaskListScreen> createState() => _TaskListScreenState();
}

class _TaskListScreenState extends State<TaskListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Lista de tareas pendientes')),
      body: ListView.builder(
        itemCount: listTask.length,
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () async {
              final Task taskE = await Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => TaskDetail(),
                      settings: RouteSettings(arguments: listTask[index])));

              if (taskE != null) {
                listTask[index] = taskE;
              }
              setState(() {});
            },
            title: Text(listTask[index].name),
            subtitle: Text(listTask[index].desc),
            trailing: Text(DateFormat("dd/MM/yy").format(listTask[index].date)),
            leading: Icon(
              Icons.task_alt,
              color: listTask[index].isDone ? Colors.green : Colors.grey,
            ),
          );
        },
      ),
    );
  }
}

class TaskDetail extends StatefulWidget {
  const TaskDetail({super.key});

  @override
  State<TaskDetail> createState() => _TaskDetailState();
}

class _TaskDetailState extends State<TaskDetail> {
  GlobalKey<FormState> _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Task task = ModalRoute.of(context)!.settings.arguments as Task;

    return Scaffold(
      appBar: AppBar(title: Text(task.name)),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Card(
          child: Column(
            children: [
              Form(
                  key: _key,
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(Icons.task),
                            label: Text('Task')),
                        initialValue: task.name,
                        onSaved: (value) {
                          print('OnSvae Name $value');
                          setState(() {});
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(Icons.task),
                            label: Text('Description')),
                        initialValue: task.desc,
                        onSaved: (value) {
                          print('OnSvae Name $value');
                          setState(() {});
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CheckboxListTile(
                          value: task.isDone,
                          title: Text('Marcar tarea'),
                          onChanged: (value) {
                            setState(() {
                              task.isDone = value!;
                            });
                          }),
                      const SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                          onPressed: () {
                            if (_key.currentState!.validate()) {
                              Navigator.of(context).pop(task);
                            }
                          },
                          child: Text('Save'))
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

List<Task> listTask = [
  Task(
      name: 'Tarea 1',
      desc: 'Esta es la tarea 1',
      isDone: false,
      date: DateTime.now()),
  Task(
      name: 'Tarea 2',
      desc: 'Esta es la tarea 2',
      isDone: true,
      date: DateTime.now()),
  Task(
      name: 'Tarea 3',
      desc: 'Esta es la tarea 3',
      isDone: false,
      date: DateTime.now()),
];

class Task {
  String name;
  String desc;
  bool isDone;
  DateTime date;

  Task(
      {required this.name,
      required this.desc,
      required this.isDone,
      required this.date});
}
