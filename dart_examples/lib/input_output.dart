import 'dart:io';

void output() {
  print("Hello World!!!\n");
}

void inputString() {
  stdout.write("Digite seu nome: ");

  String? name = stdin.readLineSync();

  print("Olá, $name!");
}

void inputNumber() {
  print("Digite um número.");
  int n = int.parse(stdin.readLineSync()!);

  print("Você digitou o número $n.");
}
