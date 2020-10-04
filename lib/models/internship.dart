class Internship {
  final String name;
  final String company;
  final String location;
  final String link;

  Internship(this.name, this.company, this.location, this.link);
  factory Internship.fromMap(Map<String, dynamic> json) {
    return Internship(
        json['name'], json['company'], json['location'], json['link']);
  }

  factory Internship.fromJson(Map<String, dynamic> data) {
    return Internship(
        data['name'], data['company'], data['location'], data['link']);
  }
}
