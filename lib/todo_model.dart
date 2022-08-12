class TodoModel{
  int? id;
  String? title;
  String? date;
  int? isDone;

  TodoModel({this.id,this.title,this.date,this.isDone});

  Map<String,dynamic> toMap(){
    return {
      'id':id,
      'title':title,
      'date':date,
      'isDone':isDone,
    };
  }

  TodoModel.fromMap(Map<String,dynamic> Todo){
    id= Todo['id'];
    title= Todo['title'];
    date= Todo['date'];
    isDone= Todo['isDone'];
  }
}