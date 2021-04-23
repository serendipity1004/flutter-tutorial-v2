import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tutorial_v2/topics/flutter_bloc/bloc/todo_state.dart';
import 'package:flutter_tutorial_v2/topics/flutter_bloc/model/todo.dart';
import 'package:flutter_tutorial_v2/topics/flutter_bloc/repository/todo_repository.dart';

class TodoCubit extends Cubit<TodoState> {
  final TodoRepository repository;

  TodoCubit({required this.repository}) : super(Empty());

  listTodo() async {
    try {
      emit(Loading());

      final resp = await this.repository.listTodo();

      final todos = resp
          .map<Todo>(
            (e) => Todo.fromJson(e),
          )
          .toList();

      emit(Loaded(todos: todos));
    } catch (e) {
      emit(Error(message: e.toString()));
    }
  }

  createTodo(String title) async {
    try {
      if (state is Loaded) {
        final parsedState = (state as Loaded);

        final newTodo = Todo(
          id: parsedState.todos[parsedState.todos.length - 1].id + 1,
          title: title,
          createdAt: DateTime.now().toString(),
        );

        final prevTodos = [
          ...parsedState.todos,
        ];

        final newTodos = [
          ...prevTodos,
          newTodo,
        ];

        emit(Loaded(todos: newTodos));

        final resp = await this.repository.createTodo(newTodo);

        emit(
          Loaded(
            todos: [
              ...prevTodos,
              Todo.fromJson(resp),
            ],
          ),
        );
      }
    } catch (e) {
      emit(Error(message: e.toString()));
    }
  }

  deleteTodo(Todo todo) async {
    try {
      if (state is Loaded) {
        final newTodos = (state as Loaded)
            .todos
            .where((item) => item.id != todo.id)
            .toList();

        emit(Loaded(todos: newTodos));

        await repository.deleteTodo(todo);
      }
    } catch (e) {
      emit(Error(message: e.toString()));
    }
  }
}
