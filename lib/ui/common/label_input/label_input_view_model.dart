import 'package:stacked/stacked.dart';

class LabelInputViewModel extends BaseViewModel {
  final _emailPlaceholder = 'Enter Your Email Here ...';
  final _passwordPlaceHolder = 'Enter Your Password Here ...';
  String get emailPlaceHolder => _emailPlaceholder;
  String get passwordPlaceHolder => _passwordPlaceHolder;
}
