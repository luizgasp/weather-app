import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerWeatherDetailsInfo extends StatelessWidget {
  const ShimmerWeatherDetailsInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Shimmer.fromColors(
      baseColor: Colors.grey.shade200.withOpacity(0.5),
      highlightColor: Colors.white.withOpacity(0.7),
      child: Container(
        width: size.width * 0.6,
        height: size.height * 0.09,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.7),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}