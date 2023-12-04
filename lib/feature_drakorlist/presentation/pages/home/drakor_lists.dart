import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mydrakorlist/core/config/theme/color.dart' as appColor;
import 'package:mydrakorlist/core/config/theme/typography.dart' as appTypo;
import 'package:mydrakorlist/feature_drakorlist/domain/entities/drama.dart';
import 'package:mydrakorlist/feature_drakorlist/presentation/bloc/drama_blocs.dart';
import 'package:mydrakorlist/feature_drakorlist/presentation/bloc/drama_states.dart';
import 'package:mydrakorlist/feature_drakorlist/presentation/bloc/interfaces/drama_state.dart';
import 'package:mydrakorlist/feature_drakorlist/presentation/pages/add_update_drama/add_update_drama.dart';
import 'package:mydrakorlist/feature_drakorlist/presentation/pages/drama_detail/drama_detail.dart';
import 'package:mydrakorlist/feature_drakorlist/presentation/widgets/drama_tile.dart';

class DrakorLists extends StatelessWidget {
  const DrakorLists({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        appBar: _buildAppbar(),
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: _buildBody(),
        ),
        floatingActionButton: CircleAvatar(
          radius: 30,
          backgroundColor: appColor.defaultPrimary,
          child: IconButton(
            icon: Icon(Icons.add, color: appColor.defaultWhite),
            color: appColor.defaultPrimary,
            onPressed: () => _openAddUpdateDramaPage(context),
          ),
        )
      ),
    );
  }

  _buildAppbar(){
    return AppBar(
      automaticallyImplyLeading: false,
      title: Text(
        'My Drakor Lists',
        style: appTypo.headerTitle,
      ),
      centerTitle: true,
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
            return state.drama_lists!.length == 0
                ? Center(child: Text('Data is empty.'))
                : ListView.separated(
                    physics: BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: state.drama_lists!.length,
                    itemBuilder: (context, index){
                      final drama_item = state.drama_lists![index];
                      return DramaTile(
                          drama: drama_item,
                          onDramaPressed: (drama) => _onDramaPressed(context, drama)
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) => const SizedBox(height: 16)
                  );
          }
          return const SizedBox();
        },
    );
  }

  void _onDramaPressed(BuildContext context, DramaEntity drama) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => DramaDetail(drama: drama)),
    );
  }

  void _openAddUpdateDramaPage(BuildContext context){
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AddUpdateDramaPage()),
    );
  }
}