import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mydrakorlist/feature_drakorlist/injection_container.dart';
import 'package:mydrakorlist/feature_drakorlist/presentation/bloc/drama_blocs.dart';
import 'package:mydrakorlist/feature_drakorlist/presentation/pages/home/drakor_lists.dart';

import 'feature_drakorlist/presentation/bloc/drama_events.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await initializeDependencies();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<DramaBloc>(
      create: (context) => sl()..add(GetAllDramas()),
      child: MaterialApp(
        home: DrakorLists(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}