class CurrentWeek {
  CurrentWeek({
    required this.status,
    required this.payload,
  });
  late final bool status;
  late final int payload;

  CurrentWeek.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    payload = json['payload'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['payload'] = payload;
    return _data;
  }
}
