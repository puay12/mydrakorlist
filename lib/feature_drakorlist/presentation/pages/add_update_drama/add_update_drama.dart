import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mydrakorlist/core/config/extensions.dart' as appExt;
import 'package:mydrakorlist/core/config/theme/color.dart' as appColor;
import 'package:mydrakorlist/core/config/theme/typography.dart' as appTypo;
import 'package:mydrakorlist/feature_drakorlist/domain/entities/drama.dart';
import 'package:mydrakorlist/feature_drakorlist/presentation/bloc/drama_blocs.dart';
import 'package:mydrakorlist/feature_drakorlist/presentation/widgets/custom_text_formgroup.dart';

import '../../../injection_container.dart';
import '../../bloc/drama_events.dart';
import '../../bloc/drama_states.dart';
import '../../bloc/interfaces/drama_state.dart';
import '../home/drakor_lists.dart';

class AddUpdateDramaPage extends StatefulWidget {
  DramaEntity? drama;

  AddUpdateDramaPage({Key? key, this.drama}) : super(key: key);

  @override
  State<AddUpdateDramaPage> createState() => _AddUpdateDramaPageState();
}

class _AddUpdateDramaPageState extends State<AddUpdateDramaPage> {
  final _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  TextEditingController _titleController  = TextEditingController();
  TextEditingController _genreController  = TextEditingController();
  TextEditingController _synopsisController  = TextEditingController();
  TextEditingController _imdbRateController  = TextEditingController();
  TextEditingController _jmlhEpsController  = TextEditingController();
  TextEditingController _posterImageController  = TextEditingController();
  TextEditingController _myReviewController  = TextEditingController();

  String _statusController = '';

  @override
  void initState() {
    super.initState();
    if(widget.drama != null){
      _titleController.text  = widget.drama!.title!;
      _genreController.text  = widget.drama!.genre!;
      _synopsisController.text  = widget.drama!.synopsis!;
      _imdbRateController.text  = widget.drama!.imdbRate!;
      _jmlhEpsController.text  = widget.drama!.jmlhEps!;
      _posterImageController.text  = widget.drama!.posterImage!;
      _myReviewController.text  = widget.drama!.myReview!;
      _statusController = appExt.boolToString(widget.drama!.status!);
    } else{
      _statusController = 'true';
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        appBar: _buildAppbar(context),
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
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
        widget.drama == null ? 'Add Drama' : 'Update Drama',
        style: appTypo.headerTitle,
      ),
      centerTitle: true,
      backgroundColor: appColor.defaultPrimary,
    );
  }

  _buildBody(BuildContext context){
    return Container(
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            _buildFormFields(context),
            SizedBox(height: 4),
            _buildSubmitButton(context),
          ],
        ),
      ),
    );
  }

  _buildFormFields(BuildContext context){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTextFormGroup(
          fieldController: _titleController,
          label: 'Drama Title',
          hint: 'Enter the drama title',
          errorMsg: 'Please enter the drama title',
          isMultiline: false,
        ),
        SizedBox(height: 12),
        CustomTextFormGroup(
          fieldController: _genreController,
          label: 'Genre',
          hint: 'Ex: Romance, Comedy, Drama',
          errorMsg: 'Please enter at least one drama genre',
          isMultiline: false,
        ),
        SizedBox(height: 12),
        CustomTextFormGroup(
          fieldController: _synopsisController,
          label: 'Synopsis',
          hint: 'Max. 500 karakter',
          errorMsg: 'Please enter the drama synopsis',
          isMultiline: true,
        ),
        SizedBox(height: 4),
        CustomTextFormGroup(
          fieldController: _imdbRateController,
          label: 'IMDb Rate',
          hint: 'Fill with "-" if it\'s still unknown',
          errorMsg: 'Please enter the IMDB rate on a 10 scale',
          isMultiline: false,
        ),
        SizedBox(height: 12),
        CustomTextFormGroup(
          fieldController: _jmlhEpsController,
          label: 'Total Episodes',
          hint: 'Fill with "-" if it\'s still unknown',
          errorMsg: 'Please enter the total episodes',
          isMultiline: false,
        ),
        SizedBox(height: 12),
        CustomTextFormGroup(
          fieldController: _posterImageController,
          label: 'Poster Image',
          hint: 'Fill with the image URL from the internet',
          errorMsg: 'Please enter the poster image URL',
          isMultiline: false,
        ),
        SizedBox(height: 12),
        CustomTextFormGroup(
          fieldController: _myReviewController,
          label: 'My Review',
          hint: 'Fill with "-" if not done watching',
          errorMsg: 'Please enter the review',
          isMultiline: true,
        ),
        SizedBox(height: 4),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Status',
              style: appTypo.bodySubtitle
            ),
            _buildRadioFields(context)
          ],
        )
      ],
    );
  }

  _buildRadioFields(BuildContext context){
    return Column(
      children: [
        RadioListTile(
          title: Text(
            'Watched',
            style: appTypo.body.copyWith(fontWeight: FontWeight.w600),
          ),
          value: "true",
          groupValue: _statusController,
          onChanged: (value){
            setState(() {
              _statusController = value.toString();
            });
          },
          fillColor: MaterialStateProperty.all(appColor.defaultPrimary),
        ),
        SizedBox(width: 8),
        RadioListTile(
          title: Text(
            'Not Done',
            style: appTypo.body.copyWith(fontWeight: FontWeight.w600),
          ),
          value: "false",
          groupValue: _statusController,
          onChanged: (value){
            setState(() {
              _statusController = value.toString();
            });
          },
          fillColor: MaterialStateProperty.all(appColor.defaultPrimary),
        ),
      ],
    );
  }

  _buildSubmitButton(BuildContext context){
    DramaEntity _newDrama = DramaEntity();

    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        child: Text(
          widget.drama == null ? 'Submit' : 'Update',
          style: appTypo.bodySubtitle.copyWith(color: appColor.defaultWhite),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: appColor.defaultPrimary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
        ),
        onPressed: (){
          setState(() {
            _newDrama = DramaEntity(
              title: _titleController.text,
              genre: _genreController.text,
              synopsis: _synopsisController.text,
              imdbRate: _imdbRateController.text,
              jmlhEps: _jmlhEpsController.text,
              status: appExt.toBoolean(_statusController),
              posterImage: _posterImageController.text,
              myReview: _myReviewController.text
            );
          });
          BlocProvider.of<DramaBloc>(context).add(AddUpdateDrama(_newDrama));
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => DrakorLists())
          ).then((value) => ScaffoldMessenger.of(context).showSnackBar(
              new SnackBar(
                content: Text(
                  widget.drama == null ? 'Successfully added the new drama' : 'Successfully updated the drama',
                  style: appTypo.bodySubtitle.copyWith(color: appColor.defaultWhite),
                ),
                backgroundColor: appColor.defaultSuccess,
              )));
        },
      ),
    );
  }
}
