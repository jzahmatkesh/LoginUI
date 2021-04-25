import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:loginui/module/consts.dart';
import 'package:loginui/module/widget.dart';
import 'package:loginui/provider/mainprovider.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=>MainProvider())
      ],
      child: EasyLocalization(
        child: MyApp(),
        supportedLocales: [Locale('en'), Locale('tr')], 
        fallbackLocale: Locale('en'),
        path: 'lang'
      )
    )
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: context.watch<MainProvider>().theme,
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: screenWidth(context) < 780
            ? BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/background.png'), 
                fit: BoxFit.cover)
            )
            : null,
          child: Row(
            children: [
               screenWidth(context) < 780
                ? Container()
                : Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: isDark(context)
                            ? [
                                Colors.blueGrey.shade900,
                                Colors.blueGrey.shade700,
                                Colors.blueGrey.shade400,
                                Colors.blueGrey.shade200,
                              ]
                            : [
                                Colors.blue.shade200,
                                Colors.blue.shade400,
                                Colors.blue.shade700,
                                Colors.blue.shade900,
                              ]
                        ),
                        image: DecorationImage(
                          image: AssetImage('images/background.png'),
                          fit: BoxFit.cover
                        )
                      ),
                      child: Column(
                        children: [
                          SizedBox(height: 35),
                          Text('welcome'.tr(), style: TextStyle(fontFamily: 'pacifico', fontSize: 48, color: Colors.white70, fontWeight: FontWeight.bold))
                        ],
                      ),
                    )
                  ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: screenWidth(context) < 780 
                      ? screenWidth(context) * 0.18 
                      : screenWidth(context) * 0.07
                    ),
                  child: Card(
                    elevation: 11,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)
                    ),
                    child: Container(
                      height: 460,
                      padding: EdgeInsets.all(18),
                      child: ListView(
                        children: [
                          Container(
                            height: 35,
                            child: Row(
                              children: [
                                Tooltip(message: 'English',child: TextButton(onPressed: ()=>context.setLocale(context.supportedLocales[0]), child: Image(image: AssetImage('images/English.png')))),
                                Tooltip(message: 'Turkey',child: TextButton(onPressed: ()=>context.setLocale(context.supportedLocales[1]), child: Image(image: AssetImage('images/Turkey.png')))),
                                Spacer(),
                                Switch(
                                  value: isDark(context), 
                                  onChanged: (val)=>context.read<MainProvider>().setDarkMode(val ? ThemeData.dark() : ThemeData.light())
                                )
                              ],
                            ),
                          ),
                          CircleAvatar(
                            radius: 65,
                            child: ClipOval(
                              child: Image.asset('images/user.jpg', fit: BoxFit.cover),                              
                            ),
                          ),
                          SizedBox(height: 25),
                          EditBox(hint: 'username'.tr()),
                          EditBox(hint: 'password'.tr(), password: true),
                          SizedBox(height: 25),
                          screenWidth(context) < 780
                            ? Column(children: footerButtons())
                            : Row(children: footerButtons())
                        ],
                      ),
                    ),
                  ),
                )
              ),
            ],
          ),
        )
      ),
    );
  }
}

List<Widget> footerButtons()=>
  [
    Button(caption: 'login'.tr(), icon: Icon(Icons.lock), onPressed: (){}),
    SizedBox(width: 15),
    TextButton(onPressed: (){}, child: Text('forgot password'.tr()))
  ];
