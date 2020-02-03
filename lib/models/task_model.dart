class Task {
  int id;
  String title;
  DateTime date;
  String priority;
  int status; // 0 - incomplete, 1 - complete

  // Constructor
  Task({this.title, this.date, this.priority, this.status});
  // Named constructor
  Task.withId({this.id, this.title, this.date, this.priority, this.status});

  // Store data in SQL database ต้องเป็น Map เท่านั้น
  Map<String, dynamic> toMap() {
    final map = Map<String, dynamic>();
    if (id != null) {
      map['id'] = id;
    }
    map['title'] = title;
    // convert datetime to ISO-8601 format
    map['date'] = date.toIso8601String();
    map['priority'] = priority;
    map['status'] = status;
    return map;
  }

  // convert Map -> task object when retrieving data from database
  // factory function -> return object in constructor
  factory Task.fromMap(Map<String, dynamic> map) {
    return Task.withId(
      id: map['id'],
      title: map['title'],
      date: DateTime.parse(map['date']),
      priority: map['priority'],
      status: map['status'],
    );
  }
}
