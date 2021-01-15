class OmdbMovie {
  int id;
  String title;
  String date;
  String poster;
  String overview;

  OmdbMovie({
    this.id,
    this.title,
    this.date,
    this.poster,
    this.overview
  });

  factory OmdbMovie.fromJson(Map<String, dynamic> json) {
      String poster = "N/A";
      
      if(json['poster_path'] != null){
          poster = 'https://image.tmdb.org/t/p/w500/' + json['poster_path'];
      }
      
      return OmdbMovie(
          id: json['id'],
          title: json['title'],
          date: json['release_date'],
          poster: poster,
          overview: json['overview']
       );
  }

  String getYear(){
    String year = this.date.split('-')[0];
    return year != null ? year : "";
  }

  String getOverview(){
    if(this.overview.length > 110)
      return this.overview.substring(0,110) + '.......';
    else
      return this.overview + '.......';
  }
}