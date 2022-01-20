void main(){
  //byZero();
  myClass("qwerty");
}

void myClass(String str) {
  try {
    ExceptionTest test = ExceptionTest (str);
    print("Имя: ${test.str}");
  } on StrNotSpaceException{
    print("^_____________^");
  }
  catch (err, stack) {
    print("ошибка: $err");
    print("Стэк: $stack");
  }
}

void byZero() {
  int a = 100500;
  try {
    a = 3~/0;
  } /*on IntegerDivisionByZeroException{
    print("Зачем на ноль-то сразу?! Нормально же общались...");
  } */
  catch (err, stack) {
    int a = 0;
    print("ошибка: $err");
    print("Стэк: $stack");
  }
  finally {
    print(a);
  }
}

class ExceptionTest {
  String str = " ";
  ExceptionTest (this.str){
    if (str != " "){
      throw StrNotSpaceException();
    }else{
      this.str = str;
    }
  }
}

class StrNotSpaceException implements Exception{
  String getErrorMassage(){
    return "Сюда модно вводить только пробел :) и только один }:D";
  }
}