import 'package:dev_quiz/views/challenge/widgets/next_button/next_button_widget.dart';
import 'package:dev_quiz/views/challenge/widgets/question_indication/question_indicator.dart';
import 'package:dev_quiz/views/challenge/widgets/quiz/quiz_widget.dart';
import 'package:flutter/material.dart';

class ChallengePage extends StatefulWidget {
  @override
  _ChallengePageState createState() => _ChallengePageState();
}

class _ChallengePageState extends State<ChallengePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(110),
        child: SafeArea(
          top: true,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BackButton(),
//! Caso queira colocar um button personalizado de voltar, essa seria a opção
              // IconButton(
              //   icon: Icon(Icons.close),
              //   onPressed: () {
              //     Navigator.pop(context);
              //   },
              // ),
//! <------------------------------------------------------------------
              QuestionIndicator(),
            ],
          ),
        ),
      ),
      body: QuizWidget(
        title: "O que o Flutter faz em sua totalidade?",
      ),
      bottomNavigationBar: SafeArea(
        bottom: true,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
                child: NextButtonWidget.white(
              label: 'Pular',
              onTap: () {},
            )),
            Expanded(
                child: NextButtonWidget.green(
              label: 'Confirmar',
              onTap: () {},
            )),
          ],
        ),
      ),
    );
  }
}
