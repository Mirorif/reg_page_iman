import 'package:flutter/material.dart';
import 'package:reg_page_iman/auth/custom_expansion_panel.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: _title,
      home: MyExpansionContainer(),
    );
  }
}

class MyExpansionContainer extends StatefulWidget {
  const MyExpansionContainer({Key? key}) : super(key: key);

  @override
  State<MyExpansionContainer> createState() => _MyExpansionContainerState();
}

class _MyExpansionContainerState extends State<MyExpansionContainer> {
  @override
  Widget build(BuildContext context) {
    final List<Information> data = [
      Information(
          longText:
              "IMAN Invest обладает локальным и международным фетва о халяльности деятельности. Инвестиции в IMAN являются халальными, так как  1) IMAN не выдает деньги в долг, а продаёт товары и услуги с наценкой  2) IMAN не использует пени и штраф в случае просрочек  3) IMAN привлекает инвестиции на основе партнерства, а не гарантированно прибыли",
          shortText: "Почему инвестиции в IMAN халяльные?"),
      Information(
          longText:
              "IMAN Invest обладает локальным и международным фетва о халяльности деятельности. Инвестиции в IMAN являются халальными, так как  1) IMAN не выдает деньги в долг, а продаёт товары и услуги с наценкой  2) IMAN не использует пени и штраф в случае просрочек  3) IMAN привлекает инвестиции на основе партнерства, а не гарантированно прибыли",
          shortText: "Почему инвестиции в IMAN халяльные?"),
      Information(
          longText:
              "IMAN Invest обладает локальным и международным фетва о халяльности деятельности. Инвестиции в IMAN являются халальными, так как  1) IMAN не выдает деньги в долг, а продаёт товары и услуги с наценкой  2) IMAN не использует пени и штраф в случае просрочек  3) IMAN привлекает инвестиции на основе партнерства, а не гарантированно прибыли",
          shortText: "Почему инвестиции в IMAN халяльные?"),
      Information(
          longText:
              "IMAN Invest обладает локальным и международным фетва о халяльности деятельности. Инвестиции в IMAN являются халальными, так как  1) IMAN не выдает деньги в долг, а продаёт товары и услуги с наценкой  2) IMAN не использует пени и штраф в случае просрочек  3) IMAN привлекает инвестиции на основе партнерства, а не гарантированно прибыли",
          shortText: "Почему инвестиции в IMAN халяльные?"),
      Information(
          longText:
              "IMAN Invest обладает локальным и международным фетва о халяльности деятельности. Инвестиции в IMAN являются халальными, так как  1) IMAN не выдает деньги в долг, а продаёт товары и услуги с наценкой  2) IMAN не использует пени и штраф в случае просрочек  3) IMAN привлекает инвестиции на основе партнерства, а не гарантированно прибыли",
          shortText: "Почему инвестиции в IMAN халяльные?"),
    ];
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
        ),
        body: Container(
          color: Colors.white,
          padding: const EdgeInsets.all(30.0),
          child: ListView(
            children: [
              const Padding(
                padding:  EdgeInsets.only(bottom:  15.0),
                child:  Text(
                  "Часто задаваемые вопросы",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 26,
                    color: Color(0xff040415),
                    fontFamily: 'Gilroy',
                  ),
                ),
              ),
              ListView.builder(
                  shrinkWrap: true,
                  itemCount: data.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: [
                        ExpansionContainer(
                          header: Text(data[index].shortText, style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            color: Color(0xff040415),
                            fontFamily: 'Gilroy',
                          ),),
                          body: Text(data[index].longText, style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            color: Color.fromRGBO(4, 4, 21, 0.6),
                            fontFamily: 'Gilroy',
                          ),),
                          duration: const Duration(milliseconds: 300),
                          decoration: const BoxDecoration(color: Colors.white),
                        ),
                        Container(child: data.length - 1 != index ?const Divider() : null),
                      ],
                    );
                  }),
            ],
          ),
        ));
  }
}

class Information {
  String shortText;
  String longText;

  Information({
    required this.longText,
    required this.shortText,
  });
}
