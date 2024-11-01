class PartItem {
  final String name;
  final int quantity;
  final String status;
  final int partId;
  final String notes;
  List<String> buyingChoice;

  PartItem({
    required this.name,
    required this.quantity,
    required this.status,
    required this.partId,
    required this.notes,
    required this.buyingChoice,
});
}
