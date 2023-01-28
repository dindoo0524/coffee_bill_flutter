class BillModel {
  final int seq, userId, status;
  final String name, description;

  BillModel.fromJson(Map<String, dynamic> json)
      : seq = json['seq'],
        userId = json['userId'],
        status = json['status'],
        name = json['name'],
        description = json['description'];
  // endTime = json['endTime']; // Null 처리
}
