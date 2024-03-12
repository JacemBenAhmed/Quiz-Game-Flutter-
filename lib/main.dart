


import 'package:flutter/material.dart';
import 'package:questions_app/question.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "Questions/Answers Game !",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Color.fromARGB(255, 42, 1, 70),
        ),
        body: Padding(
          padding: const EdgeInsets.all(30.0),
          child: ExamPage(),
        ),
      ),
    );
  }
}

class ExamPage extends StatefulWidget {
  const ExamPage({Key? key}) : super(key: key);

  @override
  State<ExamPage> createState() => _ExamPageState();
}

class _ExamPageState extends State<ExamPage> {


  List<Question> questionList = [
    Question(t:'1+1 = 2 ?' ,i:'images/img-3.jpeg' , ans:true ) ,
     Question(t:'1+5 = 10 ? ' ,i:'images/img-4.jpeg' , ans:false ) ,
      Question(t:'2*2 = 25 ?' ,i:'images/img-5.jpeg' , ans:false ) ,
       Question(t:'5+5 = 10 ?' ,i:'images/img-6.jpg' , ans:true ) 

  ] ;


/*
  List <String>questions =['1+1 = 2 ?' , 
    '1+5 = 10 ? ' ,
    '2*2 = 25 ?' ,
    '5+5 = 10 ?'
  ] ;

  List<String> imgs= ['images/img-3.jpeg' ,
  'images/img-4.jpeg',
  'images/img-5.jpeg',
  'images/img-6.jpg'
  ] ;

  List <bool>answers=[
    true ,
    false , 
    false ,
    true
  ] ;
*/



  var questionIndex = 0 ;
  var answerOk =0 ;
List<Padding> icons =[
    
  ] ;

  void checkAnswer(pickUser)
  {
    setState(() {
        if(pickUser==questionList[questionIndex].questionAnswer)
        {
          print("yess ! ") ;
          answerOk++ ;
          icons.add(Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              Icons.thumb_up ,
              color: Colors.green,
            ),
          ));

        }
        else
        {
          print('noo !') ;
          icons.add(Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              Icons.thumb_down ,
              color: Colors.red,
            ),
          )) ;
        }

        if(questionIndex >= questionList.length -1 )
        {
          Alert(
              context: context,
             
              title: "END GAME",
              desc: "You are complete all questions ! \n your score : $answerOk/4",
              buttons: [
                DialogButton(
                  child: Text(
                    "Try again ",
                    style: TextStyle(color: Color.fromARGB(255, 254, 255, 254), fontSize: 20),
                  ),
                  onPressed: () => Navigator.pop(context),
                  width: 120,
                      )
                    ],
                  ).show();

                  questionIndex=0 ;
                  icons=[] ;
                  answerOk=0 ;
        }
        else
        {
          questionIndex++ ;
        }
                
               


              });
  }
  
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(children: icons,) ,
        Expanded(
          flex: 4,
          child: Column(
            children: [
              Image.asset(questionList[questionIndex].questionImage),
              SizedBox(height: 20),
              Text(
                questionList[questionIndex].questionText,
                style: TextStyle(fontSize: 30.0 ,fontWeight:FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        SizedBox(height: 5), // Ajout d'un SizedBox pour créer un espace
        Expanded(
          child: TextButton(
            child: Text("True"),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.indigo),
              foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
            ),
            onPressed: () {
              checkAnswer(true) ;
            },
          ),
        ),
        SizedBox(height: 10), 
        Expanded(
          child: TextButton(
            child: Text("False"),
            style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all<Color>(Color.fromARGB(255, 243, 56, 10)),
              foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
            ),
            onPressed: () {
            checkAnswer(false) ;
            },
          ),
        ),
      ],
    );
  }
}
