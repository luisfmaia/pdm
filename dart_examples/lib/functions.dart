import 'dart:math';

int calculate() {
  return 6 * 7;
}

bool ehPar(int n) {
  return (n % 2 == 0);
}

bool ehImpar([int n = 0]) {
  return (n % 2 != 0);
}

String formataEndereco(String rua, String bairro, String cidade,
    [String num = 'S/N', String? cep]) {
  if (cep != null) {
    return 'Rua $rua $num, Bairro $bairro, $cidade, CEP $cep.';
  } else {
    return 'Rua $rua $num, Bairro $bairro, $cidade.';
  }
}

(double, double) calcularRaizes(double a, double b, double c) {
  double delta = b * b - 4 * a * c;
  if (delta < 0) {
    print('A equação não possui raízes reais.');
    return (0, 0);
  } else if (delta == 0) {
    double raiz = -b / (2 * a);
    return (raiz, raiz);
  } else {
    double raiz1 = (-b + sqrt(delta)) / (2 * a);
    double raiz2 = (-b - sqrt(delta)) / (2 * a);
    return (raiz1, raiz2);
  }
}

void anonimas() {
  const lst1 = ['IFMA', 'Campus', 'Caxias'];

  var lst2 = lst1.map((item) {
    return item.toUpperCase();
  });
  print(lst2);

  lst1
      .map((item) => item.toUpperCase())
      .forEach((item) => print('$item: ${item.length}'));

  minusculas(str) => '${str.toLowerCase()}';

  print(lst1.map(minusculas));
}

void aninhadas() {
  bool ordenadas(String str1, String str2) {
    return (str1.compareTo(str2) < 0);
  }

  print('Ordenadas: ${ordenadas("abc", "xyz")}');
}
