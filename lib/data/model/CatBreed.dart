

class CatBreed {
  final String id;
  final String name;
  final String imageUrl;
  final String origin;
  final String alt_names;
  final String description;
  final int intelligence;
  final String life_span;

  CatBreed({required this.id, required this.name, 
  required this.imageUrl,required this.origin,
  required this.alt_names,
  required this.description,required this.intelligence,
  required this.life_span
  });

  factory CatBreed.fromJson(Map<String, dynamic> json) {
    return CatBreed(
      id: json['id'],
      name: json['breeds'][0]['name']??"Unkwon",
      imageUrl: json['url'],
      origin: json['breeds'][0]['origin']??"Unkwon",
      alt_names: json['breeds'][0]['alt_names']??"Unkwon",
      description: json['breeds'][0]['description']??"Unkwon", 
      intelligence: json['breeds'][0]['intelligence']??0,
       life_span: json['breeds'][0]['life_span']??"Unkwon",
    );
  }
}
