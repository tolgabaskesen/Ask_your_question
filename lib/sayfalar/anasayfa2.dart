import 'package:flutter/material.dart';
import 'package:esoru/model/buttonmodel.dart';


final Color backgroundColor = Color(0xFF4A4A58);

class Anasayfa2 extends StatefulWidget {
  @override
  _Anasayfa2State createState() => _Anasayfa2State();
}

class _Anasayfa2State extends State<Anasayfa2>
    with SingleTickerProviderStateMixin {
  bool isCollapsed = true;
  double screenWidth, screenHeight;
  final Duration duration = const Duration(milliseconds: 300);
  AnimationController _controller;
  Animation<double> _scaleAnimation;
  Animation<double> _menuScaleAnimation;
  Animation<Offset> _slideAnimation;
  double maxWidht = 150;

  double minWidht = 0;

  Animation<double> widthAnimation;
  int currentSelectedIndex = 1;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: duration);
    _scaleAnimation = Tween<double>(begin: 1, end: 0.6).animate(_controller);
    _menuScaleAnimation =
        Tween<double>(begin: 0.5, end: 1).animate(_controller);
    _slideAnimation = Tween<Offset>(begin: Offset(-1, 0), end: Offset(0, 0))
        .animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    screenHeight = size.height;
    screenWidth = size.width;

    return Scaffold(
      backgroundColor: backgroundColor,
      body: Stack(
        children: <Widget>[
          menu(context),
          dashboard(context),
        ],
      ),
    );
  }

  Widget menu(context) {
    return SlideTransition(
      position: _slideAnimation,
      child: ScaleTransition(
        scale: _menuScaleAnimation,
        child: Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                ButtonAnimation("Ana Sayfa", Icons.home, 0),
                SizedBox(height: 10),
                ButtonAnimation("Menü", Icons.menu, 1),
                SizedBox(height: 10),
                ButtonAnimation("Çıkış", Icons.exit_to_app, 2),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget dashboard(context) {
    return AnimatedPositioned(
      duration: duration,
      top: 0,
      bottom: 0,
      left: isCollapsed ? 0 : 0.4 * screenWidth,
      right: isCollapsed ? 0 : -0.2 * screenWidth,
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: Material(
          animationDuration: duration,
          borderRadius: BorderRadius.all(Radius.circular(40)),
          elevation: 8,
          color: backgroundColor,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            physics: ClampingScrollPhysics(),
            child: Container(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 48),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      InkWell(
                        child: Icon(Icons.menu, color: Colors.white),
                        onTap: () {
                          setState(() {
                            if (isCollapsed)
                              _controller.forward();
                            else
                              _controller.reverse();

                            isCollapsed = !isCollapsed;
                          });
                        },
                      ),
                      Text("E - SORU",
                          style: TextStyle(fontSize: 24, color: Colors.white)),
                      Icon(Icons.settings, color: Colors.white),
                    ],
                  ),
                  SizedBox(height: 50),
                  Container(
                    height: 200,
                    child: PageView(
                      controller: PageController(viewportFraction: 0.8),
                      scrollDirection: Axis.horizontal,
                      pageSnapping: true,
                      children: <Widget>[
                        Container(
                          child: FlatButton(
                            onPressed: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return Anasayfa2();
                                },
                              ),
                            ),
                            padding: EdgeInsets.all(0.0),
                            child: Image.asset(
                              "assets/images/matematik.jpg",
                              height: 300,
                              width: 300,
                            ),
                          ),
                        ),
                        Container(
                          child: FlatButton(
                            onPressed: () {},
                            padding: EdgeInsets.all(0.0),
                            child: Image.asset(
                              "assets/images/fen.jpg",
                              height: 300,
                              width: 300,
                            ),
                          ),
                        ),
                        Container(
                          child: FlatButton(
                            onPressed: () {},
                            padding: EdgeInsets.all(0.0),
                            child: Image.asset(
                              "assets/images/turkce.jpg",
                              height: 300,
                              width: 300,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 40),
                  Text(
                    "DENEME",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  Container(
                    height: 500,
                    child: ListView.separated(
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text(
                              "Sorular",
                              style: TextStyle(color: Colors.red),
                            ),
                            subtitle: Text("E-SORU"),
                            trailing: Text("Deneme"),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return Divider(height: 16);
                        },
                        itemCount: 20),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
