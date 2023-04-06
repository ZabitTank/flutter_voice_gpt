// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_completion_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatCompletionResponse _$ChatCompletionResponseFromJson(
        Map<String, dynamic> json) =>
    ChatCompletionResponse(
      choices: (json['choices'] as List<dynamic>)
          .map((e) => ChatCompletionChoice.fromJson(e as Map<String, dynamic>))
          .toList(),
    )
      ..id = json['id'] as String?
      ..object = json['object'] as String?
      ..created = json['created'] as int?
      ..model = json['model'] as String?
      ..usage = json['usage'] == null
          ? null
          : ChatCompletionUsage.fromJson(json['usage'] as Map<String, dynamic>);

Map<String, dynamic> _$ChatCompletionResponseToJson(
        ChatCompletionResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'object': instance.object,
      'created': instance.created,
      'model': instance.model,
      'usage': instance.usage?.toJson(),
      'choices': instance.choices.map((e) => e.toJson()).toList(),
    };

ChatCompletionUsage _$ChatCompletionUsageFromJson(Map<String, dynamic> json) =>
    ChatCompletionUsage(
      completion_tokens: json['completion_tokens'] as int?,
      prompt_tokens: json['prompt_tokens'] as int?,
      total_tokens: json['total_tokens'] as int?,
    );

Map<String, dynamic> _$ChatCompletionUsageToJson(
        ChatCompletionUsage instance) =>
    <String, dynamic>{
      'prompt_tokens': instance.prompt_tokens,
      'completion_tokens': instance.completion_tokens,
      'total_tokens': instance.total_tokens,
    };

ChatCompletionChoice _$ChatCompletionChoiceFromJson(
        Map<String, dynamic> json) =>
    ChatCompletionChoice(
      message: ChatCompletionMessage.fromJson(
          json['message'] as Map<String, dynamic>),
      index: json['index'] as int,
      finish_reason: json['finish_reason'] as String,
    );

Map<String, dynamic> _$ChatCompletionChoiceToJson(
        ChatCompletionChoice instance) =>
    <String, dynamic>{
      'message': instance.message,
      'finish_reason': instance.finish_reason,
      'index': instance.index,
    };

ChatCompletionMessage _$ChatCompletionMessageFromJson(
        Map<String, dynamic> json) =>
    ChatCompletionMessage(
      role: json['role'] as String,
      content: json['content'] as String,
    );

Map<String, dynamic> _$ChatCompletionMessageToJson(
        ChatCompletionMessage instance) =>
    <String, dynamic>{
      'role': instance.role,
      'content': instance.content,
    };
