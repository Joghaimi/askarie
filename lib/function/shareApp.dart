import 'package:wc_flutter_share/wc_flutter_share.dart';

void shareApp(){
  var subject= "قطاعة";
  var shareText= "";
  WcFlutterShare.share(
      sharePopupTitle: subject,
      subject: subject,
      text: shareText,
      mimeType: 'text/plain');
}
