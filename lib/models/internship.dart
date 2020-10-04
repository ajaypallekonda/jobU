class Internship {
  final String name;
  final String company;
  final String location;

  Internship(this.name, this.company, this.location);
  factory Internship.fromMap(Map<String, dynamic> json) {
    return Internship(
      json['name'],
      json['company'],
      json['location'],
    );
  }

  factory Internship.fromJson(Map<String, dynamic> data) {
    return Internship(
      data['name'],
      data['company'],
      data['location'],
    );
  }
}
