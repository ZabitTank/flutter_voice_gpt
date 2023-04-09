class STTService {
  // static final SpeechToText _speechToText = SpeechToText();

  // static Future<String?> listen() async {

  // }

  // static Future<dynamic> stop() async {
  //   await _speechToText.stop();
  // }

  // static Stream<String>? _recognizedTextStream;
  // static late StreamController<String> _recognizedTextController;
  // static final SpeechToText _speech = SpeechToText();

  // static Stream<String> get recognizedTextStream {
  //   if (_recognizedTextStream == null) {
  //     _recognizedTextController = StreamController<String>();
  //     _recognizedTextStream = _startListening();
  //   }
  //   return _recognizedTextStream!;
  // }

  // static Future<bool> initialize() async {
  //   return await _speech.initialize(
  //     onStatus: (status) => print('Status: $status'),
  //     onError: (error) => print('Error: $error'),
  //   );
  // }

  // static Stream<String> _startListening() {
  //   _speech.listen(
  //     onResult: (result) {
  //       String text = result.recognizedWords;
  //       _recognizedTextController.add(text);
  //     },
  //   );
  //   return _recognizedTextController.stream;
  // }

  // void stopListening() {
  //   _speech.stop();
  //   _recognizedTextController.close();
  //   _recognizedTextStream = null;
  // }
}
