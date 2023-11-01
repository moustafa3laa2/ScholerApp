import 'package:schooler_app/constants.dart';

class Messages {
  final String message;
  final String id;
  Messages(
     
     this.message,
     this.id,
  );

  factory Messages.fromJson(jsonData) {
    return Messages( jsonData[keyMessage],  jsonData[kID]);
  }
}
