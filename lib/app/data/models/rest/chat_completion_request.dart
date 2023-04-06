import 'package:flutter_voice_gpt/app/data/models/rest/chat_completion_response.dart';
import 'package:json_annotation/json_annotation.dart';
part 'chat_completion_request.g.dart';

@JsonSerializable(explicitToJson: true)
class ChatComletionRequest {
  String model;
  List<ChatCompletionMessage> messages;

  ChatComletionRequest({required this.model, required this.messages});

  factory ChatComletionRequest.fromJson(Map<String, dynamic> json) =>
      _$ChatComletionRequestFromJson(json);

  Map<String, dynamic> toJson() => _$ChatComletionRequestToJson(this);
}
