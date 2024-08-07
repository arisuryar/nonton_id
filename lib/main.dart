import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'core/constant/color.dart';
import 'core/routes/route.dart';
import 'firebase_options.dart';
import 'injection.dart';
import 'presentation/bloc/bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  injection();
  initializeDateFormatting('id_ID', null).then(
    (_) => runApp(const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => locator<ForgotPasswordBloc>()),
        BlocProvider(create: (context) => locator<LoginBloc>()),
        BlocProvider(create: (context) => locator<LogoutBloc>()),
        BlocProvider(create: (context) => locator<RegisterBloc>()),
        BlocProvider(create: (context) => locator<SendVerificationEmailBloc>()),
        BlocProvider(create: (context) => locator<UserBloc>()),
        BlocProvider(create: (context) => locator<MovieBloc>()),
        BlocProvider(create: (context) => locator<TransactionBloc>()),
      ],
      child: MaterialApp.router(
        title: 'Flutter Demo',
        locale: const Locale('id', 'ID'),
        theme: ThemeData(
          fontFamily: 'Poppins',
          colorScheme: ColorScheme.fromSeed(seedColor: primary),
          scaffoldBackgroundColor: background,
          useMaterial3: true,
        ),
        routerConfig: router,
      ),
    );
  }
}
