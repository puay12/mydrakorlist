import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mydrakorlist/core/config/constants.dart' as appCons;
import 'package:mydrakorlist/core/config/theme/color.dart' as appColor;
import 'package:mydrakorlist/core/config/theme/typography.dart' as appTypo;
import '../../domain/entities/drama.dart';

class DramaTile extends StatelessWidget {
  DramaEntity drama;
  final void Function(DramaEntity drama)? onDramaPressed;

  DramaTile({Key? key, required this.drama, this.onDramaPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: _onTap,
      child: Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: appColor.defaultWhite,
          boxShadow: [
            BoxShadow(
                color: appColor.defaultGray,
                spreadRadius: 1,
                blurRadius: 5
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildImage(context),
            _buildDescription()
          ],
        ),
      ),
    );
  }

  Widget _buildImage(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: drama.posterImage ?? appCons.errorUrlImage,
      imageBuilder: (context, imageProvider) => Container(
        height: 130,
        decoration: BoxDecoration(
          image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }

  Widget _buildDescription() {
    return Container(
      margin: EdgeInsets.only(top: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [_buildTitle(), SizedBox(height: 3), _buildDetail()],
      ),
    );
  }

  Widget _buildTitle() {
    return Text(
      drama.title ?? "",
      style: appTypo.bodyTitle,
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget _buildDetail() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [_buildInfo(), _buildRating()],
        ),
      ],
    );
  }

  Widget _buildInfo() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildGenre(),
          SizedBox(height: 4),
          _buildStatus()
        ],
      ),
    );
  }

  Widget _buildRating() {
    return Center(
      child: Row(
        children: [
          Icon(Icons.star_rate, color: Colors.amber),
          SizedBox(width: 4),
          Text(
            drama.imdbRate ?? "",
            style: appTypo.bodySubtitle,
          )
        ],
      ),
    );
  }

  Widget _buildGenre() {
    return Text(
      drama.genre ?? "",
      style: appTypo.bodySubtitle,
      overflow: TextOverflow.ellipsis,
      softWrap: false,
    );
  }

  Widget _buildStatus() {
    return Text(
      drama.status ?? false ? 'Watched' : 'Not Done',
      style: appTypo.body.copyWith(color: appColor.defaultGray),
    );
  }

  void _onTap() {
    if (onDramaPressed != null) {
      onDramaPressed!(drama);
    }
  }
}
