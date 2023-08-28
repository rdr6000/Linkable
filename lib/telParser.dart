import 'package:linkable_text_widget/constants.dart';
import 'package:linkable_text_widget/link.dart';
import 'package:linkable_text_widget/parser.dart';

class TelParser implements Parser {
  String text;
  bool openInWhatsapp;

  TelParser(this.text, this.openInWhatsapp);

  parse() {
    String pattern = r"\+?\(?([0-9]{2,4})\)?[- ]?([0-9]{3,4})[- ]?([0-9]{3,7})";

    RegExp regExp = RegExp(pattern);

    Iterable<RegExpMatch> _allMatches = regExp.allMatches(text);
    List<Link> _links = <Link>[];
    for (RegExpMatch match in _allMatches) {
      _links
          .add(Link(regExpMatch: match, type: openInWhatsapp ? whatsapp : tel));
    }
    return _links;
  }
}
