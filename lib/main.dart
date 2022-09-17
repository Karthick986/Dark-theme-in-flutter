import 'package:flutter/material.dart';
import 'package:flutter_demo/dark_theme_provider.dart';
import 'package:flutter_demo/theme_styles.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  DarkThemeProvider themeProvider = DarkThemeProvider();

  @override
  void initState() {
    super.initState();

    getCurrentTheme();
  }

  void getCurrentTheme() async {
    themeProvider.darkTheme = await themeProvider.myPreferences.getTheme();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => themeProvider,
      child: Consumer<DarkThemeProvider>(builder: (context, value, child) {
        return MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeStyles.themeStatus(themeProvider.darkTheme, context),
          debugShowCheckedModeBanner: false,
          home: const MyHomePage(title: 'Dark Mode'),
        );
      },)
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<DarkThemeProvider>(context);

    return Scaffold(
        appBar: AppBar(
      title: Text(widget.title),
    ),
    body: Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.lightbulb_rounded, size: MediaQuery.of(context).size.width/2,
          color: themeProvider.darkTheme ? Theme.of(context).disabledColor : Colors.orangeAccent,),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(themeProvider.darkTheme ? "Dark Theme" : "Light Theme",
              style: TextStyle(color: Theme.of(context).indicatorColor, fontSize: 20),),
              const SizedBox(width: 16,),
              Switch(
                value: themeProvider.darkTheme,
                onChanged: (value) => themeProvider.darkTheme = value,
                activeColor: Theme.of(context).primaryColor,
              )
            ],
          )
        ],
      ),
    ),);
  }
}
