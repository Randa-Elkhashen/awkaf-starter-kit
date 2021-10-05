import 'package:flutter/material.dart';
import 'package:flutter_app/views/widgets/buttons/app_icon_button.dart';
import 'package:flutter_app/views/widgets/text_to_speech/text_to_speech_widget.dart';
import 'package:share_plus/share_plus.dart';

class TextToSpeechFromWidgetScreen extends StatefulWidget {
  const TextToSpeechFromWidgetScreen({Key? key}) : super(key: key);

  @override
  State<TextToSpeechFromWidgetScreen> createState() => _TextToSpeechFromWidgetScreenState();
}

class _TextToSpeechFromWidgetScreenState extends State<TextToSpeechFromWidgetScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      children: [
        Row(
          children: [
            TextToSpeechWidget(text: _arabicText),
            Spacer(),
            AppIconButton(
              iconData: Icons.share,
              onPressed: (){
                Share.share('check out our website https://turndigital.net/');
              },
            )
          ],
        ),
        Text(
          _arabicText,
          style: Theme.of(context).textTheme.bodyText1,
          textDirection: TextDirection.rtl,
        ),
      ],
    );
  }

  String _arabicText =
  """اجتمع السيد الرئيس عبد الفتاح السيسي اليوم مع الدكتور مصطفى مدبولي رئيس مجلس الوزراء، والدكتورة 
هالة السعيد وزيرة التخطيط والتنمية الاقتصادية، والدكتورة مايا مرسي رئيس المجلس القومي للمرأة، 
والدكتور خالد زكريا محمد أمين رئيس مركز السياسات الاقتصادية بالمعهد القومي للتخطيط.

وصرح المتحدث الرسمي باِسم رئاسة الجمهورية بأن الاجتماع تناول عرض جهود الحكومة المصرية في دعم 
إطلاق تقرير التنمية البشرية في مصر، بالتعاون مع البرنامج الإنمائي للأمم المتحدة بالقاهرة، وذلك بعد توقف 
إصدار التقرير طوال السنوات العشر الماضية منذ عام ٢٠١١.

وأضاف المتحدث الرسمي أن التقرير المُشار إليه يعتمد على الإطار المفاهيمي الخاص بتحقيق التنمية الشاملة 
في النواحي الاقتصادية والسياسية والاجتماعية والثقافية، وتعزيز التنمية البشرية والاستثمار والإصلاح 
الاقتصادي والاجتماعي، وكذا تعزيز الاستدامة البيئية من أجل تحقيق غايات وأهداف التنمية المستدامة.

ويستند التقرير إلى عدة محاور رئيسية تشمل ما تم في الدولة من إصلاح اقتصادي والتأسيس لانطلاقة تنموية، 
وبرامج الحماية الاجتماعية الهادفة نحو تحقيق عقد اجتماعي أكثر شمولًا في مصر، والاستثمار في الثروة 
البشرية من خلال التعليم والصحة والسكن اللائق، بالإضافة إلى محور النهضة الجديدة للمرأة المصرية، فضلًا عن 
إدارة نظم الحماية البيئية، وكذلك تطوير عملية الحوكمة لإنشاء منظومة فعالة لإدارة شؤون الدولة والمجتمع.

وقد وجه السيد الرئيس الحكومة في هذا الإطار بالقيام بالتوثيق الدقيق لكافة جهود الدولة التي شملت جميع 
القطاعات على مستوى الجمهورية خلال السنوات الماضية وذلك لإتاحة البيانات الدقيقة والمفصلة حول ما يتم 
من جهود تنموية شاملة وعميقة تمتد لجميع نواحي الحياة في مصر، وهو الأمر الذي يدعم قدرات الرصد 
والتحليل ودقة المؤشرات التي تصدر عن المؤسسات المتخصصة فيما يتعلق بعملية التنمية في مصر.""";
}
