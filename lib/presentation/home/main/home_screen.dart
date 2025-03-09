import 'package:daepiro/presentation/home/main/home_view_model.dart';
import 'package:daepiro/presentation/home/main/disaster_home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'normal_home_screen.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> with WidgetsBindingObserver {

  @override
  Widget build(BuildContext context) {
    final viewModel = ref.watch(homeStateNotifierProvider);

    return Scaffold(
        body: SafeArea(
          child: viewModel.isLoading
              ? Container(
                  padding: const EdgeInsets.only(top: 100),
                  color: Colors.white,
                  child: const Center(child: CircularProgressIndicator())
                )
              : viewModel.isOccurred
                  ? const DisasterHomeScreen()
                  : const NormalHomeScreen()
        )
    );
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);

    if (state == AppLifecycleState.resumed) {
      ref.read(homeStateNotifierProvider.notifier).getHomeStatusRe(
          ref.watch(homeStateNotifierProvider).isOccurred
      );
    }
  }
}
