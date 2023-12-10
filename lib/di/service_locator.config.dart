// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:frostfire_flip/services/flame_audio_service.dart' as _i3;
import 'package:frostfire_flip/services/game_service.dart' as _i4;
import 'package:frostfire_flip/services/navigation_service.dart' as _i5;
import 'package:frostfire_flip/services/window_manager_service.dart' as _i7;
import 'package:frostfire_flip/ui/credits/credits_viewmodel.dart' as _i8;
import 'package:frostfire_flip/ui/game/game_viewmodel.dart' as _i9;
import 'package:frostfire_flip/ui/menu/menu_viewmodel.dart' as _i10;
import 'package:frostfire_flip/ui/settings/settings_viewmodel.dart' as _i11;
import 'package:frostfire_flip/ui/splash/splash_viewmodel.dart' as _i6;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.lazySingleton<_i3.FlameAudioService>(() => _i3.FlameAudioService());
    gh.lazySingleton<_i4.GameService>(() => _i4.GameService());
    gh.lazySingleton<_i5.NavigationService>(() => _i5.NavigationService());
    gh.factory<_i6.SplashViewModel>(
        () => _i6.SplashViewModel(gh<_i5.NavigationService>()));
    gh.lazySingleton<_i7.WindowManagerService>(
        () => _i7.WindowManagerService());
    gh.factory<_i8.CreditsViewModel>(
        () => _i8.CreditsViewModel(gh<_i5.NavigationService>()));
    gh.factory<_i9.GameViewModel>(
        () => _i9.GameViewModel(gh<_i5.NavigationService>()));
    gh.factory<_i10.MenuViewModel>(() => _i10.MenuViewModel(
          gh<_i5.NavigationService>(),
          gh<_i7.WindowManagerService>(),
        ));
    gh.factory<_i11.SettingsViewModel>(() => _i11.SettingsViewModel(
          gh<_i5.NavigationService>(),
          gh<_i7.WindowManagerService>(),
          gh<_i3.FlameAudioService>(),
        ));
    return this;
  }
}
