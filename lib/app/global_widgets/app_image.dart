import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';

class AppNetworkImage extends StatelessWidget {
  final String? placeholder;
  final String imageUrl;
  final double? width;
  final double? height;
  final double radius;
  final BoxFit fit;

  const AppNetworkImage({
    super.key,
    required this.imageUrl,
    this.placeholder,
    this.width,
    this.height,
    this.radius = 8,
    this.fit = BoxFit.cover,
  });

  @override
  Widget build(BuildContext context) {
    PlaceholderWidgetBuilder? placeHolderBuilder;
    if (placeholder != null) {
      placeHolderBuilder = (context, url) => AppLocalImage(
            imagePath: placeholder!,
            width: width,
            height: height,
            fit: fit,
          );
    }
    LoadingErrorWidgetBuilder? errorWidgetBuilder;
    if (placeholder != null) {
      errorWidgetBuilder = (context, url, error) => AppLocalImage(
            imagePath: placeholder!,
            width: width,
            height: height,
            fit: fit,
          );
    }

    if (radius > 0) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(radius),
        child: SizedBox(
          height: height,
          width: width,
          child: CachedNetworkImage(
            imageUrl: imageUrl,
            fit: fit,
            placeholder: placeHolderBuilder,
            errorWidget: errorWidgetBuilder,
          ),
        ),
      );
    } else {
      return SizedBox(
        height: height,
        width: width,
        child: CachedNetworkImage(
          imageUrl: imageUrl,
          fit: fit,
          placeholder: placeHolderBuilder,
          errorWidget: errorWidgetBuilder,
        ),
      );
    }
  }
}

class AppLocalImage extends StatelessWidget {
  final String imagePath;
  final VoidCallback? onPressed;
  final double? width;
  final double? height;
  final Color? svgColor;
  final BoxFit fit;
  final EdgeInsetsGeometry? margin;
  final AnimationController? animationController;

  const AppLocalImage({
    super.key,
    required this.imagePath,
    this.onPressed,
    this.width,
    this.height,
    this.svgColor,
    this.fit = BoxFit.cover,
    this.margin,
    this.animationController,
  });

  @override
  Widget build(BuildContext context) {
    if (imagePath.endsWith(".svg")) {
      return SvgImage(
        imagePath: imagePath,
        onPressed: onPressed,
        width: width,
        height: height,
        margin: margin,
        svgColor: svgColor,
      );
    } else if (imagePath.endsWith(".json")) {
      if (onPressed != null) {
        return GestureDetector(
          onTap: onPressed,
          child: Container(
            margin: margin,
            child: Lottie.asset(
              imagePath,
              width: width,
              height: height,
              fit: fit,
              controller: animationController,
            ),
          ),
        );
      } else {
        return Lottie.asset(
          imagePath,
          width: width,
          height: height,
          fit: fit,
        );
      }
    } else {
      if (onPressed != null) {
        return GestureDetector(
          onTap: onPressed,
          child: Container(
            margin: margin,
            child: Image.asset(
              imagePath,
              width: width,
              height: height,
              fit: fit,
            ),
          ),
        );
      } else {
        return Image.asset(
          imagePath,
          width: width,
          height: height,
          fit: fit,
        );
      }
    }
  }
}

class SvgImage extends StatelessWidget {
  final String imagePath;
  final double? width;
  final double? height;
  final Color? svgColor;
  final EdgeInsetsGeometry? margin;
  final VoidCallback? onPressed;

  const SvgImage({
    super.key,
    required this.imagePath,
    this.width,
    this.height,
    this.svgColor,
    this.margin,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    if (onPressed == null) {
      return SvgPicture.asset(
        imagePath,
        width: width,
        height: height,
        colorFilter: svgColor != null ? ColorFilter.mode(svgColor!, BlendMode.srcIn) : null,
      );
    } else {
      return GestureDetector(
        onTap: onPressed,
        child: Container(
          margin: margin,
          child: SvgPicture.asset(
            imagePath,
            width: width,
            height: height,
            colorFilter: svgColor != null ? ColorFilter.mode(svgColor!, BlendMode.srcIn) : null,
          ),
        ),
      );
    }
  }
}
