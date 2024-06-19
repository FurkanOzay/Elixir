defmodule TodoListTest do
  use ExUnit.Case

  test "create a new to-do list" do
    todo_list = TodoList.new()
    assert todo_list.tasks == []
  end

  test "add a task to the to-do list" do
    todo_list = TodoList.new() |> TodoList.add_task("Learn Elixir")
    assert todo_list.tasks == ["Learn Elixir"]
  end

  test "complete a task in the to-do list" do
    todo_list = TodoList.new()
    |> TodoList.add_task("Learn Elixir")
    |> TodoList.complete_task("Learn Elixir")
    assert todo_list.tasks == []
  end

  test "list all tasks in the to-do list" do
    todo_list = TodoList.new()
    |> TodoList.add_task("Learn Elixir")
    |> TodoList.add_task("Build a project")
    assert TodoList.list_tasks(todo_list) == ["Learn Elixir", "Build a project"]
  end
end
