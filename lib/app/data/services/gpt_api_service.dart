import 'package:flutter_voice_gpt/app/data/models/locals/gpt_model_info.dart';
import 'package:flutter_voice_gpt/app/data/models/rest/chat_completion_request.dart';
import 'package:flutter_voice_gpt/app/data/models/rest/chat_completion_response.dart';
import 'package:flutter_voice_gpt/app/data/providers/api_provider.dart';
import 'package:flutter_voice_gpt/core/values/constants.dart';

import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class GptApiService {
  static Future<List<GPTModelInfo>> getModels() async {
    try {
      var response =
          await APIHandlerImp.instance.get(APIPath.getModel, useToken: true);

      if (response.data['error'] != null) {
        return Future.error(response.data['error']['message']);
      }

      List modelSnapshot = [];
      for (var model in response.data['data']) {
        modelSnapshot.add(model);
      }

      return GPTModelInfo.modelsFromSnapshot(modelSnapshot);
    } catch (e) {
      return Future.error("App Error");
    }
  }

  static Future<ChatCompletionResponse> sendRequest(
      ChatComletionRequest requestBody) async {
    try {
      var response = await APIHandlerImp.instance
          .post(requestBody, APIPath.getMessage, useToken: true);

      if (response.data['error'] != null) {
        return Future.error(response.data['error']['message']);
      }

      return ChatCompletionResponse.fromJson(response.data);
    } catch (e) {
      return Future.error("App Error");
    }
  }

  static Stream<String> receiveGenerateTextStream(
      ChatComletionRequest requestBody, StreamController controller) async* {
    final url = Uri.parse('https://api.openai.com/v1/completions');
    final headers = {'Authorization': 'Bearer YOUR_API_KEY'};

    // Create a StreamedRequest and write the request body as a stream
    final request = http.Request('POST', url);
    request.headers.addAll(headers);

    final body = jsonEncode({
      'prompt': "prompt",
      'temperature': '0.5',
      'max_tokens': '10',
    });

    request.body = body;

    // Send the request and handle the response as a stream
    final response = await request.send();

    // final stream = response.stream.transform(utf8.decoder);
    // final buffer = StringBuffer();
    // await for (final chunk in stream) {
    //   buffer.write(chunk);
    //   final data = jsonDecode(buffer.toString());
    //   final text = data['choices'][0]['text'] as String;
    //   yield text;
    //   buffer.clear();
    // }

    await for (final data in response.stream.transform(utf8.decoder)) {
      final decodedData = jsonDecode(data);
      final text = decodedData['choices'][0]['text'];
      controller.add(text);
    }
  }
}
