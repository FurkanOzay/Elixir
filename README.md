#Proje 2


# TodoList Görev Yönetim Uygulaması

Bu proje, Elixir dilinde yazılmış basit bir görev yönetim uygulamasıdır. Bu uygulama, görevlerin eklenmesini, tamamlanmasını ve listelenmesini sağlar. Ayrıca, her görevin bir önceliği olabilir.

## Proje Yapısı

```
todo_list/
├── config
│   └── config.exs
├── lib
│   └── todo_list.ex
├── test
│   ├── todo_list_test.exs
│   └── test_helper.exs
├── mix.exs
└── README.md
```

## Başlangıç

### Proje Oluşturma

Yeni bir Elixir projesi oluşturmak için terminalde aşağıdaki komutu çalıştırın:
```bash
mix new todo_list
cd todo_list
```

### Görev Modülü Tanımlama

`lib/todo_list.ex` dosyasını aşağıdaki şekilde oluşturun ve düzenleyin:

```elixir
defmodule TodoList do
  defstruct tasks: []

  def new do
    %TodoList{}
  end

  def add_task(todo_list, task, priority \ :medium) do
    new_task = %{task: task, priority: priority}
    %{todo_list | tasks: todo_list.tasks ++ [new_task]}
  end

  def complete_task(todo_list, task) do
    new_tasks = Enum.filter(todo_list.tasks, fn t -> t.task != task end)
    %{todo_list | tasks: new_tasks}
  end

  def list_tasks(todo_list) do
    todo_list.tasks
  end
end
```

### Modül ve Fonksiyon Açıklamaları

- **Modül Tanımlaması:**
  ```elixir
  defmodule TodoList do ... end
  ```
  `TodoList` adında bir modül tanımlar. Modüller, Elixir'de fonksiyonları ve diğer yapıları gruplamak için kullanılır.

- **Struct Tanımlaması:**
  ```elixir
  defstruct tasks: []
  ```
  `tasks` adlı bir alanı olan bir struct tanımlar ve bu alanın varsayılan değerini boş bir liste (`[]`) olarak ayarlar.

- **`new/0` Fonksiyonu:**
  ```elixir
  def new do
    %TodoList{}
  end
  ```
  Yeni bir `TodoList` struct'ı oluşturur ve döner.

- **`add_task/3` Fonksiyonu:**
  ```elixir
  def add_task(todo_list, task, priority \ :medium) do
    new_task = %{task: task, priority: priority}
    %{todo_list | tasks: todo_list.tasks ++ [new_task]}
  end
  ```
  Verilen `task` görevini ve `priority` önceliğini `todo_list` yapısına ekler.

- **`complete_task/2` Fonksiyonu:**
  ```elixir
  def complete_task(todo_list, task) do
    new_tasks = Enum.filter(todo_list.tasks, fn t -> t.task != task end)
    %{todo_list | tasks: new_tasks}
  end
  ```
  Belirtilen `task` görevini `todo_list` yapısından çıkarır.

- **`list_tasks/1` Fonksiyonu:**
  ```elixir
  def list_tasks(todo_list) do
    todo_list.tasks
  end
  ```
  `todo_list` yapısındaki tüm görevleri döner.

### Testler

`test/todo_list_test.exs` dosyasını oluşturun ve aşağıdaki testleri ekleyin:

```elixir
defmodule TodoListTest do
  use ExUnit.Case

  test "create a new to-do list" do
    todo_list = TodoList.new()
    assert todo_list.tasks == []
  end

  test "add a task to the to-do list" do
    todo_list = TodoList.new() |> TodoList.add_task("Learn Elixir", :high)
    assert todo_list.tasks == [%{task: "Learn Elixir", priority: :high}]
  end

  test "complete a task in the to-do list" do
    todo_list = TodoList.new()
    |> TodoList.add_task("Learn Elixir", :medium)
    |> TodoList.complete_task("Learn Elixir")
    assert todo_list.tasks == []
  end

  test "list all tasks in the to-do list" do
    todo_list = TodoList.new()
    |> TodoList.add_task("Learn Elixir", :medium)
    |> TodoList.add_task("Build a project", :high)
    assert TodoList.list_tasks(todo_list) == [%{task: "Learn Elixir", priority: :medium}, %{task: "Build a project", priority: :high}]
  end
end
```

### Testleri Çalıştırma

Testleri çalıştırmak için terminalde aşağıdaki komutu çalıştırın:
```bash
mix test
```

## Kullanım

### IEx Kabuğunda Fonksiyonları Test Etme

1. **IEx Kabuğunu Başlatma:**

   ```bash
   iex -S mix
   ```

2. **Görev Ekleme:**

   ```elixir
   todo_list = TodoList.new()
   todo_list = TodoList.add_task(todo_list, "Learn Elixir", :high)
   IO.inspect TodoList.list_tasks(todo_list)
   ```

3. **Görev Tamamlama:**

   ```elixir
   todo_list = TodoList.complete_task(todo_list, "Learn Elixir")
   IO.inspect TodoList.list_tasks(todo_list)
   ```

## Özet

Bu proje, Elixir dilinde yazılmış basit bir görev yönetim uygulamasıdır. Struct'lar ve modüller kullanarak görev ekleme, tamamlama ve listeleme işlevlerini gerçekleştirdik. Ayrıca, testler yazarak kodun doğruluğunu kontrol ettik. Bu, Elixir'de temel veri yapıları ve işlevleri kullanarak gerçek hayatta kullanılabilecek bir uygulama geliştirme konusunda size yardımcı olacaktır.

Herhangi bir sorunuz varsa veya başka bir konuda daha fazla açıklamaya ihtiyacınız varsa, lütfen belirtin!

