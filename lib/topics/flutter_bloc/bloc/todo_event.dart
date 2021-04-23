import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tutorial_v2/topics/flutter_bloc/model/todo.dart';

@immutable
abstract class TodoEvent extends Equatable {}

class ListTodosEvent extends TodoEvent {
  @override
  List<Object> get props => [];
}

class CreateTodoEvent extends TodoEvent {
  final String title;

  CreateTodoEvent({
    required this.title,
  });

  @override
  List<Object> get props => [this.title];
}

class DeleteTodoEvent extends TodoEvent {
  final Todo todo;

  DeleteTodoEvent({
    required this.todo,
  });

  @override
  List<Object> get props => [this.todo];
}
