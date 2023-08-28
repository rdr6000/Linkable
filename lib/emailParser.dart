import 'package:linkable_text_widget/constants.dart';
import 'package:linkable_text_widget/link.dart';
import 'package:linkable_text_widget/parser.dart';

class EmailParser implements Parser {
  String text;

  EmailParser(this.text);

  parse() {
    String pattern = r"[\w-\.]+@([\w-]+\.)+[\w-]{2,4}";

    RegExp regExp = RegExp(pattern);

    Iterable<RegExpMatch> _allMatches = regExp.allMatches(text);
    List<Link> _links = <Link>[];
    for (RegExpMatch match in _allMatches) {
      _links.add(Link(regExpMatch: match, type: email));
    }
    return _links;
  }
}
