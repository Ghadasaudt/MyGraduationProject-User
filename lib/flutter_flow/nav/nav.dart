import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:page_transition/page_transition.dart';
import '../flutter_flow_theme.dart';
import '../../backend/backend.dart';

import '../../auth/base_auth_user_provider.dart';
import '../../backend/push_notifications/push_notifications_handler.dart'
    show PushNotificationsHandler;

import '../../index.dart';
import '../../main.dart';
import '../lat_lng.dart';
import '../place.dart';
import 'serialization_util.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

class AppStateNotifier extends ChangeNotifier {
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
    initialUser ??= newUser;
    user = newUser;
    // Refresh the app on auth change unless explicitly marked otherwise.
    if (notifyOnAuthChange) {
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
      errorBuilder: (context, _) =>
          appStateNotifier.loggedIn ? NavBarPage() : FirstPageWidget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) =>
              appStateNotifier.loggedIn ? NavBarPage() : FirstPageWidget(),
          routes: [
            FFRoute(
              name: 'FirstPage',
              path: 'firstPage',
              builder: (context, params) => FirstPageWidget(),
            ),
            FFRoute(
              name: 'studentlogin',
              path: 'studentlogin',
              builder: (context, params) => StudentloginWidget(),
            ),
            FFRoute(
              name: 'SignUp',
              path: 'signUp',
              builder: (context, params) => SignUpWidget(),
            ),
            FFRoute(
              name: 'Emailauth',
              path: 'emailauth',
              requireAuth: true,
              builder: (context, params) => EmailauthWidget(),
            ),
            FFRoute(
              name: 'SettingUpProfile',
              path: 'settingUpProfile',
              requireAuth: true,
              builder: (context, params) => SettingUpProfileWidget(),
            ),
            FFRoute(
              name: 'notificationSettings',
              path: 'notificationSettings',
              requireAuth: true,
              builder: (context, params) => NotificationSettingsWidget(),
            ),
            FFRoute(
              name: 'Settinginterests2',
              path: 'settinginterests2',
              requireAuth: true,
              builder: (context, params) => Settinginterests2Widget(),
            ),
            FFRoute(
              name: 'HomePage',
              path: 'homePage',
              requireAuth: true,
              builder: (context, params) => params.isEmpty
                  ? NavBarPage(initialPage: 'HomePage')
                  : HomePageWidget(),
            ),
            FFRoute(
              name: 'courses',
              path: 'courses',
              requireAuth: true,
              builder: (context, params) => CoursesWidget(),
            ),
            FFRoute(
              name: 'course_info',
              path: 'courseInfo',
              requireAuth: true,
              builder: (context, params) => CourseInfoWidget(
                courseid: params.getParam('courseid', ParamType.String),
              ),
            ),
            FFRoute(
              name: 'workshops',
              path: 'workshops',
              requireAuth: true,
              builder: (context, params) => WorkshopsWidget(),
            ),
            FFRoute(
              name: 'workshope_info',
              path: 'workshopeInfo',
              requireAuth: true,
              builder: (context, params) => WorkshopeInfoWidget(
                workshopID: params.getParam('workshopID', ParamType.String),
              ),
            ),
            FFRoute(
              name: 'events',
              path: 'events',
              requireAuth: true,
              builder: (context, params) => EventsWidget(),
            ),
            FFRoute(
              name: 'event_info',
              path: 'eventInfo',
              requireAuth: true,
              builder: (context, params) => EventInfoWidget(
                eventID: params.getParam('eventID', ParamType.String),
              ),
            ),
            FFRoute(
              name: 'Opportunities',
              path: 'opportunities',
              requireAuth: true,
              builder: (context, params) => OpportunitiesWidget(),
            ),
            FFRoute(
              name: 'Opportunity_apply_form',
              path: 'opportunityApplyForm',
              requireAuth: true,
              builder: (context, params) => OpportunityApplyFormWidget(
                opportunityID:
                    params.getParam('opportunityID', ParamType.String),
              ),
            ),
            FFRoute(
              name: 'myActivities',
              path: 'myActivities',
              requireAuth: true,
              builder: (context, params) => params.isEmpty
                  ? NavBarPage(initialPage: 'myActivities')
                  : MyActivitiesWidget(),
            ),
            FFRoute(
              name: 'Profile',
              path: 'profile',
              requireAuth: true,
              builder: (context, params) => params.isEmpty
                  ? NavBarPage(initialPage: 'Profile')
                  : ProfileWidget(),
            ),
            FFRoute(
              name: 'ActivityAdminSignup',
              path: 'activityAdminSignup',
              builder: (context, params) => ActivityAdminSignupWidget(),
            ),
            FFRoute(
              name: 'EmailauthCopy',
              path: 'emailauthCopy',
              requireAuth: true,
              builder: (context, params) => EmailauthCopyWidget(),
            ),
            FFRoute(
              name: 'ActivityAdminLogin',
              path: 'activityAdminLogin',
              builder: (context, params) => ActivityAdminLoginWidget(),
            ),
            FFRoute(
              name: 'SettingUpProfileCopy',
              path: 'settingUpProfileCopy',
              requireAuth: true,
              builder: (context, params) => SettingUpProfileCopyWidget(),
            ),
            FFRoute(
              name: 'coursesCopy',
              path: 'coursesCopy',
              requireAuth: true,
              builder: (context, params) => CoursesCopyWidget(),
            ),
            FFRoute(
              name: 'workshopsCopy',
              path: 'workshopsCopy',
              requireAuth: true,
              builder: (context, params) => WorkshopsCopyWidget(),
            ),
            FFRoute(
              name: 'eventsCopy',
              path: 'eventsCopy',
              requireAuth: true,
              builder: (context, params) => EventsCopyWidget(),
            ),
            FFRoute(
              name: 'AddExtraact',
              path: 'addExtraact',
              requireAuth: true,
              builder: (context, params) => AddExtraactWidget(),
            ),
            FFRoute(
              name: 'Addopp',
              path: 'Addopp',
              requireAuth: true,
              builder: (context, params) => AddoppWidget(),
            ),
            FFRoute(
              name: 'MyActDetails',
              path: 'myActDetails',
              requireAuth: true,
              builder: (context, params) => MyActDetailsWidget(
                actsdetails: params.getParam('actsdetails', ParamType.String),
              ),
            ),
            FFRoute(
              name: 'MyOppDetails',
              path: 'myOppDetails',
              requireAuth: true,
              builder: (context, params) => MyOppDetailsWidget(
                opportunityID:
                    params.getParam('opportunityID', ParamType.String),
              ),
            ),
            FFRoute(
              name: 'passwordreset',
              path: 'passwordreset',
              builder: (context, params) => PasswordresetWidget(),
            ),
            FFRoute(
              name: 'passwordresetCopy',
              path: 'passwordresetCopy',
              builder: (context, params) => PasswordresetCopyWidget(),
            )
          ].map((r) => r.toRoute(appStateNotifier)).toList(),
        ),
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
      urlPathStrategy: UrlPathStrategy.path,
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
    Map<String, String> params = const <String, String>{},
    Map<String, String> queryParams = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : goNamed(
              name,
              params: params,
              queryParams: queryParams,
              extra: extra,
            );

  void pushNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> params = const <String, String>{},
    Map<String, String> queryParams = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : pushNamed(
              name,
              params: params,
              queryParams: queryParams,
              extra: extra,
            );

  void safePop() {
    // If there is only one route on the stack, navigate to the initial
    // page instead of popping.
    if (GoRouter.of(this).routerDelegate.matches.length <= 1) {
      go('/');
    } else {
      pop();
    }
  }
}

extension GoRouterExtensions on GoRouter {
  AppStateNotifier get appState =>
      (routerDelegate.refreshListenable as AppStateNotifier);
  void prepareAuthEvent([bool ignoreRedirect = false]) =>
      appState.hasRedirect() && !ignoreRedirect
          ? null
          : appState.updateNotifyOnAuthChange(false);
  bool shouldRedirect(bool ignoreRedirect) =>
      !ignoreRedirect && appState.hasRedirect();
  void clearRedirectLocation() => appState.clearRedirectLocation();
  void setRedirectLocationIfUnset(String location) =>
      (routerDelegate.refreshListenable as AppStateNotifier)
          .updateNotifyOnAuthChange(false);
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(params)
    ..addAll(queryParams)
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
      (state.extraMap.length == 1 &&
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
    ParamType type, [
    bool isList = false,
    List<String>? collectionNamePath,
  ]) {
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
    return deserializeParam<T>(param, type, isList, collectionNamePath);
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
        redirect: (state) {
          if (appStateNotifier.shouldRedirect) {
            final redirectLocation = appStateNotifier.getRedirectLocation();
            appStateNotifier.clearRedirectLocation();
            return redirectLocation;
          }

          if (requireAuth && !appStateNotifier.loggedIn) {
            appStateNotifier.setRedirectLocationIfUnset(state.location);
            return '/firstPage';
          }
          return null;
        },
        pageBuilder: (context, state) {
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
                    'assets/images/2logo.JPG',
                    fit: BoxFit.contain,
                  ),
                )
              : PushNotificationsHandler(child: page);

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder: PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).transitionsBuilder,
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
