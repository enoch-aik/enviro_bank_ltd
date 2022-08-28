import 'package:enviro_bank_ltd/export.dart';
import 'package:enviro_bank_ltd/src/screens/home/components/body.dart';
import 'package:enviro_bank_ltd/src/screens/home/components/drawer.dart';
import 'package:enviro_bank_ltd/src/widgets/custom_drawer.dart';

class HomeScreen extends ConsumerWidget {
  static const id = '/home_screen';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final drawerController = ZoomDrawerController();
    /*return Scaffold(drawer: const Drawer(), appBar: AppBar(), body: const Body());*/
    return KScaffold(
      body: FancyZoomDrawer(
          menuScreen: FancyDrawer(drawerController: drawerController),
          mainScreen: HomeBody(
            drawerController: drawerController,
          ),
          borderRadius: 24.0,
          style: DrawerStyle.style1,
          showShadow: false,
          angle: 0.0,
          openCurve: Curves.linear,
          closeCurve: Curves.linearToEaseOut,
          //backgroundColor: Colors.grey[300]!,
          slideWidth: MediaQuery.of(context).size.width * 0.65),
    );
  }
}
