import 'package:enviro_bank_ltd/core/helpers/keyboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class KScaffold extends ConsumerWidget {
  final PreferredSizeWidget? appBar;
  final Widget? body;
  final Widget? bottomSheet;
  final Color? backgroundColor;
  final Widget? floatingActionButton;
  final List<Widget>? persistentFooterButtons;
  final Widget? drawer;
  final void Function(bool)? onDrawerChanged;
  final Widget? endDrawer;
  final Widget? bottomNavigationBar;
  final bool? resizeToAvoidBottomInset;

  const KScaffold(
      {Key? key,
      this.appBar,
      this.floatingActionButton,
      this.body,
      this.backgroundColor,
      this.bottomNavigationBar,
      this.onDrawerChanged,
      this.persistentFooterButtons,
      this.drawer,
      this.resizeToAvoidBottomInset,
      this.endDrawer,
      this.bottomSheet})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () {
        KeyboardUtil.hideKeyboard(context);
      },
      child: SafeArea(
        child: Scaffold(
          appBar: appBar,
          floatingActionButton: floatingActionButton,
          bottomNavigationBar: bottomNavigationBar,
          bottomSheet: bottomSheet,
          drawer: drawer,
          persistentFooterButtons: persistentFooterButtons,
          endDrawer: endDrawer,
          backgroundColor: backgroundColor,
          onDrawerChanged: onDrawerChanged,
          body: body,
        ),
      ),
    );
  }
}
