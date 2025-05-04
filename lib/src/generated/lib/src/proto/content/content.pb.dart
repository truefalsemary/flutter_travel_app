//
//  Generated code. Do not modify.
//  source: lib/src/proto/content/content.proto
//
// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'content.pbenum.dart';

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

export 'content.pbenum.dart';

class GetRoutesRequest extends $pb.GeneratedMessage {
  factory GetRoutesRequest({
    DifficultyFilter? difficultyFilter,
    DistanceFilter? distanceFilter,
    $core.String? searchQuery,
  }) {
    final $result = create();
    if (difficultyFilter != null) {
      $result.difficultyFilter = difficultyFilter;
    }
    if (distanceFilter != null) {
      $result.distanceFilter = distanceFilter;
    }
    if (searchQuery != null) {
      $result.searchQuery = searchQuery;
    }
    return $result;
  }
  GetRoutesRequest._() : super();
  factory GetRoutesRequest.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory GetRoutesRequest.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetRoutesRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'content'),
      createEmptyInstance: create)
    ..aOM<DifficultyFilter>(1, _omitFieldNames ? '' : 'difficultyFilter',
        subBuilder: DifficultyFilter.create)
    ..aOM<DistanceFilter>(2, _omitFieldNames ? '' : 'distanceFilter',
        subBuilder: DistanceFilter.create)
    ..aOS(3, _omitFieldNames ? '' : 'searchQuery')
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  GetRoutesRequest clone() => GetRoutesRequest()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  GetRoutesRequest copyWith(void Function(GetRoutesRequest) updates) =>
      super.copyWith((message) => updates(message as GetRoutesRequest))
          as GetRoutesRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetRoutesRequest create() => GetRoutesRequest._();
  GetRoutesRequest createEmptyInstance() => create();
  static $pb.PbList<GetRoutesRequest> createRepeated() =>
      $pb.PbList<GetRoutesRequest>();
  @$core.pragma('dart2js:noInline')
  static GetRoutesRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetRoutesRequest>(create);
  static GetRoutesRequest? _defaultInstance;

  @$pb.TagNumber(1)
  DifficultyFilter get difficultyFilter => $_getN(0);
  @$pb.TagNumber(1)
  set difficultyFilter(DifficultyFilter v) {
    $_setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasDifficultyFilter() => $_has(0);
  @$pb.TagNumber(1)
  void clearDifficultyFilter() => $_clearField(1);
  @$pb.TagNumber(1)
  DifficultyFilter ensureDifficultyFilter() => $_ensure(0);

  @$pb.TagNumber(2)
  DistanceFilter get distanceFilter => $_getN(1);
  @$pb.TagNumber(2)
  set distanceFilter(DistanceFilter v) {
    $_setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasDistanceFilter() => $_has(1);
  @$pb.TagNumber(2)
  void clearDistanceFilter() => $_clearField(2);
  @$pb.TagNumber(2)
  DistanceFilter ensureDistanceFilter() => $_ensure(1);

  @$pb.TagNumber(3)
  $core.String get searchQuery => $_getSZ(2);
  @$pb.TagNumber(3)
  set searchQuery($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasSearchQuery() => $_has(2);
  @$pb.TagNumber(3)
  void clearSearchQuery() => $_clearField(3);
}

class DifficultyFilter extends $pb.GeneratedMessage {
  factory DifficultyFilter({
    DifficultyLevel? minDifficulty,
    DifficultyLevel? maxDifficulty,
  }) {
    final $result = create();
    if (minDifficulty != null) {
      $result.minDifficulty = minDifficulty;
    }
    if (maxDifficulty != null) {
      $result.maxDifficulty = maxDifficulty;
    }
    return $result;
  }
  DifficultyFilter._() : super();
  factory DifficultyFilter.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory DifficultyFilter.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DifficultyFilter',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'content'),
      createEmptyInstance: create)
    ..e<DifficultyLevel>(
        1, _omitFieldNames ? '' : 'minDifficulty', $pb.PbFieldType.OE,
        defaultOrMaker: DifficultyLevel.EASY,
        valueOf: DifficultyLevel.valueOf,
        enumValues: DifficultyLevel.values)
    ..e<DifficultyLevel>(
        2, _omitFieldNames ? '' : 'maxDifficulty', $pb.PbFieldType.OE,
        defaultOrMaker: DifficultyLevel.EASY,
        valueOf: DifficultyLevel.valueOf,
        enumValues: DifficultyLevel.values)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  DifficultyFilter clone() => DifficultyFilter()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  DifficultyFilter copyWith(void Function(DifficultyFilter) updates) =>
      super.copyWith((message) => updates(message as DifficultyFilter))
          as DifficultyFilter;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DifficultyFilter create() => DifficultyFilter._();
  DifficultyFilter createEmptyInstance() => create();
  static $pb.PbList<DifficultyFilter> createRepeated() =>
      $pb.PbList<DifficultyFilter>();
  @$core.pragma('dart2js:noInline')
  static DifficultyFilter getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DifficultyFilter>(create);
  static DifficultyFilter? _defaultInstance;

  @$pb.TagNumber(1)
  DifficultyLevel get minDifficulty => $_getN(0);
  @$pb.TagNumber(1)
  set minDifficulty(DifficultyLevel v) {
    $_setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasMinDifficulty() => $_has(0);
  @$pb.TagNumber(1)
  void clearMinDifficulty() => $_clearField(1);

  @$pb.TagNumber(2)
  DifficultyLevel get maxDifficulty => $_getN(1);
  @$pb.TagNumber(2)
  set maxDifficulty(DifficultyLevel v) {
    $_setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasMaxDifficulty() => $_has(1);
  @$pb.TagNumber(2)
  void clearMaxDifficulty() => $_clearField(2);
}

class DistanceFilter extends $pb.GeneratedMessage {
  factory DistanceFilter({
    $core.double? minKm,
    $core.double? maxKm,
  }) {
    final $result = create();
    if (minKm != null) {
      $result.minKm = minKm;
    }
    if (maxKm != null) {
      $result.maxKm = maxKm;
    }
    return $result;
  }
  DistanceFilter._() : super();
  factory DistanceFilter.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory DistanceFilter.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DistanceFilter',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'content'),
      createEmptyInstance: create)
    ..a<$core.double>(1, _omitFieldNames ? '' : 'minKm', $pb.PbFieldType.OF)
    ..a<$core.double>(2, _omitFieldNames ? '' : 'maxKm', $pb.PbFieldType.OF)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  DistanceFilter clone() => DistanceFilter()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  DistanceFilter copyWith(void Function(DistanceFilter) updates) =>
      super.copyWith((message) => updates(message as DistanceFilter))
          as DistanceFilter;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DistanceFilter create() => DistanceFilter._();
  DistanceFilter createEmptyInstance() => create();
  static $pb.PbList<DistanceFilter> createRepeated() =>
      $pb.PbList<DistanceFilter>();
  @$core.pragma('dart2js:noInline')
  static DistanceFilter getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DistanceFilter>(create);
  static DistanceFilter? _defaultInstance;

  @$pb.TagNumber(1)
  $core.double get minKm => $_getN(0);
  @$pb.TagNumber(1)
  set minKm($core.double v) {
    $_setFloat(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasMinKm() => $_has(0);
  @$pb.TagNumber(1)
  void clearMinKm() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.double get maxKm => $_getN(1);
  @$pb.TagNumber(2)
  set maxKm($core.double v) {
    $_setFloat(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasMaxKm() => $_has(1);
  @$pb.TagNumber(2)
  void clearMaxKm() => $_clearField(2);
}

class GetRoutesResponse extends $pb.GeneratedMessage {
  factory GetRoutesResponse({
    $core.Iterable<Route>? routes,
  }) {
    final $result = create();
    if (routes != null) {
      $result.routes.addAll(routes);
    }
    return $result;
  }
  GetRoutesResponse._() : super();
  factory GetRoutesResponse.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory GetRoutesResponse.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetRoutesResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'content'),
      createEmptyInstance: create)
    ..pc<Route>(1, _omitFieldNames ? '' : 'routes', $pb.PbFieldType.PM,
        subBuilder: Route.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  GetRoutesResponse clone() => GetRoutesResponse()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  GetRoutesResponse copyWith(void Function(GetRoutesResponse) updates) =>
      super.copyWith((message) => updates(message as GetRoutesResponse))
          as GetRoutesResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetRoutesResponse create() => GetRoutesResponse._();
  GetRoutesResponse createEmptyInstance() => create();
  static $pb.PbList<GetRoutesResponse> createRepeated() =>
      $pb.PbList<GetRoutesResponse>();
  @$core.pragma('dart2js:noInline')
  static GetRoutesResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetRoutesResponse>(create);
  static GetRoutesResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<Route> get routes => $_getList(0);
}

class Route extends $pb.GeneratedMessage {
  factory Route({
    DifficultyLevel? difficulty,
    $core.double? distanceKm,
    $core.String? name,
    $core.Iterable<Point>? pathPoints,
    $core.Iterable<Place>? places,
    $core.String? userId,
    $core.String? routeId,
    $core.String? description,
  }) {
    final $result = create();
    if (difficulty != null) {
      $result.difficulty = difficulty;
    }
    if (distanceKm != null) {
      $result.distanceKm = distanceKm;
    }
    if (name != null) {
      $result.name = name;
    }
    if (pathPoints != null) {
      $result.pathPoints.addAll(pathPoints);
    }
    if (places != null) {
      $result.places.addAll(places);
    }
    if (userId != null) {
      $result.userId = userId;
    }
    if (routeId != null) {
      $result.routeId = routeId;
    }
    if (description != null) {
      $result.description = description;
    }
    return $result;
  }
  Route._() : super();
  factory Route.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory Route.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Route',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'content'),
      createEmptyInstance: create)
    ..e<DifficultyLevel>(
        1, _omitFieldNames ? '' : 'difficulty', $pb.PbFieldType.OE,
        defaultOrMaker: DifficultyLevel.EASY,
        valueOf: DifficultyLevel.valueOf,
        enumValues: DifficultyLevel.values)
    ..a<$core.double>(
        2, _omitFieldNames ? '' : 'distanceKm', $pb.PbFieldType.OF)
    ..aOS(3, _omitFieldNames ? '' : 'name')
    ..pc<Point>(4, _omitFieldNames ? '' : 'pathPoints', $pb.PbFieldType.PM,
        subBuilder: Point.create)
    ..pc<Place>(5, _omitFieldNames ? '' : 'places', $pb.PbFieldType.PM,
        subBuilder: Place.create)
    ..aOS(6, _omitFieldNames ? '' : 'userId')
    ..aOS(7, _omitFieldNames ? '' : 'routeId')
    ..aOS(8, _omitFieldNames ? '' : 'description')
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  Route clone() => Route()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  Route copyWith(void Function(Route) updates) =>
      super.copyWith((message) => updates(message as Route)) as Route;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Route create() => Route._();
  Route createEmptyInstance() => create();
  static $pb.PbList<Route> createRepeated() => $pb.PbList<Route>();
  @$core.pragma('dart2js:noInline')
  static Route getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Route>(create);
  static Route? _defaultInstance;

  @$pb.TagNumber(1)
  DifficultyLevel get difficulty => $_getN(0);
  @$pb.TagNumber(1)
  set difficulty(DifficultyLevel v) {
    $_setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasDifficulty() => $_has(0);
  @$pb.TagNumber(1)
  void clearDifficulty() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.double get distanceKm => $_getN(1);
  @$pb.TagNumber(2)
  set distanceKm($core.double v) {
    $_setFloat(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasDistanceKm() => $_has(1);
  @$pb.TagNumber(2)
  void clearDistanceKm() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get name => $_getSZ(2);
  @$pb.TagNumber(3)
  set name($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasName() => $_has(2);
  @$pb.TagNumber(3)
  void clearName() => $_clearField(3);

  @$pb.TagNumber(4)
  $pb.PbList<Point> get pathPoints => $_getList(3);

  @$pb.TagNumber(5)
  $pb.PbList<Place> get places => $_getList(4);

  @$pb.TagNumber(6)
  $core.String get userId => $_getSZ(5);
  @$pb.TagNumber(6)
  set userId($core.String v) {
    $_setString(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasUserId() => $_has(5);
  @$pb.TagNumber(6)
  void clearUserId() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.String get routeId => $_getSZ(6);
  @$pb.TagNumber(7)
  set routeId($core.String v) {
    $_setString(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasRouteId() => $_has(6);
  @$pb.TagNumber(7)
  void clearRouteId() => $_clearField(7);

  @$pb.TagNumber(8)
  $core.String get description => $_getSZ(7);
  @$pb.TagNumber(8)
  set description($core.String v) {
    $_setString(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasDescription() => $_has(7);
  @$pb.TagNumber(8)
  void clearDescription() => $_clearField(8);
}

class Point extends $pb.GeneratedMessage {
  factory Point({
    $core.double? lat,
    $core.double? lon,
  }) {
    final $result = create();
    if (lat != null) {
      $result.lat = lat;
    }
    if (lon != null) {
      $result.lon = lon;
    }
    return $result;
  }
  Point._() : super();
  factory Point.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory Point.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Point',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'content'),
      createEmptyInstance: create)
    ..a<$core.double>(1, _omitFieldNames ? '' : 'lat', $pb.PbFieldType.OD)
    ..a<$core.double>(2, _omitFieldNames ? '' : 'lon', $pb.PbFieldType.OD)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  Point clone() => Point()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  Point copyWith(void Function(Point) updates) =>
      super.copyWith((message) => updates(message as Point)) as Point;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Point create() => Point._();
  Point createEmptyInstance() => create();
  static $pb.PbList<Point> createRepeated() => $pb.PbList<Point>();
  @$core.pragma('dart2js:noInline')
  static Point getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Point>(create);
  static Point? _defaultInstance;

  @$pb.TagNumber(1)
  $core.double get lat => $_getN(0);
  @$pb.TagNumber(1)
  set lat($core.double v) {
    $_setDouble(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasLat() => $_has(0);
  @$pb.TagNumber(1)
  void clearLat() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.double get lon => $_getN(1);
  @$pb.TagNumber(2)
  set lon($core.double v) {
    $_setDouble(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasLon() => $_has(1);
  @$pb.TagNumber(2)
  void clearLon() => $_clearField(2);
}

class Place extends $pb.GeneratedMessage {
  factory Place({
    Point? location,
    $core.String? name,
    $core.String? address,
    $core.String? description,
    $core.Iterable<Image>? images,
    $core.String? placeId,
  }) {
    final $result = create();
    if (location != null) {
      $result.location = location;
    }
    if (name != null) {
      $result.name = name;
    }
    if (address != null) {
      $result.address = address;
    }
    if (description != null) {
      $result.description = description;
    }
    if (images != null) {
      $result.images.addAll(images);
    }
    if (placeId != null) {
      $result.placeId = placeId;
    }
    return $result;
  }
  Place._() : super();
  factory Place.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory Place.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Place',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'content'),
      createEmptyInstance: create)
    ..aOM<Point>(1, _omitFieldNames ? '' : 'location', subBuilder: Point.create)
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..aOS(3, _omitFieldNames ? '' : 'address')
    ..aOS(4, _omitFieldNames ? '' : 'description')
    ..pc<Image>(5, _omitFieldNames ? '' : 'images', $pb.PbFieldType.PM,
        subBuilder: Image.create)
    ..aOS(7, _omitFieldNames ? '' : 'placeId')
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  Place clone() => Place()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  Place copyWith(void Function(Place) updates) =>
      super.copyWith((message) => updates(message as Place)) as Place;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Place create() => Place._();
  Place createEmptyInstance() => create();
  static $pb.PbList<Place> createRepeated() => $pb.PbList<Place>();
  @$core.pragma('dart2js:noInline')
  static Place getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Place>(create);
  static Place? _defaultInstance;

  @$pb.TagNumber(1)
  Point get location => $_getN(0);
  @$pb.TagNumber(1)
  set location(Point v) {
    $_setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasLocation() => $_has(0);
  @$pb.TagNumber(1)
  void clearLocation() => $_clearField(1);
  @$pb.TagNumber(1)
  Point ensureLocation() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get address => $_getSZ(2);
  @$pb.TagNumber(3)
  set address($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasAddress() => $_has(2);
  @$pb.TagNumber(3)
  void clearAddress() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get description => $_getSZ(3);
  @$pb.TagNumber(4)
  set description($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasDescription() => $_has(3);
  @$pb.TagNumber(4)
  void clearDescription() => $_clearField(4);

  @$pb.TagNumber(5)
  $pb.PbList<Image> get images => $_getList(4);

  @$pb.TagNumber(7)
  $core.String get placeId => $_getSZ(5);
  @$pb.TagNumber(7)
  set placeId($core.String v) {
    $_setString(5, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasPlaceId() => $_has(5);
  @$pb.TagNumber(7)
  void clearPlaceId() => $_clearField(7);
}

class Image extends $pb.GeneratedMessage {
  factory Image({
    $core.String? url,
    $core.String? placeholder,
  }) {
    final $result = create();
    if (url != null) {
      $result.url = url;
    }
    if (placeholder != null) {
      $result.placeholder = placeholder;
    }
    return $result;
  }
  Image._() : super();
  factory Image.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory Image.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Image',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'content'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'url')
    ..aOS(2, _omitFieldNames ? '' : 'placeholder')
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  Image clone() => Image()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  Image copyWith(void Function(Image) updates) =>
      super.copyWith((message) => updates(message as Image)) as Image;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Image create() => Image._();
  Image createEmptyInstance() => create();
  static $pb.PbList<Image> createRepeated() => $pb.PbList<Image>();
  @$core.pragma('dart2js:noInline')
  static Image getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Image>(create);
  static Image? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get url => $_getSZ(0);
  @$pb.TagNumber(1)
  set url($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasUrl() => $_has(0);
  @$pb.TagNumber(1)
  void clearUrl() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get placeholder => $_getSZ(1);
  @$pb.TagNumber(2)
  set placeholder($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasPlaceholder() => $_has(1);
  @$pb.TagNumber(2)
  void clearPlaceholder() => $_clearField(2);
}

class CreatePlaceRequest extends $pb.GeneratedMessage {
  factory CreatePlaceRequest({
    Point? location,
    $core.String? name,
    $core.String? address,
    $core.String? description,
  }) {
    final $result = create();
    if (location != null) {
      $result.location = location;
    }
    if (name != null) {
      $result.name = name;
    }
    if (address != null) {
      $result.address = address;
    }
    if (description != null) {
      $result.description = description;
    }
    return $result;
  }
  CreatePlaceRequest._() : super();
  factory CreatePlaceRequest.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory CreatePlaceRequest.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CreatePlaceRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'content'),
      createEmptyInstance: create)
    ..aOM<Point>(1, _omitFieldNames ? '' : 'location', subBuilder: Point.create)
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..aOS(3, _omitFieldNames ? '' : 'address')
    ..aOS(4, _omitFieldNames ? '' : 'description')
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  CreatePlaceRequest clone() => CreatePlaceRequest()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  CreatePlaceRequest copyWith(void Function(CreatePlaceRequest) updates) =>
      super.copyWith((message) => updates(message as CreatePlaceRequest))
          as CreatePlaceRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreatePlaceRequest create() => CreatePlaceRequest._();
  CreatePlaceRequest createEmptyInstance() => create();
  static $pb.PbList<CreatePlaceRequest> createRepeated() =>
      $pb.PbList<CreatePlaceRequest>();
  @$core.pragma('dart2js:noInline')
  static CreatePlaceRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CreatePlaceRequest>(create);
  static CreatePlaceRequest? _defaultInstance;

  @$pb.TagNumber(1)
  Point get location => $_getN(0);
  @$pb.TagNumber(1)
  set location(Point v) {
    $_setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasLocation() => $_has(0);
  @$pb.TagNumber(1)
  void clearLocation() => $_clearField(1);
  @$pb.TagNumber(1)
  Point ensureLocation() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get address => $_getSZ(2);
  @$pb.TagNumber(3)
  set address($core.String v) {
    $_setString(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasAddress() => $_has(2);
  @$pb.TagNumber(3)
  void clearAddress() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get description => $_getSZ(3);
  @$pb.TagNumber(4)
  set description($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasDescription() => $_has(3);
  @$pb.TagNumber(4)
  void clearDescription() => $_clearField(4);
}

class CreatePlaceResponse extends $pb.GeneratedMessage {
  factory CreatePlaceResponse({
    $core.String? placeId,
  }) {
    final $result = create();
    if (placeId != null) {
      $result.placeId = placeId;
    }
    return $result;
  }
  CreatePlaceResponse._() : super();
  factory CreatePlaceResponse.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory CreatePlaceResponse.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CreatePlaceResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'content'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'placeId')
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  CreatePlaceResponse clone() => CreatePlaceResponse()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  CreatePlaceResponse copyWith(void Function(CreatePlaceResponse) updates) =>
      super.copyWith((message) => updates(message as CreatePlaceResponse))
          as CreatePlaceResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreatePlaceResponse create() => CreatePlaceResponse._();
  CreatePlaceResponse createEmptyInstance() => create();
  static $pb.PbList<CreatePlaceResponse> createRepeated() =>
      $pb.PbList<CreatePlaceResponse>();
  @$core.pragma('dart2js:noInline')
  static CreatePlaceResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CreatePlaceResponse>(create);
  static CreatePlaceResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get placeId => $_getSZ(0);
  @$pb.TagNumber(1)
  set placeId($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasPlaceId() => $_has(0);
  @$pb.TagNumber(1)
  void clearPlaceId() => $_clearField(1);
}

class UploadImageRequest extends $pb.GeneratedMessage {
  factory UploadImageRequest({
    $core.String? placeId,
    $core.String? filename,
    $core.List<$core.int>? content,
  }) {
    final $result = create();
    if (placeId != null) {
      $result.placeId = placeId;
    }
    if (filename != null) {
      $result.filename = filename;
    }
    if (content != null) {
      $result.content = content;
    }
    return $result;
  }
  UploadImageRequest._() : super();
  factory UploadImageRequest.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory UploadImageRequest.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UploadImageRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'content'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'placeId')
    ..aOS(2, _omitFieldNames ? '' : 'filename')
    ..a<$core.List<$core.int>>(
        3, _omitFieldNames ? '' : 'content', $pb.PbFieldType.OY)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  UploadImageRequest clone() => UploadImageRequest()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  UploadImageRequest copyWith(void Function(UploadImageRequest) updates) =>
      super.copyWith((message) => updates(message as UploadImageRequest))
          as UploadImageRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UploadImageRequest create() => UploadImageRequest._();
  UploadImageRequest createEmptyInstance() => create();
  static $pb.PbList<UploadImageRequest> createRepeated() =>
      $pb.PbList<UploadImageRequest>();
  @$core.pragma('dart2js:noInline')
  static UploadImageRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UploadImageRequest>(create);
  static UploadImageRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get placeId => $_getSZ(0);
  @$pb.TagNumber(1)
  set placeId($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasPlaceId() => $_has(0);
  @$pb.TagNumber(1)
  void clearPlaceId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get filename => $_getSZ(1);
  @$pb.TagNumber(2)
  set filename($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasFilename() => $_has(1);
  @$pb.TagNumber(2)
  void clearFilename() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.List<$core.int> get content => $_getN(2);
  @$pb.TagNumber(3)
  set content($core.List<$core.int> v) {
    $_setBytes(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasContent() => $_has(2);
  @$pb.TagNumber(3)
  void clearContent() => $_clearField(3);
}

class UploadImageResponse extends $pb.GeneratedMessage {
  factory UploadImageResponse({
    $core.Iterable<Image>? images,
  }) {
    final $result = create();
    if (images != null) {
      $result.images.addAll(images);
    }
    return $result;
  }
  UploadImageResponse._() : super();
  factory UploadImageResponse.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory UploadImageResponse.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UploadImageResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'content'),
      createEmptyInstance: create)
    ..pc<Image>(1, _omitFieldNames ? '' : 'images', $pb.PbFieldType.PM,
        subBuilder: Image.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  UploadImageResponse clone() => UploadImageResponse()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  UploadImageResponse copyWith(void Function(UploadImageResponse) updates) =>
      super.copyWith((message) => updates(message as UploadImageResponse))
          as UploadImageResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UploadImageResponse create() => UploadImageResponse._();
  UploadImageResponse createEmptyInstance() => create();
  static $pb.PbList<UploadImageResponse> createRepeated() =>
      $pb.PbList<UploadImageResponse>();
  @$core.pragma('dart2js:noInline')
  static UploadImageResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UploadImageResponse>(create);
  static UploadImageResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<Image> get images => $_getList(0);
}

class CreateRouteRequest extends $pb.GeneratedMessage {
  factory CreateRouteRequest({
    $core.String? name,
    DifficultyLevel? difficulty,
    $core.double? distanceKm,
    $core.Iterable<Point>? pathPoints,
    $core.Iterable<$core.String>? placeIds,
    $core.String? description,
  }) {
    final $result = create();
    if (name != null) {
      $result.name = name;
    }
    if (difficulty != null) {
      $result.difficulty = difficulty;
    }
    if (distanceKm != null) {
      $result.distanceKm = distanceKm;
    }
    if (pathPoints != null) {
      $result.pathPoints.addAll(pathPoints);
    }
    if (placeIds != null) {
      $result.placeIds.addAll(placeIds);
    }
    if (description != null) {
      $result.description = description;
    }
    return $result;
  }
  CreateRouteRequest._() : super();
  factory CreateRouteRequest.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory CreateRouteRequest.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CreateRouteRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'content'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'name')
    ..e<DifficultyLevel>(
        2, _omitFieldNames ? '' : 'difficulty', $pb.PbFieldType.OE,
        defaultOrMaker: DifficultyLevel.EASY,
        valueOf: DifficultyLevel.valueOf,
        enumValues: DifficultyLevel.values)
    ..a<$core.double>(
        3, _omitFieldNames ? '' : 'distanceKm', $pb.PbFieldType.OF)
    ..pc<Point>(4, _omitFieldNames ? '' : 'pathPoints', $pb.PbFieldType.PM,
        subBuilder: Point.create)
    ..pPS(5, _omitFieldNames ? '' : 'placeIds')
    ..aOS(6, _omitFieldNames ? '' : 'description')
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  CreateRouteRequest clone() => CreateRouteRequest()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  CreateRouteRequest copyWith(void Function(CreateRouteRequest) updates) =>
      super.copyWith((message) => updates(message as CreateRouteRequest))
          as CreateRouteRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateRouteRequest create() => CreateRouteRequest._();
  CreateRouteRequest createEmptyInstance() => create();
  static $pb.PbList<CreateRouteRequest> createRepeated() =>
      $pb.PbList<CreateRouteRequest>();
  @$core.pragma('dart2js:noInline')
  static CreateRouteRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CreateRouteRequest>(create);
  static CreateRouteRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => $_clearField(1);

  @$pb.TagNumber(2)
  DifficultyLevel get difficulty => $_getN(1);
  @$pb.TagNumber(2)
  set difficulty(DifficultyLevel v) {
    $_setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasDifficulty() => $_has(1);
  @$pb.TagNumber(2)
  void clearDifficulty() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.double get distanceKm => $_getN(2);
  @$pb.TagNumber(3)
  set distanceKm($core.double v) {
    $_setFloat(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasDistanceKm() => $_has(2);
  @$pb.TagNumber(3)
  void clearDistanceKm() => $_clearField(3);

  @$pb.TagNumber(4)
  $pb.PbList<Point> get pathPoints => $_getList(3);

  @$pb.TagNumber(5)
  $pb.PbList<$core.String> get placeIds => $_getList(4);

  @$pb.TagNumber(6)
  $core.String get description => $_getSZ(5);
  @$pb.TagNumber(6)
  set description($core.String v) {
    $_setString(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasDescription() => $_has(5);
  @$pb.TagNumber(6)
  void clearDescription() => $_clearField(6);
}

class CreateRouteResponse extends $pb.GeneratedMessage {
  factory CreateRouteResponse({
    $core.String? routeId,
  }) {
    final $result = create();
    if (routeId != null) {
      $result.routeId = routeId;
    }
    return $result;
  }
  CreateRouteResponse._() : super();
  factory CreateRouteResponse.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory CreateRouteResponse.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CreateRouteResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'content'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'routeId')
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  CreateRouteResponse clone() => CreateRouteResponse()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  CreateRouteResponse copyWith(void Function(CreateRouteResponse) updates) =>
      super.copyWith((message) => updates(message as CreateRouteResponse))
          as CreateRouteResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateRouteResponse create() => CreateRouteResponse._();
  CreateRouteResponse createEmptyInstance() => create();
  static $pb.PbList<CreateRouteResponse> createRepeated() =>
      $pb.PbList<CreateRouteResponse>();
  @$core.pragma('dart2js:noInline')
  static CreateRouteResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CreateRouteResponse>(create);
  static CreateRouteResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get routeId => $_getSZ(0);
  @$pb.TagNumber(1)
  set routeId($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasRouteId() => $_has(0);
  @$pb.TagNumber(1)
  void clearRouteId() => $_clearField(1);
}

class GetRoutesFilterOptionsResponse extends $pb.GeneratedMessage {
  factory GetRoutesFilterOptionsResponse({
    $core.bool? empty,
    DistanceFilter? distanceBounds,
  }) {
    final $result = create();
    if (empty != null) {
      $result.empty = empty;
    }
    if (distanceBounds != null) {
      $result.distanceBounds = distanceBounds;
    }
    return $result;
  }
  GetRoutesFilterOptionsResponse._() : super();
  factory GetRoutesFilterOptionsResponse.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory GetRoutesFilterOptionsResponse.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetRoutesFilterOptionsResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'content'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'empty')
    ..aOM<DistanceFilter>(2, _omitFieldNames ? '' : 'distanceBounds',
        subBuilder: DistanceFilter.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  GetRoutesFilterOptionsResponse clone() =>
      GetRoutesFilterOptionsResponse()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  GetRoutesFilterOptionsResponse copyWith(
          void Function(GetRoutesFilterOptionsResponse) updates) =>
      super.copyWith(
              (message) => updates(message as GetRoutesFilterOptionsResponse))
          as GetRoutesFilterOptionsResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetRoutesFilterOptionsResponse create() =>
      GetRoutesFilterOptionsResponse._();
  GetRoutesFilterOptionsResponse createEmptyInstance() => create();
  static $pb.PbList<GetRoutesFilterOptionsResponse> createRepeated() =>
      $pb.PbList<GetRoutesFilterOptionsResponse>();
  @$core.pragma('dart2js:noInline')
  static GetRoutesFilterOptionsResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetRoutesFilterOptionsResponse>(create);
  static GetRoutesFilterOptionsResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get empty => $_getBF(0);
  @$pb.TagNumber(1)
  set empty($core.bool v) {
    $_setBool(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasEmpty() => $_has(0);
  @$pb.TagNumber(1)
  void clearEmpty() => $_clearField(1);

  @$pb.TagNumber(2)
  DistanceFilter get distanceBounds => $_getN(1);
  @$pb.TagNumber(2)
  set distanceBounds(DistanceFilter v) {
    $_setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasDistanceBounds() => $_has(1);
  @$pb.TagNumber(2)
  void clearDistanceBounds() => $_clearField(2);
  @$pb.TagNumber(2)
  DistanceFilter ensureDistanceBounds() => $_ensure(1);
}

const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
