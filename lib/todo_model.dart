class TodoModel{
  int? id;
  late final String title;
  late final String date;
  bool? isDone;

  TodoModel({this.id,required this.title,required this.date,required this.isDone});

  Map<String,dynamic> toMap(){
    return {
      'id':id,
      'title':title,
      'date':date,
      'isDone':isDone,
    };
  }

  TodoModel.fromJson(Map<String,dynamic> Todo){
    id= Todo['id'];
    title= Todo['title'];
    date= Todo['date'];
    isDone= Todo['isDone'];
  }
}