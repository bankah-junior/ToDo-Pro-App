class ItemModel {
  String projTitle;
  String itemTitle;
  String itemDescription;
  DateTime itemDate;
  bool isDone;

  ItemModel({
    required this.projTitle,
    required this.itemTitle,
    required this.itemDescription,
    required this.itemDate,
    this.isDone = false,
  });
}
