// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_completion_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatComletionRequest _$ChatComletionRequestFromJson(
        Map<String, dynamic> json) =>
    ChatComletionRequest(
      model: json['model'] as String,
      messages: (json['messages'] as List<dynamic>)
          .map((e) => ChatCompletionMessage.fromJson(e as Map<String, dynamic>))
          .toList(),
      max_tokens: json['max_tokens'] as int? ?? 100,
      stream: json['stream'] as bool? ?? false,
    );

Map<String, dynamic> _$ChatComletionRequestToJson(
        ChatComletionRequest instance) =>
    <String, dynamic>{
      'model': instance.model,
      'messages': instance.messages.map((e) => e.toJson()).toList(),
      'max_tokens': instance.max_tokens,
      'stream': instance.stream,
    };
