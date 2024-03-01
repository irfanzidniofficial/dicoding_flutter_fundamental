import 'package:cupertino_app/pages/feeds_pages.dart';
import 'package:cupertino_app/pages/search_page.dart';
import 'package:cupertino_app/pages/settings_page.dart';
import 'package:flutter/cupertino.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Example CupertinoPagScaffold

    // return CupertinoPageScaffold(
    //   navigationBar: const CupertinoNavigationBar(
    //     middle: Text("Cupertino App"),
    //   ),
    //   child: Center(
    //     child: Text(
    //       "Home Page",
    //       style: CupertinoTheme.of(context).textTheme.navLargeTitleTextStyle,
    //     ),
    //   ),
    // );

    // Example CupertinoTabScaffold

    return CupertinoTabScaffold(
        tabBar: CupertinoTabBar(items: const [
          BottomNavigationBarItem(
              icon: Icon(
                CupertinoIcons.news,
              ),
              label: "Feeds"),
          BottomNavigationBarItem(
              icon: Icon(
                CupertinoIcons.search,
              ),
              label: "Search"),
          BottomNavigationBarItem(
              icon: Icon(
                CupertinoIcons.settings,
              ),
              label: "Setting"),
        ]),
        tabBuilder: (context, index) {
          switch (index) {
            case 0:
              return const FeedsPage();
            case 1:
              return const SearchPage();
            case 2:
              return const SettingsPage();

            default:
              return const Center(
                child: Text("Page not found!"),
              );
          }
        });
  }
}
