abstract class Calculation {

  final int maxOperands = 5;

  double plus(List<double> value);
  double minus(List<double> value);
  double multiply(List<double> value);
  double divide(List<double> value);
  double sqrt(double value);
  void next();
  void back();
  double getResult();
}