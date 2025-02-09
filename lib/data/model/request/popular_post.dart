class PopularPost {
  String? category;

  PopularPost(
    this.category
  );

  PopularPost.fromJson(Map<String, dynamic> json) {
    category = json['category'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['category'] = this.category;
    return data;
  }
}