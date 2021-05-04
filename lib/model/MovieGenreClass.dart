class MovieGenreClass{
  int id;
  String title;

  MovieGenreClass({this.id,this.title});

  MovieGenreClass.fromJson(Map<String,dynamic> json){
    id = json['id'];
    title = json['name'];
  }
}