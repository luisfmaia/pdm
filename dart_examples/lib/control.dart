void loops() {
  var collection = [1, 2, 3];

  while (collection.isNotEmpty) {
    collection.removeAt(0);
  }

  collection.add(1);
  do {
    collection.add(collection.last + 1);
  } while (collection.length < 5);

  for (int i = 0; i < collection.length; i++) {
    var number = collection[i];
    if (number != 3) {
      continue;
    }
    print(number);
  }

  collection.forEach(print);

  print(collection.map((c) => c * 2));

  collection.where((c) => c >= 3).forEach(print);
}

void branches() {
  var str = 'Caxias';

  if (str == 'Codó') {
    print('COD');
  } else if (str == 'Aldeias Altas') {
    print('AAL');
  } else {
    print('CXS');
  }

  switch (str) {
    case 'Caxias':
      print('1');
      continue novoCaso; // Continua em novo caso

    case 'Codó':
    case 'Aldeias Altas':
      print('2');
      break;

    novoCaso:
    case 'São Luís':
      print('3'); // Executa para Caxias e São Luís
  }

  var num = 2;
  switch (num) {
    case 0 || 2:
      print('Zero ou dois');
      break;
    case (> 5) && (< 10):
      print('Maior que cinco e menor que 10');
    default:
      print('Outros');
  }

  var cidade = switch (num) {
    0 || 1 => 'Caxias',
    2 => 'Codó',
    3 => 'Aldeias Altas',
    _ => 'São Luís'
  };
  print(cidade);
}
