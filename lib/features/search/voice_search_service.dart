import 'package:speech_to_text/speech_to_text.dart' as stt;

class VoiceSearchService {
  final stt.SpeechToText _speech = stt.SpeechToText();
  bool _isAvailable = false;

  /// Initialize speech recognition
  Future<bool> initSpeech() async {
    _isAvailable = await _speech.initialize();
    return _isAvailable;
  }

  /// Start listening and return the recognized text in real-time
  Future<void> startListening(Function(String) onResult) async {
    if (!_isAvailable) return;

    _speech.listen(
      onResult: (result) {
        onResult(result.recognizedWords);
      },
      listenMode: stt.ListenMode.dictation,
    );
  }

  /// Stop listening
  void stopListening() {
    _speech.stop();
  }
}
