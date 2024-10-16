import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/core/utils/responsive.dart';
import 'package:portfolio/core/utils/responsive_appbar.dart';
import 'package:portfolio/core/widgets/appbar/desktop_appbar.dart';
import 'package:portfolio/core/widgets/appbar/mobile_appbar.dart';
import 'package:portfolio/core/widgets/appbar/tablet_appbar.dart';
import 'package:portfolio/core/widgets/footer/desktop_footer.dart';
import 'package:portfolio/features/about/desktop_about_screen.dart';
import 'package:portfolio/features/about/mobile_about_screen.dart';
import 'package:portfolio/features/experience/desktop_experience.dart';
import 'package:portfolio/features/home/layouts/home_layout.dart';
import 'package:portfolio/features/home/layouts/mobile_layout.dart';
import 'package:portfolio/features/landing/desktop_landing_screen.dart';
import 'package:portfolio/features/works/desktop_works_screen.dart';

import '../../core/widgets/custom_drawer.dart';
import '../landing/mobile_landing_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  bool firstLoad = true;

  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        firstLoad = false;
      });
    });

    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeIn);
    _controller.forward();

    _scrollController.addListener(() {
      if (_scrollController.offset >= 100 && !_showButton) {
        setState(() {
          _showButton = true;
        });
      } else if (_scrollController.offset < 100 && _showButton) {
        setState(() {
          _showButton = false;
        });
      }
    });
  }

  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalObjectKey _landingKey = const GlobalObjectKey('landingKey');
  final GlobalObjectKey _aboutKey = const GlobalObjectKey("about");
  final GlobalObjectKey _worksKey = const GlobalObjectKey("work");
  final GlobalObjectKey _experienceKey = const GlobalObjectKey("experience");
  final ScrollController _scrollController = ScrollController();
  bool _showButton = false;

  void _scrollToTop() {
    _scrollController.animateTo(
      0.0,
      duration: const Duration(milliseconds: 1000),
      curve: Curves.decelerate,
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return firstLoad
        ? Scaffold(
            backgroundColor: const Color.fromARGB(255, 29, 36, 41),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 100,
                    width: 100,
                    child: Transform.scale(
                      scale: 2,
                      child: const CircularProgressIndicator.adaptive(),
                    ),
                  ),
                  Text('Loading Portfolio',
                      style: GoogleFonts.bebasNeue(
                        fontSize: 60,
                        fontWeight: FontWeight.w100,
                        height: 1,
                        color: Colors.white,
                      ))
                ],
              ),
            ))
        : FadeTransition(
            opacity: _animation,
            child: Scaffold(
              key: _scaffoldKey,
              backgroundColor: const Color.fromARGB(255, 29, 36, 41),
              appBar: ResponsiveAppBar(
                desktop: DesktopAppbar(
                  landingKey: _landingKey,
                  aboutKey: _aboutKey,
                  worksKey: _worksKey,
                  experienceKey: _experienceKey,
                ),
                mobile: MobileAppbar(
                  scaffoldKey: _scaffoldKey,
                ),
                tablet: const TabletAppbar(),
              ),
              endDrawer: ResponsiveAppBar.isMobile(context)
                  ? const CustomDrawer()
                  : null,
              body: SingleChildScrollView(
                controller: _scrollController,
                child: Responsive(
                    mobile: MobileLayout(
                        aboutKey: _aboutKey,
                        experienceKey: _experienceKey,
                        landingKey: _landingKey,
                        workKey: _worksKey),
                    tablet: Container(),
                    desktop: HomeLayout(
                        aboutKey: _aboutKey,
                        experienceKey: _experienceKey,
                        landingKey: _landingKey,
                        workKey: _worksKey)),
              ),
              floatingActionButton: Visibility(
                visible: _showButton,
                child: GestureDetector(
                  onTap: _scrollToTop,
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    margin: const EdgeInsets.only(right: 10),
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: Colors.white),
                    child: const Icon(
                      Icons.arrow_upward_outlined,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
          );
  }
}

class CustomDivider extends StatelessWidget {
  final double paddingWidth;
  const CustomDivider({super.key, this.paddingWidth = 40});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: paddingWidth),
      child: const Divider(
        thickness: 0.5,
      ),
    );
  }
}
