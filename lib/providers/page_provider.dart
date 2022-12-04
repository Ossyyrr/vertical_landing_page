import 'package:flutter/material.dart';
import 'package:universal_html/html.dart' as html; // html para web y mobile

class PageProvider extends ChangeNotifier {
  PageController scrollController = PageController();

  final List<String> _pages = ['home', 'about', 'pricing', 'contact', 'location'];

  /// Al entrar por url
  void createScrollController(String routeName) {
    scrollController = PageController(initialPage: getPageIndex(routeName));
    html.document.title = routeName; // TITULO DE LA PAGINA
  }

  int getPageIndex(String routeName) {
    return (!_pages.contains(routeName)) ? 0 : _pages.indexOf(routeName);
  }

  void changeUrl(int index) {
    html.window.history.pushState('', '', '#/${_pages[index]}');
    html.document.title = _pages[index]; // TITULO DE LA PAGINA
  }

  void goTo(int index) {
    scrollController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }
}
