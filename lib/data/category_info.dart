class Category {
  final int categoryId;
  final String nameEn;
  final String nameJa;

  Category({this.categoryId, this.nameEn, this.nameJa});
}

final List<Category> categories = [
  Category(categoryId: 0, nameEn: "general", nameJa: "総合"),
  Category(categoryId: 1, nameEn: "business", nameJa: "ビジネス"),
  Category(categoryId: 2, nameEn: "technology", nameJa: "テクノロジー"),
  Category(categoryId: 3, nameEn: "science", nameJa: "科学"),
  Category(categoryId: 4, nameEn: "health", nameJa: "健康"),
  Category(categoryId: 5, nameEn: "sports", nameJa: "スポーツ"),
  Category(categoryId: 6, nameEn: "entertainment", nameJa: "エンタメ"),
];
