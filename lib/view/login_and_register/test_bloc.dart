import 'dart:async';

enum Gender { male, female }

class GenderBloc {
  final _genderController = StreamController<Gender>();
  Stream<Gender> get genderStream => _genderController.stream;

  void selectGender(Gender gender) {
    _genderController.sink.add(gender);
  }

  void dispose() {
    _genderController.close();
  }
}
