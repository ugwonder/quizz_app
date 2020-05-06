import 'questions.dart';

class Quiz {
  int _questionNumber = 0;

  List<Question> _questionCollection = [
    Question('Are you a happy person', true),
    Question('Did giving us this task make u happy', true),
    Question('Do you think I am angry at you for this task', false),
    Question('In the future will you give this type of task on time', true),
    Question('Do you have money', true),
    Question('Will you do give away', true),
    Question('Yes!! You will do giveaway so we can buy panadol and beer', true),
    Question('ABEG NAA!! You will do it abi', true),
    Question('If i forked a repo editted it and submitted, will i pass?', true ),
    Question('Will i get my complete mark for this', false ),
    Question('Is it my fault?', false),
    Question('Should we point fingers', false)

  ];
    void nextQuestion() {
      if(_questionNumber < _questionCollection.length - 1) {
        _questionNumber++;
      }
    }

    String getQuestionText() {
      return _questionCollection[_questionNumber].questionText;
    }

    bool getCorrectAnswer() {
      return _questionCollection[_questionNumber].questionAnswer;
    }
    bool isFinished() {
      if(_questionNumber >= _questionCollection.length -1) {
        print('Now returning true');
        return true;
      } else {
        return false;
      }
    }
    void reset() {
      _questionNumber = 0;
    }
}
