import 'package:dev_quiz/core/app_text_styles.dart';
import 'package:dev_quiz/views/challenge/answer/answer_widgwt.dart';
import 'package:flutter/material.dart';

class QuizWidget extends StatelessWidget {
  final String title;

  const QuizWidget({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Text(
              title,
              style: AppTextStyles.heading,
            ),
          ),
          SizedBox(
            height: 24,
          ),
          AnswerWidget(
            title: "Kit de desenvolvimento de  intefarce de usuários",
            isRight: false,
            isSelected: false,
          ),
          AnswerWidget(
            title: "Possibilita a criação de aplicativos copilados",
            isSelected: true,
            isRight: true,
          ),
          AnswerWidget(
            title: "Acho que é uma marca de café do Himalaia",
            isSelected: true,
            isRight: false,
          ),
          AnswerWidget(
            title: "Possibilita a criação desktops que são muito incríveis",
            isSelected: false,
            isRight: false,
          ),
        ],
      ),
    );
  }
}
