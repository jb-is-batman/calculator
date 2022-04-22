import 'package:logger/logger.dart';
import 'package:stacked/stacked.dart';

class HomeScreenViewModel extends BaseViewModel {

  final Logger _logger = Logger();

  void plusTapped() {
    _logger.d("PLUS");
  }

  void minusTapped() {
    _logger.d("MINUS");
  }

  void multiplyTapped() {
    _logger.d("MULTIPLY");
  }

  void divideTapped() {
    _logger.d("DIVIDE");
  }

  void sqrtTapped() {
    _logger.d("SQRT");
  }
}