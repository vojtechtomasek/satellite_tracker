// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

/// generated route for
/// [InputScreen]
class InputRoute extends PageRouteInfo<void> {
  const InputRoute({List<PageRouteInfo>? children})
      : super(
          InputRoute.name,
          initialChildren: children,
        );

  static const String name = 'InputRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const InputScreen();
    },
  );
}

/// generated route for
/// [SatelliteInfoScreen]
class SatelliteInfoRoute extends PageRouteInfo<SatelliteInfoRouteArgs> {
  SatelliteInfoRoute({
    required List<SatellitePass> passes,
    List<PageRouteInfo>? children,
  }) : super(
          SatelliteInfoRoute.name,
          args: SatelliteInfoRouteArgs(passes: passes),
          initialChildren: children,
        );

  static const String name = 'SatelliteInfoRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<SatelliteInfoRouteArgs>();
      return SatelliteInfoScreen(passes: args.passes);
    },
  );
}

class SatelliteInfoRouteArgs {
  const SatelliteInfoRouteArgs({required this.passes});

  final List<SatellitePass> passes;

  @override
  String toString() {
    return 'SatelliteInfoRouteArgs{passes: $passes}';
  }
}

/// generated route for
/// [SatelliteOrbitScreen]
class SatelliteOrbitRoute extends PageRouteInfo<void> {
  const SatelliteOrbitRoute({List<PageRouteInfo>? children})
      : super(
          SatelliteOrbitRoute.name,
          initialChildren: children,
        );

  static const String name = 'SatelliteOrbitRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const SatelliteOrbitScreen();
    },
  );
}

/// generated route for
/// [WelcomeScreen]
class WelcomeRoute extends PageRouteInfo<void> {
  const WelcomeRoute({List<PageRouteInfo>? children})
      : super(
          WelcomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'WelcomeRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const WelcomeScreen();
    },
  );
}
