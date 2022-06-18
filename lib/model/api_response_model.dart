import 'package:equatable/equatable.dart';

class ApiResponseModel extends Equatable {
  final int statusCode;
  final dynamic body;

  @override
  List<Object> get props => [statusCode, body];

  const ApiResponseModel({required this.statusCode, required this.body});
}
