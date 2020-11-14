import 'package:flutter/material.dart';

class Constant {
  // Text
  static const AppName = "قطاعة";
  static const K_MultiChoise = "اختيار من متعدد";
  static const K_QuestionsAndAnswer = "سؤال وجواب";
  static const K_Save = 'حفظ';
  static const K_NextQs = 'التالي';
  static const K_UnitTestSelect = "بعد الانتهاء من اختيار الوحد قم بالضغط على ايقونة الريشه لبدأ الاختبار";
  static const K_Loading = "جار التحميل";
  static const K_PSelectUnits = "تستطيع إجراء اختبار صغير من هنا لكن عليك تحديد عدة وحدات من المادة  قبل ذلك";
  static const K_privateLink = "روابط خاصة";
  static const K_publicLink = "روابط مهمة";
  static const K_URLTitle ="عنوان الرابط";
  static const K_URL ="الرابط";
  static const K_MaterialLib= "مكتبة المواد";
  static const K_MaterialLibTXT= "يحتوي التطبيق على المراجع الأشهر لمقرّراتك، بالإضافة لملخصات وأسئلة سنوات، مرتبة بطريقة مدروسة اعتمادًا على ترتيب الكتاب.و ليس هذا و حسب بل مع قطاعة يمكنك اختبار مدى كفاءة دراستك عن طريق امتحانات قصيرة داخل التطبيق.";
  static const K_LinkLib= "ميزة الروابط";
  static const K_LinkLibTXT= "يوفّر لك التطبيق أيضًا:جميع الروابط الخاصّة بجامعتك، مثل:\n رابط بوابة الطالب، ورابط التعلم الإلكتروني، ورابط حساب المعدل وغيرها.\nبإمكانك أيضًا حفظ جميع الروابط الخاصة بك.";
  static const K_intro="أهلًا بك في تطبيق قطّاعة !";
  static const K_introTXT="التطبيق الأمثل لمذاكرة مقرّراتك الدراسية، بطريقة سهلة، مضمونة، منظمة وسريعة، وبأقل جهد ممكن.";
  static const K_ShareTXT = "ادرس من كتاب و من ملخص و اختبر نفسك، التطبيق المناسب لتكون قطّاعة.\n رابط التطبيق:https://play.google.com/store/apps/details?id=com.joghaimi.askarie";
  static const K_IntroFinalTXT ="قطّاعة.. طريقك لتكون قطاعة ^^";
  static const K_IntroFinish = "Done";
  static const K_ChoseUniversity = "اختيار الجامعه";
  static const K_CantOpenLink = "لا يمكن فتح الرابط";
  static const K_LinkCopied = "تم نسخ الرابط";
  static const K_LinkDeleted = "تم حذف الرابط";
  static const K_AddLink = "قم بأضافة روابط";
  static const K_AllMaterial = "جميع المواد";
  static const uniName =[
  "الجامعة الأردنية ( عمان )",
  "الجامعة الأردنية ( العقبة )",
  "الجامعة الهاشمية",
  "جامعة العلوم والتكنولوجيا الأردنية",
  "جامعة اليرموك",
  "جامعة البلقاء التطبيقية ( المركز/السلط )",
  "جامعة البلقاء التطبيقية ( كلية الهندسة التكنولوجية )",
  "جامعة البلقاء التطبيقية ( كلية عمان الجامعية للعلوم المالية والإدارية )",
  "جامعة البلقاء التطبيقية ( كلية عجلون الجامعية )",
  "جامعة البلقاء التطبيقية ( كلية الأميرة رحمة الجامعية )",
  "جامعة البلقاء التطبيقية ( كلية الأميرة عالية الجامعية )",
  "جامعة البلقاء التطبيقية ( كلية الشوبك الجامعية ",
  "جامعة البلقاء التطبيقية ( كلية الزرقاء الجامعية )",
  "جامعة البلقاء التطبيقية ( كلية إربد الجامعية )",
  "جامعة البلقاء التطبيقية ( كلية الكرك الجامعية )",
  "جامعة البلقاء التطبيقية ( كلية الحصن الجامعية )",
  "جامعة البلقاء التطبيقية ( كلية معان الجامعية )",
  "جامعة البلقاء التطبيقية ( كلية العقبة الجامعية )",
  "جامعة البلقاء التطبيقية ( أكاديمية الأمير حسين للحماية المدنية )",
  "جامعة الحسين التقنية",
  "جامعة العلوم التطبيقية",
  "الجامعة الألمانية الأردنية",
  "جامعة الإسراء",
  "جامعة الأميرة سميّة للتكنولوجيا",
  "جامعة البتراء",
  "جامعة الزيتونة الأردنية",
  "جامعة نيويورك",
  "جامعة العلوم الإسلامية العالمية",
  "جامعة إربد الأهلية",
  "جامعة جدارا",
  "جامعة الزرقاء الأهلية",
  "جامعة عمان الأهلية",
  "جامعة فيلادلفيا",
  "جامعة جرش الأهلية",
  "جامعة مؤتة",
  "جامعة آل البيت",
  "جامعة الحسين بن طلال",
  "جامعة الطفيلة التقنية"];
  // Color
  static const C_Purple = Color(0xFF290737);
  static const PrimaryColor = Color(0xFF0D113E);
  static const SecondryColor = Color(0xFFF5F5F5);
  static const C_White = Colors.white;
  static const C_Gray = Color(0xFFEEEEEE);
  static const C_TextGray = Color(0xFFBEBEBE);
  static const C_TextGray_Deep = Color(0xFF9A9A9A);
  static var C_Purpel_Color = [
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white
  ];
  static const C_Red = Color(0xFFDF2935);
  static const MaterialColorArray = [
    Color(0xFF0D113E),
    Color(0xFF855EF8),
    Color(0xFFE54980),
    Color(0xFF18BF8D),
    Color(0xFF32B6E7),
    Color(0xFF628b48),
    Color(0xFF612940),
    Color(0xFFDF2935),
    Color(0xFF4f518c),
    Color(0xFFd1345b),
    Color(0xFFb07bac),
    Color(0xFFe5446d),
    Color(0xFF1e000e),
    Color(0xFF0d3b66),
  ];
}
