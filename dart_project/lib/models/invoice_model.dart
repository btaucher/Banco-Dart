class InvoiceModel {
  final double value;
  final DateTime opensAt;
  final DateTime closesAt;
  // TODO(danifbn): Fazer um Model
  final List transactionHistory;
  final InvoiceStatus status;

  InvoiceModel({
    required this.value,
    required this.opensAt,
    required this.closesAt,
    required this.transactionHistory,
    required this.status,
  });
}

enum InvoiceStatus { open, paid, overdue }
