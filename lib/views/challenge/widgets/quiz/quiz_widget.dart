import 'package:dev_quiz/core/app_text_styles.dart';
import 'package:dev_quiz/models/question_model.dart';
import 'package:dev_quiz/views/challenge/answer/answer_widgwt.dart';
import 'package:flutter/material.dart';

class QuizWidget extends StatelessWidget {
  final QuestionModel question;

  const QuizWidget({Key? key, required this.question}) : super(key: key);

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
              question.title,
              style: AppTextStyles.heading,
            ),
          ),
          SizedBox(
            height: 24,
          ),
          ...question.answers
              .map((e) => AnswerWidget(
                    isRight: e.isRight,
                    title: e.title,
                  ))
              .toList()
        ],
      ),
    );
  }
}
