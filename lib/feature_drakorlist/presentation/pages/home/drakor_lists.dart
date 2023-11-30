import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mydrakorlist/core/config/theme/color.dart' as appColor;
import 'package:mydrakorlist/core/config/theme/typography.dart' as appTypo;
import 'package:mydrakorlist/feature_drakorlist/presentation/bloc/drama_blocs.dart';
import 'package:mydrakorlist/feature_drakorlist/presentation/bloc/drama_states.dart';
import 'package:mydrakorlist/feature_drakorlist/presentation/bloc/interfaces/drama_state.dart';

class DrakorLists extends StatelessWidget {
  const DrakorLists({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _buildAppbar(),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(12),
          child: _buildBody(),
        ),
      ),
    );
  }

  _buildAppbar(){
    return AppBar(
      title: Center(
        child: Text(
          'My Drakor Lists',
          style: appTypo.headerTitle,
        ),
      ),
      backgroundColor: appColor.defaultPrimary,
    );
  }

  _buildBody(){
    return BlocBuilder<DramaBloc, DramaState>(
        builder: (_,state){
          if(state is DramaLoading){
            return const Center(child: CupertinoActivityIndicator());
          }
          if(state is DramaFailed){
            return Center(child: Text(state.error!));
          }
          if(state is DramaSuccess){
            return ListView.builder(
              physics: BouncingScrollPhysics(),
              shrinkWrap: true,
              itemCount: state.drama_lists!.length,
              itemBuilder: (context, index){
                return ListTile(
                  title: Text('${index}'),
                );
              },
            );
          }
          return const SizedBox();
        },
    );
  }
}