class RssItem {
  final String? id;
  final String? name;
  final String? price;
  final String? telcoPrice;

  RssItem({
    this.id,
    this.name,
    this.price,
    this.telcoPrice, required String pubDate, required title,
  });

  factory RssItem.fromJson(Map<String, dynamic> json) {
    return RssItem(
      id: json['id'],
      name: json['name'],
      price: json['price'],
      telcoPrice: json['telco_price'], pubDate: json['pubDate'], title: json['title'],
    );
  }

  get pubDate => null;

  get title => null;
}

List<RssItem> parseRssItems(List<dynamic> json) {
  return json.map((item) => RssItem.fromJson(item)).toList();
}
