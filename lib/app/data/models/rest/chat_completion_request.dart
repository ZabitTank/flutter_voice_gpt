import 'package:flutter_voice_gpt/app/data/models/rest/chat_completion_response.dart';
import 'package:json_annotation/json_annotation.dart';
part 'chat_completion_request.g.dart';

@JsonSerializable(explicitToJson: true)
class ChatComletionRequest {
  String model;
  List<ChatCompletionMessage> messages;
  int? max_tokens;
  bool? stream;

  ChatComletionRequest(
      {required this.model,
      required this.messages,
      this.max_tokens = 100,
      this.stream = false});

  factory ChatComletionRequest.fromJson(Map<String, dynamic> json) =>
      _$ChatComletionRequestFromJson(json);

  Map<String, dynamic> toJson() => _$ChatComletionRequestToJson(this);
}
