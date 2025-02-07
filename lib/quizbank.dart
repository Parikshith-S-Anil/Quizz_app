import 'question.dart';

class QuizBank {
  int _QuestionNumber = 0;
  List<Question> _questionBank = [
    Question(q: 'The atomic number for lithium is 17', a: false),
    Question(q: 'The black box in a plane is black', a: false),
    Question(q: 'There are two parts of the body that can\'t heal themselves', a: false),
    Question(q: 'Alexander Fleming discovered penicillin', a: true),
    Question(q: 'The only letter not in the periodic table is the letter J', a: true),
    Question(q: 'Water expands when it freezes.', a: true),
    Question(q: 'Humans can survive without oxygen for up to an hour.', a: false),
    Question(q: 'DNA is the primary genetic material in humans and most other organisms.', a: true),
    Question(q: 'Gold is a good conductor of electricity.', a: true),
    Question(q: 'Antibiotics are effective against viruses.', a: false),
    Question(q: 'The adult human body has 32 teeth.', a: true),
    Question(q: 'Mars is known as the “Red Planet” due to its blue skies.', a: false),
    Question(q: 'A kilogram of lead is heavier than a kilogram of feathers.', a: false),
    Question(q: 'The smallest bone in the human body is located in the ear.', a: true),
    Question(q: 'The initial construction of the Great Wall of China began during the reign of Emperor Qin Shi Huang.', a: true),
    Question(q: 'The Titanic was discovered before the 20th century ended.', a: true),
  ];

  void nextQuestion(){
    if (_QuestionNumber < _questionBank.length-1){
      _QuestionNumber++;
      print(_QuestionNumber);
      print(_questionBank.length);
    }
  }

  String getQuestiontext(){
    return _questionBank[_QuestionNumber].questionText;
  }
  bool getQuestionAnswer(){
    return _questionBank[_QuestionNumber].questionAnswer;
  }

  bool isFinished(){
    if(_QuestionNumber == _questionBank.length-1){
      return true;
    }
    else{
      return false;
    }
  }

  void reset(){
    _QuestionNumber = 0;
  }
}