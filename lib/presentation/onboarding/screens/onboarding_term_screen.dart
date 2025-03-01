import 'package:daepiro/presentation/const/string_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OnboardingTermScreen extends ConsumerWidget {
  final String? id;
  const OnboardingTermScreen({super.key, this.id});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
          child: SingleChildScrollView(
            child: termTextWidget(int.tryParse(id ?? '0') ?? 0)
          ),
        ),
      ),
    );
  }

  Widget termTextWidget(int id) {
    if(id == 0) {
      return Text(StringHelper.usingTermText);
    } else if(id == 1) {
      return Text(StringHelper.infoTermText);
    } else if(id==2) {
      return Text(StringHelper.locationTermText);
    } else {
      return SizedBox.shrink();
    }
  }
}