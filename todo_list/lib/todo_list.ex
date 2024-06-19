defmodule TodoList do
  defstruct tasks: []

  def new do
    %TodoList{}
  end

  def add_task(todo_list, task) do
    %{todo_list | tasks: todo_list.tasks ++ [task]}
  end

  def complete_task(todo_list, task) do
    new_tasks = Enum.filter(todo_list.tasks, fn t -> t != task end)
    %{todo_list | tasks: new_tasks}
  end

  def list_tasks(todo_list) do
    todo_list.tasks
  end
end
