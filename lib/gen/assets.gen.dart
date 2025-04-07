/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart' as _svg;
import 'package:vector_graphics/vector_graphics.dart' as _vg;

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/add_circle.svg
  SvgGenImage get addCircle => const SvgGenImage('assets/icons/add_circle.svg');

  /// File path: assets/icons/favorite.svg
  SvgGenImage get favorite => const SvgGenImage('assets/icons/favorite.svg');

  /// File path: assets/icons/home.svg
  SvgGenImage get home => const SvgGenImage('assets/icons/home.svg');

  /// File path: assets/icons/profile.svg
  SvgGenImage get profile => const SvgGenImage('assets/icons/profile.svg');

  /// File path: assets/icons/search.svg
  SvgGenImage get search => const SvgGenImage('assets/icons/search.svg');

  /// List of all assets
  List<SvgGenImage> get values => [addCircle, favorite, home, profile, search];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/create_route_2_screen.png
  AssetGenImage get createRoute2Screen =>
      const AssetGenImage('assets/images/create_route_2_screen.png');

  /// File path: assets/images/create_route_screen.png
  AssetGenImage get createRouteScreen =>
      const AssetGenImage('assets/images/create_route_screen.png');

  /// File path: assets/images/element1.png
  AssetGenImage get element1 =>
      const AssetGenImage('assets/images/element1.png');

  /// File path: assets/images/element2.png
  AssetGenImage get element2 =>
      const AssetGenImage('assets/images/element2.png');

  /// File path: assets/images/element3.png
  AssetGenImage get element3 =>
      const AssetGenImage('assets/images/element3.png');

  /// File path: assets/images/main_screen_bottom.png
  AssetGenImage get mainScreenBottom =>
      const AssetGenImage('assets/images/main_screen_bottom.png');

  /// File path: assets/images/main_screen_center.png
  AssetGenImage get mainScreenCenter =>
      const AssetGenImage('assets/images/main_screen_center.png');

  /// File path: assets/images/main_screen_top.png
  AssetGenImage get mainScreenTop =>
      const AssetGenImage('assets/images/main_screen_top.png');

  /// File path: assets/images/map_screen_modal.png
  AssetGenImage get mapScreenModal =>
      const AssetGenImage('assets/images/map_screen_modal.png');

  /// File path: assets/images/profile_screen_publication.png
  AssetGenImage get profileScreenPublication =>
      const AssetGenImage('assets/images/profile_screen_publication.png');

  /// File path: assets/images/profile_screen_top.png
  AssetGenImage get profileScreenTop =>
      const AssetGenImage('assets/images/profile_screen_top.png');

  /// File path: assets/images/publication.png
  AssetGenImage get publication =>
      const AssetGenImage('assets/images/publication.png');

  /// File path: assets/images/search_screen_content.png
  AssetGenImage get searchScreenContent =>
      const AssetGenImage('assets/images/search_screen_content.png');

  /// List of all assets
  List<AssetGenImage> get values => [
    createRoute2Screen,
    createRouteScreen,
    element1,
    element2,
    element3,
    mainScreenBottom,
    mainScreenCenter,
    mainScreenTop,
    mapScreenModal,
    profileScreenPublication,
    profileScreenTop,
    publication,
    searchScreenContent,
  ];
}

class Assets {
  const Assets._();

  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName, {this.size, this.flavors = const {}});

  final String _assetName;

  final Size? size;
  final Set<String> flavors;

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

class SvgGenImage {
  const SvgGenImage(this._assetName, {this.size, this.flavors = const {}})
    : _isVecFormat = false;

  const SvgGenImage.vec(this._assetName, {this.size, this.flavors = const {}})
    : _isVecFormat = true;

  final String _assetName;
  final Size? size;
  final Set<String> flavors;
  final bool _isVecFormat;

  _svg.SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    String? package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    _svg.SvgTheme? theme,
    ColorFilter? colorFilter,
    Clip clipBehavior = Clip.hardEdge,
    @deprecated Color? color,
    @deprecated BlendMode colorBlendMode = BlendMode.srcIn,
    @deprecated bool cacheColorFilter = false,
  }) {
    final _svg.BytesLoader loader;
    if (_isVecFormat) {
      loader = _vg.AssetBytesLoader(
        _assetName,
        assetBundle: bundle,
        packageName: package,
      );
    } else {
      loader = _svg.SvgAssetLoader(
        _assetName,
        assetBundle: bundle,
        packageName: package,
        theme: theme,
      );
    }
    return _svg.SvgPicture(
      loader,
      key: key,
      matchTextDirection: matchTextDirection,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      colorFilter:
          colorFilter ??
          (color == null ? null : ColorFilter.mode(color, colorBlendMode)),
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
