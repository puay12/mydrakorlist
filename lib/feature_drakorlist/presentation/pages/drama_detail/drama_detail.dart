import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:mydrakorlist/core/config/constants.dart' as appCons;
import 'package:mydrakorlist/core/config/theme/color.dart' as appColor;
import 'package:mydrakorlist/core/config/theme/typography.dart' as appTypo;
import 'package:mydrakorlist/feature_drakorlist/presentation/bloc/drama_events.dart';

import '../../../domain/entities/drama.dart';
import '../../bloc/drama_blocs.dart';
import '../add_update_drama/add_update_drama.dart';
import '../home/drakor_lists.dart';

class DramaDetail extends StatefulWidget {
  final DramaEntity drama;

  DramaDetail({Key? key, required this.drama}) : super(key: key);

  @override
  State<DramaDetail> createState() => _DramaDetailState();
}

class _DramaDetailState extends State<DramaDetail> {
  @override
  Widget build(BuildContext context) {
    const _actionTitles = ['Update Drama', 'Delete Drama'];

    return SafeArea(
      child: Scaffold(
        appBar: _buildAppbar(context),
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: _buildBody(context),
        ),
        floatingActionButton: _buildFloatingButton(context)
      ),
    );
  }

  _buildAppbar(BuildContext context){
    return AppBar(
      leading: IconButton(
        color: appColor.defaultWhite,
        icon: Icon(Icons.arrow_back),
        iconSize: 20,
        splashRadius: 10,
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
      title: Text(
        'Drama Detail',
        style: appTypo.headerTitle,
      ),
      centerTitle: true,
      backgroundColor: appColor.defaultPrimary,
    );
  }

  Widget _buildFloatingButton(BuildContext context){
    return SpeedDial(
      icon: Icons.more_vert,
      backgroundColor: appColor.defaultPrimary,
      overlayColor: appColor.defaultGray,
      overlayOpacity: 0.6,
      children: [
        SpeedDialChild(
          child: Icon(Icons.edit, color: appColor.defaultWhite),
          label: 'Update',
          backgroundColor: appColor.defaultSuccess,
          onTap: () => _openAddUpdateDramaPage(context)
        ),
        SpeedDialChild(
          child: Icon(Icons.delete_rounded, color: appColor.defaultWhite),
          label: 'Delete',
          backgroundColor: appColor.defaultError,
          onTap: () => showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text(
                  'Delete Drama',
                  style: appTypo.bodySubtitle,
                  textAlign: TextAlign.left,
                ),
                content: Text(
                  'Are you sure you want to continue?',
                  style: appTypo.body,
                ),
                actions: [
                  _cancelButton(context),
                  _continueButton(context),
                ],
              );
            },
          )
        ),
      ],
    );
  }

  _buildBody(BuildContext context){
    return Container(
      child: Column(
        children: [
          _buildTitle(),
          _buildImage(context),
          _buildDetails(),
        ],
      ),
    );
  }

  Widget _buildTitle() {
    return Center(
      child: Text(
        widget.drama!.title ?? "",
        style: appTypo.bodyTitle,
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _buildImage(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: widget.drama!.posterImage ?? appCons.errorUrlImage,
      imageBuilder: (context, imageProvider) => Container(
        margin: EdgeInsets.only(top: 12, bottom: 8),
        height: 300,
        decoration: BoxDecoration(
          image: DecorationImage(image: imageProvider, fit: BoxFit.contain),
        ),
      ),
    );
  }

  _buildDetails(){
    return Column(
      children: [
        _buildSynopsis(),
        _buildGenre(),
        _buildRating(),
        _buildJmlhEps(),
        _buildMyReview(),
        _buildStatus()
      ],
    );
  }

  _buildSection(String section){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          section,
          style: appTypo.body.copyWith(color: appColor.defaultGray),
        ),
        Divider(),
      ],
    );
  }

  _buildSynopsis(){
    return Container(
      margin: EdgeInsets.only(bottom: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSection('Synopsis'),
          Text(
            widget.drama!.synopsis ?? "Synopsis is not available.",
            style: appTypo.body,
            textAlign: TextAlign.justify
          ),
        ],
      ),
    );
  }

  _buildGenre(){
    return Container(
      margin: EdgeInsets.only(bottom: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSection('Genre'),
          Text(
            widget.drama!.genre ?? "",
            style: appTypo.body,
          ),
        ],
      ),
    );
  }

  _buildRating(){
    return Container(
      margin: EdgeInsets.only(bottom: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSection('IMDb Rate'),
          Text(
            '${widget.drama!.imdbRate} / 10' ?? "",
            style: appTypo.body,
          ),
        ],
      ),
    );
  }

  _buildJmlhEps(){
    return Container(
      margin: EdgeInsets.only(bottom: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSection('Jumlah Episode'),
          Text(
            '${widget.drama!.jmlhEps} episode' ?? "",
            style: appTypo.body,
          ),
        ],
      ),
    );
  }

  _buildMyReview(){
    return Container(
      margin: EdgeInsets.only(bottom: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSection('My Review'),
          Text(
            widget.drama!.myReview ?? "",
            style: appTypo.body,
          ),
        ],
      ),
    );
  }

  _buildStatus(){
    return Container(
      margin: EdgeInsets.only(bottom: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSection('Status '),
          Text(
            widget.drama!.status ?? false ? 'Watched' : 'Not Done',
            style: appTypo.body,
          ),
        ],
      ),
    );
  }

  void _openAddUpdateDramaPage(BuildContext context){
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AddUpdateDramaPage(drama: widget.drama)),
    );
  }

  Widget _cancelButton(BuildContext context){
    return TextButton(
      child: Text(
        "Cancel",
        style: appTypo.bodySubtitle.copyWith(color: appColor.defaultPrimary),
      ),
      onPressed:  () {
        Navigator.of(context).pop();
      },
    );
  }

  Widget _continueButton(BuildContext context){
    return TextButton(
      child: Text(
        "Yes",
        style: appTypo.bodySubtitle.copyWith(color: appColor.defaultPrimary),
      ),
      onPressed:  () {
        BlocProvider.of<DramaBloc>(context).add(DeleteDrama(widget.drama));
        Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => DrakorLists())
        );
        ScaffoldMessenger.of(context).showSnackBar(
            new SnackBar(
              content: Text(
                'Successfully delete the drama',
                style: appTypo.bodySubtitle.copyWith(color: appColor.defaultWhite),
              ),
              backgroundColor: appColor.defaultSuccess,
            )
        );
      },
    );
  }
}
