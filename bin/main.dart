
import 'dart:async';



void main(List<String> arguments) {
  print("----------------------------------------------");
  print("----------------------------------------------");
  print("----------------------------------------------");
  print("----------------------------------------------");
  print("----------------------------------------------");
  print("----------------------------------------------");
  print('Dart Quick Start Chapter 8');
  print('8. Multithreaded Programming Using Future and Callable Classes');
  // https://learning.oreilly.com/library/view/quick-start-guide/9781484255629/A490744_1_En_8_Chapter.html

  // Callable Classes
  sampleCode1();
  code8_1();
  code8_2();
  //  Future, Async, Await, and Asynchronous Programming
  code8_3();
  code8_4();

  code8_6();
  code8_8();

  code8_9();
//  code8_10();





}
//----------------------------------------------
//----------------------------------------------
/*
void code8_10() {
  print("----------------------------------------------");
  print("----------------------------------------------");
  print("Code 8.10");
  print("");
  Future<int>.delayed(
    Duration(seconds: 6),
        () => throw 'We are throwing some error here.',
  ).then((value) {
    print(value);
  });
  print('Waiting for a value');

}
 */

//----------------------------------------------
//----------------------------------------------

void code8_9() {
  print("----------------------------------------------");
  print("----------------------------------------------");
  print("Code 8.9");
  print("");
  Future<int>.delayed(
    Duration(seconds: 6),
        () { return 200; },
  ).then((value) { print(value); });
  print('Waiting for a value for 6 seconds...');
}

//----------------------------------------------
//----------------------------------------------



void code8_8() {
  print("----------------------------------------------");
  print("----------------------------------------------");
  print("Code 8.8");
  print("");
  // the main UI thread starts after that the heavy operations will take place
  print("The main UI thread is starting on here.");
  print("Now it will take xx seconds to display news headlines.");
  displayNews3();
  print("The main UI thread ends.");
  // this program remains incomplete, we don't get the result
  // it is because the main UI thread is overlapping before 10 seconds
  // therefore we need await and async APIs to block main UI thread for 10 seconds
}

// this is where our heavy operations are taking place
Future<String> checkingNewsApp3() {
  // since we are returning a string value
  // by delaying the main UI thread for 10 seconds
  int secondToDelay = 10;
  Future<String> delayingTenSeconds =  Future.delayed(Duration(seconds: secondToDelay), (){
    return "The latest headlines are displayed here after $secondToDelay seconds.";
  });
  // after 10 seconds the news headlines will be displayed
  return delayingTenSeconds;
}
void displayNews3() async {
  // here we will primarily display the news headline
  String displayingNewsHeadlines = await checkingNewsApp3();
  print("Displaying news headlines here: $displayingNewsHeadlines");
}

//----------------------------------------------
//----------------------------------------------


void code8_6() {
  print("----------------------------------------------");
  print("----------------------------------------------");
  print("Code 8.6");
  print("");
  print("The main UI thread is starting on here.");
  print("Now it will take 3 seconds to display the version of Dart.");
  checkVersion();
  print("The main UI thread ends.");

}

Future<String> checkingVersion() {
  // since we are returning a string value
  // by delaying the main UI thread for 3 seconds
  int secondToDelay = 9;
  Future<String> delayingTenSeconds =  Future.delayed(Duration(seconds: secondToDelay), (){
    return "The version 2.1 is displayed here after $secondToDelay seconds.";
  });
  // after 3 seconds the version will be displayed
  return delayingTenSeconds;
}

void checkVersion() async {
  String version = await checkingVersion();
  // Do something with version
  try {
    print("Displaying version here: $version");
  } catch (e) {
    // React to inability to look up the version
    return e;
  }
}
//----------------------------------------------
//----------------------------------------------

void code8_4() {
  print("----------------------------------------------");
  print("----------------------------------------------");
  print("Code 8.4");
  print("");

  // the main UI thread starts after that the heavy operations will take place
  print("The main UI thread is starting on here.");
  print("Now it will take 10 seconds to display news headlines.");
  displayNews2();
  print("The main UI thread ends.");
  // this program remains incomplete, we don't get the result
  // it is because the main UI thread is overlapping before 10 seconds
  // therefore we need the Future API to block main UI thread for 10 seconds
}

// this is where our heavy operations are taking place
Future<String> checkingNewsApp2() {
  // since we are returning a string value
  // by delaying the main UI thread for 10 seconds
  int secondsToDelay = 10;
  Future<String> delayingSeconds =  Future.delayed(Duration(seconds: secondsToDelay), (){
    return "The latest headlines are displayed here after $secondsToDelay seconds.";
  });
  // after 10 seconds the news headlines will be displayed
  return delayingSeconds;
}

void displayNews2() {
  // here we will primarily display the news headline
  Future<String> displayingNewsHeadlines = checkingNewsApp2();
  // inside then we need an anonymous function like lambda or anonymous function
  displayingNewsHeadlines.then((displayString){
    print("Displaying news headlines here 2: $displayString");
  });
}

//----------------------------------------------
//----------------------------------------------


//code 8.3
//import 'dart:async';
// our all operations will use the main UI thread
//since dart and flutter are single threaded we need to use Future, Async amd Await APIs
//void main(){
//  // the main UI thread starts after that the heavy operations will take place
//  print("The main UI thread is starting on here.");
//  print("Now it will take 10 seconds to display news headlines.");
//  displayNews();
//  print("The main UI thread ends.");
//  // this program remains incomplete, we don't get the result
//  // it is because the main UI thread is overlapping before 10 seconds
//  // therefore we need await and async APIs to block main UI thread for 10 seconds
//}
// this is where our heavy operations are taking place
Future<String> checkingNewsApp() {
  // since we are returning a string value
  // by delaying the main UI thread for 10 seconds
  Future<String> delayingTenSeconds =  Future.delayed(Duration(seconds: 10), (){
    return "The latest headlines are displayed here after 10 seconds.";
  });
  // after 10 seconds the news headlines will be displayed
  return delayingTenSeconds;
}

void displayNews() {
  // here we will primarily display the news headline
  Future<String> displayingNewsHeadlines = checkingNewsApp();
  // inside then we need an anonymous function like lambda or anonymous function
  displayingNewsHeadlines.then((displayString){
    // it will give the future object
//    print("Displaying news headlines here 1: $displayingNewsHeadlines");
  });
}

void code8_3() {
  print("----------------------------------------------");
  print("----------------------------------------------");
  print("Code 8.3");
  print("");

  // the main UI thread starts after that the heavy operations will take place
  print("The main UI thread is starting on here.");
  print("Now it will take 10 seconds to display news headlines.");
  displayNews();
  print("The main UI thread ends.");
  // this program remains incomplete, we don't get the result
  // it is because the main UI thread is overlapping before 10 seconds
  // therefore we need await and async APIs to block main UI thread for 10 seconds
}


//----------------------------------------------
//----------------------------------------------

//code 8.2
//when dart class is callable like a function, use call() function
class Person{
  String name;
  String call(String message, [name]){
    return "This message: '$message', has been passed to the person $name.";
  }
}

void code8_2() {
  print("----------------------------------------------");
  print("----------------------------------------------");
  print("Code 8.2");
  print("");

  var John = Person();
  John.name = "John Smith";
  String name = John.name;
  String msgAndName = John("Hi John how are you?", name);
  print(msgAndName);
  msgAndName = John("Hi John how are you?");
  print(msgAndName);
}

//----------------------------------------------
//----------------------------------------------



//----------------------------------------------
//----------------------------------------------

class CallableClassWithoutArgument {
  String output = "Callable class";
  void call() {
    print(output);
  }
}
class CallableClassWithArgument {
  call(String name) => "$name";
}

void code8_1() {
  print("----------------------------------------------");
  print("----------------------------------------------");
  print("Code 8.1");
  print("");

  var withoutArgument = CallableClassWithoutArgument();
  var withArgument = CallableClassWithArgument();
  withoutArgument(); // it is equivalent to withoutArgument.call()
  print(withArgument("John Smith")); //OK.
  // withArgument(); //it'll give error
  print(withArgument.call("Calling John Smith"));
}

//----------------------------------------------
//----------------------------------------------

class WantToBeFunction {

  call(String name, String location, String message) =>
      '$name, $location $message!';
}

void sampleCode1() {
  print("----------------------------------------------");
  print("----------------------------------------------");
  print("Sample Code 1");
  print("");

  var callableClass = new WantToBeFunction();
  var callableVariable = callableClass("Tony", "Harvey", "my home");
  print("$callableVariable");
}
