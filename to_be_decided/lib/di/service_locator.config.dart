// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:to_be_decided/services/navigation_service.dart' as _i3;
import 'package:to_be_decided/ui/menu/menu_viewmodel.dart' as _i5;
import 'package:to_be_decided/ui/splash/splash_viewmodel.dart' as _i4;

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
    gh.lazySingleton<_i3.NavigationService>(() => _i3.NavigationService());
    gh.factory<_i4.SplashViewModel>(
        () => _i4.SplashViewModel(gh<_i3.NavigationService>()));
    gh.factory<_i5.MenuViewModel>(
        () => _i5.MenuViewModel(gh<_i3.NavigationService>()));
    return this;
  }
}
