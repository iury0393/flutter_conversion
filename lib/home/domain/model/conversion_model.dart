class ConversionModel {
  String? code;
  String? codeIn;
  String? name;
  String? high;
  String? low;
  String? pctChange;
  String? bid;
  String? ask;
  String? varBid;
  String? timestamp;
  String? createDate;

  ConversionModel({
    this.code,
    this.codeIn,
    this.name,
    this.high,
    this.low,
    this.pctChange,
    this.bid,
    this.ask,
    this.varBid,
    this.timestamp,
    this.createDate,
  });

  ConversionModel fromJson(Map<String, dynamic> json) {
    return ConversionModel(
        code: json['code'],
        codeIn: json['codeIn'],
        name: json['name'],
        high: json['high'],
        low: json['low'],
        pctChange: json['pctChange'],
        bid: json['bid'],
        ask: json['ask'],
        varBid: json['varBid'],
        timestamp: json['timestamp'],
        createDate: json['createDate']);
  }
}
