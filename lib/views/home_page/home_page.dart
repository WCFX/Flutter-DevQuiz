import 'package:dev_quiz/core/app_colors.dart';
import 'package:dev_quiz/controllers/home_controller.dart';
import 'package:dev_quiz/views/challenge/challenge_page.dart';
import 'package:dev_quiz/views/home_page/home_state.dart';
import 'package:dev_quiz/views/home_page/quiz_card/quiz_card_widget.dart';
import 'package:dev_quiz/views/home_page/widgets/appbar/app_bar_widget.dart';
import 'package:dev_quiz/views/home_page/widgets/level_button/level_button_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = HomeController();

  @override
  void initState() {
    super.initState();
    controller.fetchData();
    controller.stateNotifier.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    if (controller.state == HomeState.success)
      return Scaffold(
        appBar: AppBarWidget(
          user: controller.user!,
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 40, right: 5, bottom: 0, left: 5),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                LevelButtonWidget(
                  label: "Fácil",
                ),
                LevelButtonWidget(
                  label: "Médio",
                ),
                LevelButtonWidget(
                  label: "Difícil",
                ),
                LevelButtonWidget(
                  label: "Perito",
                ),
              ]),
              SizedBox(
                height: 16,
              ),
              Expanded(
                child: GridView.count(
                  crossAxisSpacing: 14,
                  mainAxisSpacing: 14,
                  crossAxisCount: 2,
                  children: controller.quizzes!
                      .map((e) => QuizCardWidget(
                            title: e.title,
                            percent: e.questionAnswered / e.questions.length,
                            completed:
                                "${e.questionAnswered} de ${e.questions.length}",
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ChallengePage(
                                          questions: e.questions)));
                            },
                          ))
                      .toList(),
                ),
              ),
            ],
          ),
        ),
      );
    else {
      return Scaffold(
        body: Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(AppColors.chartPrimary),
          ),
        ),
      );
    }
  }
}
