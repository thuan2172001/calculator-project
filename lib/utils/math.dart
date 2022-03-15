import 'package:untitled/constants.dart';

int isValidOperation(String op) {
  if (op == ButtonId.plus || op == ButtonId.minus) return 1;
  if (op == ButtonId.multiplication || op == ButtonId.division) return 2;
  return 0;
}

double _applyOperator(double a, double b, String op) {
  if (op == ButtonId.plus) return a + b;
  if (op == ButtonId.minus) return a - b;
  if (op == ButtonId.multiplication) return a * b;
  if (op == ButtonId.remainder) return a % b;
  return a / b;
}

double calculate(String expression) {
  expression = expression.replaceAll(',', '');

  try {
    List<double> values = [];
    List<String> operators = [];

    for (int i = 0; i < expression.length; i++) {
      if (RegExp(r'\d').hasMatch(expression[i])) {
        String value = '';
        while (i < expression.length && (RegExp(r'\d').hasMatch(expression[i]) || expression[i] == ButtonId.dot)) {
          value += expression[i];
          i++;
        }
        values.add(double.parse(value));
        i--;
      } else {
        while (operators.isEmpty == false && isValidOperation(operators.last) >= isValidOperation(expression[i])) {
          double secondValue = values.removeLast();
          double firstValue = values.removeLast();

          String op = operators.removeLast();

          values.add(_applyOperator(firstValue, secondValue, op));
        }

        operators.add(expression[i]);
      }
    }

    while (operators.isEmpty == false) {
      double secondValue = values.removeLast();
      double firstValue = values.removeLast();

      String op = operators.removeLast();

      values.add(_applyOperator(firstValue, secondValue, op));
    }

    return values.last;
  } catch (error) {
    print(error);
  }

  return double.infinity;
}
