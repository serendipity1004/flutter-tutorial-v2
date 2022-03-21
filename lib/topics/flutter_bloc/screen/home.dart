import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../bloc/todo_bloc.dart';
import '../bloc/todo_event.dart';
import '../bloc/todo_state.dart';
import '../repository/todo_repository.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => TodoBloc(repository: TodoRepository()),
      child: HomeWidget(),
    );
  }
}

class HomeWidget extends StatefulWidget {
  const HomeWidget({Key? key}) : super(key: key);

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  String _title = '';
  @override
  void initState() {
    super.initState();
    // init read todo list
    BlocProvider.of<TodoBloc>(context).add(ListTodosEvent());
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Bloc'),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            // item create
            _title.isNotEmpty
                ? BlocProvider.of<TodoBloc>(context)
                    .add(CreateTodoEvent(title: _title))
                : Get.snackbar(
                    '내용을 입력해주세요',
                    '',
                    margin: const EdgeInsets.only(left: 16.0),
                    snackPosition: SnackPosition.BOTTOM,
                  );
          },
          child: const Icon(Icons.edit)),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            TextField(
              onChanged: (val) {
                _title = val;
              },
            ),
            const SizedBox(height: 16.0),
            Expanded(
              child: BlocBuilder<TodoBloc, TodoState>(
                builder: (_, state) {
                  if (state is Empty) {
                    return Container();
                  } else if (state is Error) {
                    return Text(state.message);
                  } else if (state is Loading) {
                    return const Center(
                      child: CupertinoActivityIndicator(),
                    );
                  } else if (state is Loaded) {
                    final items = state.todos;
                    return ListView.separated(
                      itemBuilder: (_, index) {
                        final item = items[index];
                        return Row(
                          children: [
                            Container(
                                margin: const EdgeInsets.only(right: 16),
                                child: Text(item.id.toString())),
                            Expanded(child: Text(item.title)),
                            GestureDetector(
                              onTap: () {
                                // item delete
                                BlocProvider.of<TodoBloc>(context)
                                    .add(DeleteTodoEvent(todo: item));
                              },
                              child: const Icon(
                                Icons.delete,
                              ),
                            ),
                          ],
                        );
                      },
                      separatorBuilder: (_, index) => const Divider(),
                      itemCount: items.length,
                    );
                  }
                  return SizedBox();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
