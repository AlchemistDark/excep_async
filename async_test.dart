import 'dart:async';

void main() async{
  print(aSynchron("1"));
  print(await synchron("2"));

  print(await aSynchron("3"));
  print(await synchron("4"));
  print(/*await*/ aSyn());
  print(await sync());
  String str = await aSyn();     // Попробовал передать результат между асинхронными функциями.
  print(await synchron(str));
  cF(5);
  cA(3, 2);                      // Эта функция, кроме прочего, позволяет видеть как работает "расписание событий".
  ifF(true);
  ifF(false);
  ifAs(ifF(true));
  cStream(5, false);
  cStream(5, true);
  print("End of Mine");
}

Future<String> aSynchron (str) async {
  Future<String> sync = Future(() => "aSynchron $str");
  return sync;
}

Future<String> synchron(str) {
  Future<String> sync = Future(() => "synchron $str");
  return sync;
}

Future<String> aSyn () async {
  await Future.delayed(Duration(milliseconds: 5000));
  return "aSyn";
}

Future<String> sync() {
  return Future.delayed(Duration(milliseconds: 800), () => "sync");
}

// TODO вызывать из цикла Future
void cF(int a){
  for (int i = 1; i <= a; i++) {
    Future.delayed(Duration(seconds: i), () => print("cF $i"));
  }
}

// TODO вызвать из цикла async
void cA(int a, int b) {
  for (int i = 1; i <= a; i++) {
    aC(i, b);
  };
}

void aC (int a, int b) async {
  for (int i = 1; i <= b; i++) {
    await fPrint(a, i);
    print("$a,$i");
  }
}

Future<String> fPrint(int a, b){
  String str = "fPrint $a, $b";
  print(str);
  return Future.delayed(Duration(milliseconds: 500), () => str);
}

// TODO вызвать их из if
String ifF(bool flag){
  if (flag) {
    Future.delayed(Duration(seconds: 15), () => print("flag is true"));
    return "true";
  } else {
    Future.delayed(Duration(seconds: 10), () => print("flag is lie"));
    return "false";
  }
}

Future<void>ifAs(String str) async {
  if (str == "true") {
    await Future.delayed(Duration(seconds: 11), () => print("everything is true"));
  }else if (str == "false") {
    await Future.delayed(Duration(seconds: 12), () => print("everything is lie"));
  }
  else {
    await Future.delayed(Duration(seconds: 13), () => print("everything is dust and ash"));
  }
}
// TODO аналогично попробовать со stream
void cStream(int i, bool  b) async {
  final controller = StreamController<String>();
  StreamSubscription sub = controller.stream.listen((str) {print(str);});
  for (int a = 1; a <= i; a++) {
    controller.add("strFor $a");
    await Future.delayed(Duration(milliseconds: 300));
  }
  if (b) {
    controller.add("strIf $b");
    await Future.delayed(Duration(milliseconds: 300));
  }
  sub.cancel();
}

