import 'package:dudu/cubit/cubit.dart';
import 'package:dudu/cubit/user_cubit.dart';
import 'package:dudu/models/models.dart';
import 'package:dudu/ui/pages/pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'ui/pages/pages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => UserCubit()),
        BlocProvider(create: (_) => TalentCubit()),
        BlocProvider(create: (_) => UserTransactionsCubit()),
      ],
      child: const GetMaterialApp(
        debugShowCheckedModeBanner: false,
        // home: TalentDetailsPage(
        //   userTransaction: UserTransaction(talent_id: mockTalents[0]),
        // ),
        home: SplashPage(),
      ),
    );
  }
}
