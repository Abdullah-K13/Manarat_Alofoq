import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import '/backend/backend.dart';

import '/auth/base_auth_user_provider.dart';

import '/index.dart';
import '/main.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/lat_lng.dart';
import '/flutter_flow/place.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'serialization_util.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier._();

  static AppStateNotifier? _instance;
  static AppStateNotifier get instance => _instance ??= AppStateNotifier._();

  BaseAuthUser? initialUser;
  BaseAuthUser? user;
  bool showSplashImage = true;
  String? _redirectLocation;

  /// Determines whether the app will refresh and build again when a sign
  /// in or sign out happens. This is useful when the app is launched or
  /// on an unexpected logout. However, this must be turned off when we
  /// intend to sign in/out and then navigate or perform any actions after.
  /// Otherwise, this will trigger a refresh and interrupt the action(s).
  bool notifyOnAuthChange = true;

  bool get loading => user == null || showSplashImage;
  bool get loggedIn => user?.loggedIn ?? false;
  bool get initiallyLoggedIn => initialUser?.loggedIn ?? false;
  bool get shouldRedirect => loggedIn && _redirectLocation != null;

  String getRedirectLocation() => _redirectLocation!;
  bool hasRedirect() => _redirectLocation != null;
  void setRedirectLocationIfUnset(String loc) => _redirectLocation ??= loc;
  void clearRedirectLocation() => _redirectLocation = null;

  /// Mark as not needing to notify on a sign in / out when we intend
  /// to perform subsequent actions (such as navigation) afterwards.
  void updateNotifyOnAuthChange(bool notify) => notifyOnAuthChange = notify;

  void update(BaseAuthUser newUser) {
    final shouldUpdate =
        user?.uid == null || newUser.uid == null || user?.uid != newUser.uid;
    initialUser ??= newUser;
    user = newUser;
    // Refresh the app on auth change unless explicitly marked otherwise.
    // No need to update unless the user has changed.
    if (notifyOnAuthChange && shouldUpdate) {
      notifyListeners();
    }
    // Once again mark the notifier as needing to update on auth change
    // (in order to catch sign in / out events).
    updateNotifyOnAuthChange(true);
  }

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      errorBuilder: (context, state) =>
          appStateNotifier.loggedIn ? NavBarPage() : Auth1Widget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) =>
              appStateNotifier.loggedIn ? NavBarPage() : Auth1Widget(),
        ),
        FFRoute(
          name: 'Auth1',
          path: '/auth1',
          builder: (context, params) => Auth1Widget(),
        ),
        FFRoute(
          name: 'home',
          path: '/home',
          builder: (context, params) =>
              params.isEmpty ? NavBarPage(initialPage: 'home') : HomeWidget(),
        ),
        FFRoute(
          name: 'comingsoon',
          path: '/comingsoon',
          builder: (context, params) => NavBarPage(
            initialPage: '',
            page: ComingsoonWidget(),
          ),
        ),
        FFRoute(
          name: 'TALEEM-E-QURAN',
          path: '/taleemEQuran',
          builder: (context, params) => NavBarPage(
            initialPage: '',
            page: TaleemEQuranWidget(),
          ),
        ),
        FFRoute(
          name: 'B1CHP1',
          path: '/b1chp1',
          builder: (context, params) => NavBarPage(
            initialPage: '',
            page: B1chp1Widget(),
          ),
        ),
        FFRoute(
          name: 'B1CHP2',
          path: '/b1chp2',
          builder: (context, params) => NavBarPage(
            initialPage: '',
            page: B1chp2Widget(),
          ),
        ),
        FFRoute(
          name: 'B1CHP3',
          path: '/b1chp3',
          builder: (context, params) => NavBarPage(
            initialPage: '',
            page: B1chp3Widget(),
          ),
        ),
        FFRoute(
          name: 'B1CHP4',
          path: '/b1chp4',
          builder: (context, params) => NavBarPage(
            initialPage: '',
            page: B1chp4Widget(),
          ),
        ),
        FFRoute(
          name: 'B1CHP5',
          path: '/b1chp5',
          builder: (context, params) => NavBarPage(
            initialPage: '',
            page: B1chp5Widget(),
          ),
        ),
        FFRoute(
          name: 'B1CHP6',
          path: '/b1chp6',
          builder: (context, params) => NavBarPage(
            initialPage: '',
            page: B1chp6Widget(),
          ),
        ),
        FFRoute(
          name: 'B1CHP7',
          path: '/b1chp7',
          builder: (context, params) => NavBarPage(
            initialPage: '',
            page: B1chp7Widget(),
          ),
        ),
        FFRoute(
          name: 'B1CHP8',
          path: '/b1chp8',
          builder: (context, params) => NavBarPage(
            initialPage: '',
            page: B1chp8Widget(),
          ),
        ),
        FFRoute(
          name: 'B1CHP9',
          path: '/b1chp9',
          builder: (context, params) => NavBarPage(
            initialPage: '',
            page: B1chp9Widget(),
          ),
        ),
        FFRoute(
          name: 'B1CHP10',
          path: '/b1chp10',
          builder: (context, params) => NavBarPage(
            initialPage: '',
            page: B1chp10Widget(),
          ),
        ),
        FFRoute(
          name: 'B1CHP11',
          path: '/b1chp11',
          builder: (context, params) => NavBarPage(
            initialPage: '',
            page: B1chp11Widget(),
          ),
        ),
        FFRoute(
          name: 'B1CHP12',
          path: '/b1chp12',
          builder: (context, params) => NavBarPage(
            initialPage: '',
            page: B1chp12Widget(),
          ),
        ),
        FFRoute(
          name: 'B1CHP13',
          path: '/b1chp13',
          builder: (context, params) => NavBarPage(
            initialPage: '',
            page: B1chp13Widget(),
          ),
        ),
        FFRoute(
          name: 'B1CHP14',
          path: '/b1chp14',
          builder: (context, params) => NavBarPage(
            initialPage: '',
            page: B1chp14Widget(),
          ),
        ),
        FFRoute(
          name: 'B1CHP15',
          path: '/b1chp15',
          builder: (context, params) => NavBarPage(
            initialPage: '',
            page: B1chp15Widget(),
          ),
        ),
        FFRoute(
          name: 'B1CHP16',
          path: '/b1chp16',
          builder: (context, params) => NavBarPage(
            initialPage: '',
            page: B1chp16Widget(),
          ),
        ),
        FFRoute(
          name: 'B1CHP17',
          path: '/b1chp17',
          builder: (context, params) => NavBarPage(
            initialPage: '',
            page: B1chp17Widget(),
          ),
        ),
        FFRoute(
          name: 'B1CHP18',
          path: '/b1chp18',
          builder: (context, params) => NavBarPage(
            initialPage: '',
            page: B1chp18Widget(),
          ),
        ),
        FFRoute(
          name: 'B1CHP19',
          path: '/b1chp19',
          builder: (context, params) => NavBarPage(
            initialPage: '',
            page: B1chp19Widget(),
          ),
        ),
        FFRoute(
          name: 'B1CHP20',
          path: '/b1chp20',
          builder: (context, params) => NavBarPage(
            initialPage: '',
            page: B1chp20Widget(),
          ),
        ),
        FFRoute(
          name: 'B1CHP21',
          path: '/b1chp21',
          builder: (context, params) => NavBarPage(
            initialPage: '',
            page: B1chp21Widget(),
          ),
        ),
        FFRoute(
          name: 'B1CHP22',
          path: '/b1chp22',
          builder: (context, params) => NavBarPage(
            initialPage: '',
            page: B1chp22Widget(),
          ),
        ),
        FFRoute(
          name: 'B1CHP23',
          path: '/b1chp23',
          builder: (context, params) => NavBarPage(
            initialPage: '',
            page: B1chp23Widget(),
          ),
        ),
        FFRoute(
          name: 'B1CHP24',
          path: '/b1chp24',
          builder: (context, params) => NavBarPage(
            initialPage: '',
            page: B1chp24Widget(),
          ),
        ),
        FFRoute(
          name: 'B1CHP25',
          path: '/b1chp25',
          builder: (context, params) => NavBarPage(
            initialPage: '',
            page: B1chp25Widget(),
          ),
        ),
        FFRoute(
          name: 'B1CHP26',
          path: '/b1chp26',
          builder: (context, params) => NavBarPage(
            initialPage: '',
            page: B1chp26Widget(),
          ),
        ),
        FFRoute(
          name: 'B1CHP27',
          path: '/b1chp27',
          builder: (context, params) => NavBarPage(
            initialPage: '',
            page: B1chp27Widget(),
          ),
        ),
        FFRoute(
          name: 'B1CHP28',
          path: '/b1chp28',
          builder: (context, params) => NavBarPage(
            initialPage: '',
            page: B1chp28Widget(),
          ),
        ),
        FFRoute(
          name: 'B1CHP29',
          path: '/b1chp29',
          builder: (context, params) => NavBarPage(
            initialPage: '',
            page: B1chp29Widget(),
          ),
        ),
        FFRoute(
          name: 'B1CHP30',
          path: '/b1chp30',
          builder: (context, params) => NavBarPage(
            initialPage: '',
            page: B1chp30Widget(),
          ),
        ),
        FFRoute(
          name: 'B1CHP31',
          path: '/b1chp31',
          builder: (context, params) => NavBarPage(
            initialPage: '',
            page: B1chp31Widget(),
          ),
        ),
        FFRoute(
          name: 'B1CHP32',
          path: '/b1chp32',
          builder: (context, params) => NavBarPage(
            initialPage: '',
            page: B1chp32Widget(),
          ),
        ),
        FFRoute(
          name: 'B1CHP33',
          path: '/b1chp33',
          builder: (context, params) => NavBarPage(
            initialPage: '',
            page: B1chp33Widget(),
          ),
        ),
        FFRoute(
          name: 'B1CHP34',
          path: '/b1chp34',
          builder: (context, params) => NavBarPage(
            initialPage: '',
            page: B1chp34Widget(),
          ),
        ),
        FFRoute(
          name: 'B1CHP35',
          path: '/b1chp35',
          builder: (context, params) => NavBarPage(
            initialPage: '',
            page: B1chp35Widget(),
          ),
        ),
        FFRoute(
          name: 'B1CHP36',
          path: '/b1chp36',
          builder: (context, params) => NavBarPage(
            initialPage: '',
            page: B1chp36Widget(),
          ),
        ),
        FFRoute(
          name: 'B1CHP37',
          path: '/b1chp37',
          builder: (context, params) => NavBarPage(
            initialPage: '',
            page: B1chp37Widget(),
          ),
        ),
        FFRoute(
          name: 'B1CHP38',
          path: '/b1chp38',
          builder: (context, params) => NavBarPage(
            initialPage: '',
            page: B1chp38Widget(),
          ),
        ),
        FFRoute(
          name: 'B1CHP39',
          path: '/b1chp39',
          builder: (context, params) => NavBarPage(
            initialPage: '',
            page: B1chp39Widget(),
          ),
        ),
        FFRoute(
          name: 'B1CHP40',
          path: '/b1chp40',
          builder: (context, params) => NavBarPage(
            initialPage: '',
            page: B1chp40Widget(),
          ),
        ),
        FFRoute(
          name: 'B1CHP41',
          path: '/b1chp41',
          builder: (context, params) => NavBarPage(
            initialPage: '',
            page: B1chp41Widget(),
          ),
        ),
        FFRoute(
          name: 'B1CHP42',
          path: '/b1chp42',
          builder: (context, params) => NavBarPage(
            initialPage: '',
            page: B1chp42Widget(),
          ),
        ),
        FFRoute(
          name: 'B1CHP43',
          path: '/b1chp43',
          builder: (context, params) => NavBarPage(
            initialPage: '',
            page: B1chp43Widget(),
          ),
        ),
        FFRoute(
          name: 'B1CHP44',
          path: '/b1chp44',
          builder: (context, params) => NavBarPage(
            initialPage: '',
            page: B1chp44Widget(),
          ),
        ),
        FFRoute(
          name: 'B1CHP45',
          path: '/b1chp45',
          builder: (context, params) => NavBarPage(
            initialPage: '',
            page: B1chp45Widget(),
          ),
        ),
        FFRoute(
          name: 'B1CHP46',
          path: '/b1chp46',
          builder: (context, params) => NavBarPage(
            initialPage: '',
            page: B1chp46Widget(),
          ),
        ),
        FFRoute(
          name: 'B1CHP47',
          path: '/b1chp47',
          builder: (context, params) => NavBarPage(
            initialPage: '',
            page: B1chp47Widget(),
          ),
        ),
        FFRoute(
          name: 'B1CHP48',
          path: '/b1chp48',
          builder: (context, params) => NavBarPage(
            initialPage: '',
            page: B1chp48Widget(),
          ),
        ),
        FFRoute(
          name: 'B1CHP49',
          path: '/b1chp49',
          builder: (context, params) => NavBarPage(
            initialPage: '',
            page: B1chp49Widget(),
          ),
        ),
        FFRoute(
          name: 'B1CHP50',
          path: '/b1chp50',
          builder: (context, params) => NavBarPage(
            initialPage: '',
            page: B1chp50Widget(),
          ),
        ),
        FFRoute(
          name: 'B1CHP51',
          path: '/b1chp51',
          builder: (context, params) => NavBarPage(
            initialPage: '',
            page: B1chp51Widget(),
          ),
        ),
        FFRoute(
          name: 'B1CHP52',
          path: '/b1chp52',
          builder: (context, params) => NavBarPage(
            initialPage: '',
            page: B1chp52Widget(),
          ),
        ),
        FFRoute(
          name: 'B1CHP53',
          path: '/b1chp53',
          builder: (context, params) => NavBarPage(
            initialPage: '',
            page: B1chp53Widget(),
          ),
        ),
        FFRoute(
          name: 'B1CHP54',
          path: '/b1chp54',
          builder: (context, params) => NavBarPage(
            initialPage: '',
            page: B1chp54Widget(),
          ),
        ),
        FFRoute(
          name: 'B1CHP55',
          path: '/b1chp55',
          builder: (context, params) => NavBarPage(
            initialPage: '',
            page: B1chp55Widget(),
          ),
        ),
        FFRoute(
          name: 'B1CHP56',
          path: '/b1chp56',
          builder: (context, params) => NavBarPage(
            initialPage: '',
            page: B1chp56Widget(),
          ),
        ),
        FFRoute(
          name: 'setting',
          path: '/setting',
          builder: (context, params) => SettingWidget(),
        ),
        FFRoute(
          name: 'B1CHP0',
          path: '/b1chp0',
          builder: (context, params) => NavBarPage(
            initialPage: '',
            page: B1chp0Widget(),
          ),
        ),
        FFRoute(
          name: 'flipcard_fruits',
          path: '/flipcardFruits',
          builder: (context, params) => NavBarPage(
            initialPage: '',
            page: FlipcardFruitsWidget(),
          ),
        ),
        FFRoute(
          name: 'Audio_Home',
          path: '/audioHome',
          builder: (context, params) => NavBarPage(
            initialPage: '',
            page: AudioHomeWidget(),
          ),
        ),
        FFRoute(
          name: 'DuasandSupplications',
          path: '/duasandSupplications',
          builder: (context, params) => NavBarPage(
            initialPage: '',
            page: DuasandSupplicationsWidget(),
          ),
        ),
        FFRoute(
          name: 'InspirationalTalks',
          path: '/inspirationalTalks',
          builder: (context, params) => NavBarPage(
            initialPage: '',
            page: InspirationalTalksWidget(),
          ),
        ),
        FFRoute(
          name: 'IslamicLectures',
          path: '/islamicLectures',
          builder: (context, params) => NavBarPage(
            initialPage: '',
            page: IslamicLecturesWidget(),
          ),
        ),
        FFRoute(
          name: 'HadithNarrations',
          path: '/hadithNarrations',
          builder: (context, params) => NavBarPage(
            initialPage: '',
            page: HadithNarrationsWidget(),
          ),
        ),
        FFRoute(
          name: 'QuranRecitations',
          path: '/quranRecitations',
          builder: (context, params) => NavBarPage(
            initialPage: '',
            page: QuranRecitationsWidget(),
          ),
        ),
        FFRoute(
          name: 'Books',
          path: '/books',
          builder: (context, params) => NavBarPage(
            initialPage: '',
            page: BooksWidget(),
          ),
        ),
        FFRoute(
          name: 'Flipcard_home',
          path: '/flipcardHome',
          builder: (context, params) => NavBarPage(
            initialPage: '',
            page: FlipcardHomeWidget(),
          ),
        ),
        FFRoute(
          name: 'flipcard_birds',
          path: '/flipcardBirds',
          builder: (context, params) => NavBarPage(
            initialPage: '',
            page: FlipcardBirdsWidget(),
          ),
        ),
        FFRoute(
          name: 'flipcard_travel',
          path: '/flipcardTravel',
          builder: (context, params) => NavBarPage(
            initialPage: '',
            page: FlipcardTravelWidget(),
          ),
        ),
        FFRoute(
          name: 'flipcard_stars',
          path: '/flipcardStars',
          builder: (context, params) => NavBarPage(
            initialPage: '',
            page: FlipcardStarsWidget(),
          ),
        ),
        FFRoute(
          name: 'flipcard_animal',
          path: '/flipcardAnimal',
          builder: (context, params) => NavBarPage(
            initialPage: '',
            page: FlipcardAnimalWidget(),
          ),
        ),
        FFRoute(
          name: 'Profile',
          path: '/profile',
          builder: (context, params) => params.isEmpty
              ? NavBarPage(initialPage: 'Profile')
              : NavBarPage(
                  initialPage: 'Profile',
                  page: ProfileWidget(),
                ),
        ),
        FFRoute(
          name: 'Aboutus',
          path: '/aboutus',
          builder: (context, params) => NavBarPage(
            initialPage: '',
            page: AboutusWidget(),
          ),
        )
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
      observers: [routeObserver],
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void goNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : goNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void pushNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : pushNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void safePop() {
    // If there is only one route on the stack, navigate to the initial
    // page instead of popping.
    if (canPop()) {
      pop();
    } else {
      go('/');
    }
  }
}

extension GoRouterExtensions on GoRouter {
  AppStateNotifier get appState => AppStateNotifier.instance;
  void prepareAuthEvent([bool ignoreRedirect = false]) =>
      appState.hasRedirect() && !ignoreRedirect
          ? null
          : appState.updateNotifyOnAuthChange(false);
  bool shouldRedirect(bool ignoreRedirect) =>
      !ignoreRedirect && appState.hasRedirect();
  void clearRedirectLocation() => appState.clearRedirectLocation();
  void setRedirectLocationIfUnset(String location) =>
      appState.updateNotifyOnAuthChange(false);
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(pathParameters)
    ..addAll(uri.queryParameters)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.allParams.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, {
    bool isList = false,
    List<String>? collectionNamePath,
  }) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(
      param,
      type,
      isList,
      collectionNamePath: collectionNamePath,
    );
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        redirect: (context, state) {
          if (appStateNotifier.shouldRedirect) {
            final redirectLocation = appStateNotifier.getRedirectLocation();
            appStateNotifier.clearRedirectLocation();
            return redirectLocation;
          }

          if (requireAuth && !appStateNotifier.loggedIn) {
            appStateNotifier.setRedirectLocationIfUnset(state.uri.toString());
            return '/auth1';
          }
          return null;
        },
        pageBuilder: (context, state) {
          fixStatusBarOniOS16AndBelow(context);
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = appStateNotifier.loading
              ? Container(
                  color: Colors.transparent,
                  child: Image.asset(
                    'assets/images/vnimc_1.png',
                    fit: BoxFit.contain,
                  ),
                )
              : page;

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) =>
                          PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).buildTransitions(
                    context,
                    animation,
                    secondaryAnimation,
                    child,
                  ),
                )
              : MaterialPage(key: state.pageKey, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => TransitionInfo(hasTransition: false);
}

class RootPageContext {
  const RootPageContext(this.isRootPage, [this.errorRoute]);
  final bool isRootPage;
  final String? errorRoute;

  static bool isInactiveRootPage(BuildContext context) {
    final rootPageContext = context.read<RootPageContext?>();
    final isRootPage = rootPageContext?.isRootPage ?? false;
    final location = GoRouterState.of(context).uri.toString();
    return isRootPage &&
        location != '/' &&
        location != rootPageContext?.errorRoute;
  }

  static Widget wrap(Widget child, {String? errorRoute}) => Provider.value(
        value: RootPageContext(true, errorRoute),
        child: child,
      );
}

extension GoRouterLocationExtension on GoRouter {
  String getCurrentLocation() {
    final RouteMatch lastMatch = routerDelegate.currentConfiguration.last;
    final RouteMatchList matchList = lastMatch is ImperativeRouteMatch
        ? lastMatch.matches
        : routerDelegate.currentConfiguration;
    return matchList.uri.toString();
  }
}
