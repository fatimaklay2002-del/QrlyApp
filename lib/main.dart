import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/data/history_repository.dart';
import 'core/utils/app_color.dart';
import 'core/utils/app_strings.dart';
import 'features/generate_qr_code/logic/generate_cubit.dart';
import 'features/scan_history/logic/history_cubit.dart';
import 'features/scan_qr_code/logic/scan_cubit.dart';
import 'features/scan_qr_code/presentation/widgets/nav_bar.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HistoryRepository.init();
  runApp(const AppProviders());
}

class AppProviders extends StatelessWidget {
  const AppProviders({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => HistoryCubit(HistoryRepository())),
        BlocProvider(
          create: (context) => GenerateCubit(context.read<HistoryCubit>()),
        ),
        BlocProvider(
          create: (context) => ScanCubit(context.read<HistoryCubit>()),
        ),
      ],
      child: const QrlyApp(),
    );
  }
}

class QrlyApp extends StatelessWidget {
  const QrlyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(scaffoldBackgroundColor: AppColor.background),
      title: AppStrings.appName,
      home: NavBar(),
    );
  }
}
