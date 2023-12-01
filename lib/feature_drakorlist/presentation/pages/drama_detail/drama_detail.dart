import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mydrakorlist/core/config/constants.dart' as appCons;
import 'package:mydrakorlist/core/config/theme/color.dart' as appColor;
import 'package:mydrakorlist/core/config/theme/typography.dart' as appTypo;

import '../../../domain/entities/drama.dart';

class DramaDetail extends StatelessWidget {
  final DramaEntity? drama;

  DramaDetail({Key? key, this.drama}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _buildAppbar(context),
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 10),
          child: _buildBody(context),
        ),
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
        drama!.title ?? "",
        style: appTypo.bodyTitle,
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _buildImage(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: drama!.posterImage ?? appCons.errorUrlImage,
      imageBuilder: (context, imageProvider) => Container(
        margin: EdgeInsets.only(top: 12),
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
            drama!.synopsis ?? "Synopsis is not available.",
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
            drama!.genre ?? "",
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
            '${drama!.imdbRate} / 10' ?? "",
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
            '${drama!.jmlhEps} episode' ?? "",
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
            drama!.myReview ?? "",
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
            drama!.status ?? false ? 'Watched' : 'Not Done',
            style: appTypo.body,
          ),
        ],
      ),
    );
  }
}
