// ignore_for_file: unused_local_variable

void vars() {
  var x = 1;
  var y = 'IFMA';
}

void numbers() {
  int i = 0;
  double d = 3.14;
  num n1 = 3;
  num n2 = 3.33;
}

void strings() {
  String s1 = 'abc';
}

void records() {
  var record1 = ('first', a: 2, b: true, 'last');

  (String, int) record2 = ('Caxias', 123);

  ({int a, bool b}) record3 = (b: true, a: 123);

  print(record1.$1);
  print(record1.a);
}

void lists() {
  var lst1 = [1, 2, 3, 4]; // List<int>
  var lst2 = const ['IFMA', 'Caxias']; //  List<String>

  lst1[0] = 9;
  lst1.add(5);

  // lst2[0] = 'ABC'; //Erro lista constante

  print('$lst1 | lenght ${lst1.length}');
}

void sets() {
  var set1 = {'a', 'e', 'i', 'o', 'u'};
  var set2 = <String>{};

  set2.add('z');
  set2.addAll(set1);
  print(set2.length);
}

void maps() {
  var map1 = {
    1: 'abc',
    2: 'xyz',
  };

  var map2 = <int, String>{};
  map2[1] = 'Caxias';
  map2[2] = 'Codó';

  print(map1);
}

Function functions() {
  soma(a, b) => a + b;
  return (i) => 2 * soma(i, i);
}
