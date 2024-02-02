import 'package:flutter/material.dart';

class LoadingIndicator extends StatelessWidget {
  final bool isLoading;
  final Widget child;
  const LoadingIndicator(
      {super.key, this.isLoading = false, required this.child});

  @override
  Widget build(BuildContext context) {
    return isLoading ? const Center(child: CircularProgressIndicator()) : child;
  }
}
