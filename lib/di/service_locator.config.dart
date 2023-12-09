// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:to_be_decided/services/flame_audio_service.dart' as _i3;
import 'package:to_be_decided/services/navigation_service.dart' as _i4;
import 'package:to_be_decided/services/window_manager_service.dart' as _i6;
import 'package:to_be_decided/ui/credits/credits_viewmodel.dart' as _i7;
import 'package:to_be_decided/ui/menu/menu_viewmodel.dart' as _i8;
import 'package:to_be_decided/ui/settings/settings_viewmodel.dart' as _i9;
import 'package:to_be_decided/ui/splash/splash_viewmodel.dart' as _i5;

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
    gh.lazySingleton<_i4.NavigationService>(() => _i4.NavigationService());
    gh.factory<_i5.SplashViewModel>(
        () => _i5.SplashViewModel(gh<_i4.NavigationService>()));
    gh.lazySingleton<_i6.WindowManagerService>(
        () => _i6.WindowManagerService());
    gh.factory<_i7.CreditsViewModel>(
        () => _i7.CreditsViewModel(gh<_i4.NavigationService>()));
    gh.factory<_i8.MenuViewModel>(() => _i8.MenuViewModel(
          gh<_i4.NavigationService>(),
          gh<_i6.WindowManagerService>(),
        ));
    gh.factory<_i9.SettingsViewModel>(() => _i9.SettingsViewModel(
          gh<_i4.NavigationService>(),
          gh<_i6.WindowManagerService>(),
          gh<_i3.FlameAudioService>(),
        ));
    return this;
  }
}
