class Taskmodel {
  String task;

  dynamic date;

  Taskmodel({required this.date, required this.task});

  factory Taskmodel.fromJson(jsonData) {
    return Taskmodel(date: jsonData["date"], task: jsonData["task"]);
  }
}
