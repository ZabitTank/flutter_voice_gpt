// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';
part 'chat_completion_response.g.dart';

@JsonSerializable(explicitToJson: true)
class ChatCompletionResponse {
  String? id;
  String? object;
  int? created;
  String? model;
  ChatCompletionUsage? usage;
  List<ChatCompletionChoice> choices;

  ChatCompletionResponse({required this.choices});

  factory ChatCompletionResponse.fromJson(Map<String, dynamic> json) =>
      _$ChatCompletionResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ChatCompletionResponseToJson(this);
}

@JsonSerializable()
class ChatCompletionUsage {
  int? prompt_tokens;
  int? completion_tokens;
  int? total_tokens;

  ChatCompletionUsage({
    this.completion_tokens,
    this.prompt_tokens,
    this.total_tokens,
  });

  factory ChatCompletionUsage.fromJson(Map<String, dynamic> json) =>
      _$ChatCompletionUsageFromJson(json);

  Map<String, dynamic> toJson() => _$ChatCompletionUsageToJson(this);
}

@JsonSerializable()
class ChatCompletionChoice {
  ChatCompletionMessage message;
  String finish_reason;
  int index;

  ChatCompletionChoice({
    required this.message,
    required this.index,
    required this.finish_reason,
  });

  factory ChatCompletionChoice.fromJson(Map<String, dynamic> json) =>
      _$ChatCompletionChoiceFromJson(json);

  Map<String, dynamic> toJson() => _$ChatCompletionChoiceToJson(this);
}

@JsonSerializable()
class ChatCompletionMessage {
  String role;
  String content;

  ChatCompletionMessage({
    required this.role,
    required this.content,
  });

  factory ChatCompletionMessage.fromJson(Map<String, dynamic> json) =>
      _$ChatCompletionMessageFromJson(json);

  Map<String, dynamic> toJson() => _$ChatCompletionMessageToJson(this);
}
