
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


  
}

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
    print("Displaying news headlines here: $displayingNewsHeadlines");
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
