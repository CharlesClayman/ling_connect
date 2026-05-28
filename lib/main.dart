import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/services/service_locator.dart' as di;
import 'core/theme/app_theme.dart';
import 'core/utils/route_generator.dart';
import 'features/auth/presentation/bloc/auth_bloc.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (context) => di.sl<AuthBloc>(),
        ),
      ],
      child: const LingConnectApp(),
    ),
  );
}

class LingConnectApp extends StatelessWidget {
  const LingConnectApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LingConnect',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      initialRoute: '/',
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
