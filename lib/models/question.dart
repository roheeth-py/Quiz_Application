class Questions{

  const Questions(this.questions, this.answers);

  final String questions;
  final List<String> answers;

  List<String> shuffledList(){
     final shuffledAns = List.of(answers);
     shuffledAns.shuffle();
     return shuffledAns;
  }
}