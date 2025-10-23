// dart format width=80

/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: deprecated_member_use,directives_ordering,implicit_dynamic_list_literal,unnecessary_import

import 'package:flutter/widgets.dart';

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/Icons/apple.svg
  String get apple => 'assets/Icons/apple.svg';

  /// File path: assets/Icons/chat_ai.png
  AssetGenImage get chatAi => const AssetGenImage('assets/Icons/chat_ai.png');

  /// File path: assets/Icons/eye.svg
  String get eye => 'assets/Icons/eye.svg';

  /// File path: assets/Icons/facebook.svg
  String get facebook => 'assets/Icons/facebook.svg';

  /// File path: assets/Icons/google.svg
  String get google => 'assets/Icons/google.svg';

  /// File path: assets/Icons/gym.png
  AssetGenImage get gym => const AssetGenImage('assets/Icons/gym.png');

  /// File path: assets/Icons/home.png
  AssetGenImage get home => const AssetGenImage('assets/Icons/home.png');

  /// File path: assets/Icons/profile.png
  AssetGenImage get profile => const AssetGenImage('assets/Icons/profile.png');

  /// File path: assets/Icons/super_fit_logo.png
  AssetGenImage get superFitLogo =>
      const AssetGenImage('assets/Icons/super_fit_logo.png');

  /// File path: assets/Icons/user.svg
  String get user => 'assets/Icons/user.svg';

  /// List of all assets
  List<dynamic> get values => [
    apple,
    chatAi,
    eye,
    facebook,
    google,
    gym,
    home,
    profile,
    superFitLogo,
    user,
  ];
}

class $AssetsImageGen {
  const $AssetsImageGen();

  /// File path: assets/image/Frame 6.png
  AssetGenImage get frame6 => const AssetGenImage('assets/image/Frame 6.png');

  /// File path: assets/image/Group 1.png
  AssetGenImage get group1 => const AssetGenImage('assets/image/Group 1.png');

  /// File path: assets/image/O15_29.png
  AssetGenImage get o1529 => const AssetGenImage('assets/image/O15_29.png');

  /// File path: assets/image/O15_30.png
  AssetGenImage get o1530 => const AssetGenImage('assets/image/O15_30.png');

  /// File path: assets/image/O15_31.png
  AssetGenImage get o1531 => const AssetGenImage('assets/image/O15_31.png');

  /// File path: assets/image/Rectangle 1.png
  AssetGenImage get rectangle1 =>
      const AssetGenImage('assets/image/Rectangle 1.png');

  /// File path: assets/image/app_logo.png
  AssetGenImage get appLogo => const AssetGenImage('assets/image/app_logo.png');

  /// File path: assets/image/auth_background.png
  AssetGenImage get authBackground =>
      const AssetGenImage('assets/image/auth_background.png');

  /// File path: assets/image/background_1.png
  AssetGenImage get background1 =>
      const AssetGenImage('assets/image/background_1.png');

  /// File path: assets/image/background_2.png
  AssetGenImage get background2 =>
      const AssetGenImage('assets/image/background_2.png');

  /// File path: assets/image/background_3.png
  AssetGenImage get background3 =>
      const AssetGenImage('assets/image/background_3.png');

  /// File path: assets/image/background_4.png
  AssetGenImage get background4 =>
      const AssetGenImage('assets/image/background_4.png');

  /// File path: assets/image/background_5.png
  AssetGenImage get background5 =>
      const AssetGenImage('assets/image/background_5.png');

  /// File path: assets/image/fit 1.png
  AssetGenImage get fit1Png => const AssetGenImage('assets/image/fit 1.png');

  /// File path: assets/image/fit1.png
  AssetGenImage get fit1Png_ => const AssetGenImage('assets/image/fit1.png');

  /// File path: assets/image/no_routes.png
  AssetGenImage get noRoutes =>
      const AssetGenImage('assets/image/no_routes.png');

  /// List of all assets
  List<AssetGenImage> get values => [
    frame6,
    group1,
    o1529,
    o1530,
    o1531,
    rectangle1,
    appLogo,
    authBackground,
    background1,
    background2,
    background3,
    background4,
    background5,
    fit1Png,
    fit1Png_,
    noRoutes,
  ];
}

class Assets {
  const Assets._();

  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImageGen image = $AssetsImageGen();
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
    this.animation,
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;
  final AssetGenImageAnimation? animation;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = true,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.medium,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({AssetBundle? bundle, String? package}) {
    return AssetImage(_assetName, bundle: bundle, package: package);
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class AssetGenImageAnimation {
  const AssetGenImageAnimation({
    required this.isAnimation,
    required this.duration,
    required this.frames,
  });

  final bool isAnimation;
  final Duration duration;
  final int frames;
}
