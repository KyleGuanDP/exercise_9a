import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '/secrets.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart' as gmaps;
      import 'new_to_do_item_model.dart';
      export 'new_to_do_item_model.dart';
    
class NewToDoItemWidget extends StatefulWidget {
  const NewToDoItemWidget({super.key }) ;

  

  @override
  State<NewToDoItemWidget> createState() => _NewToDoItemWidgetState();
}

class _NewToDoItemWidgetState extends State<NewToDoItemWidget>  {
  late NewToDoItemModel _model;

final scaffoldKey = GlobalKey<ScaffoldState>();

  late gmaps.GoogleMapController mapController;

  final gmaps.LatLng _center = const gmaps.LatLng(37.7749, -122.4194); // Example: San Francisco

  void _onMapCreated(gmaps.GoogleMapController controller) {
    mapController = controller;
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NewToDoItemModel());

    _model.taskTextController ??= TextEditingController();
_model.taskFocusNode ??= FocusNode();

_model.descriptionTextController ??= TextEditingController();
_model.descriptionFocusNode ??= FocusNode();
    _model.locationAddressController ??= TextEditingController();

    
  }


  @override
  void dispose() {
    _model.dispose();

    
    super.dispose();
  }

  
  @override
  Widget build(BuildContext context) {
    
    return GestureDetector(
  onTap: () =>
    _model.unfocusNode.canRequestFocus
      ? FocusScope.of(context).requestFocus(_model.unfocusNode)
      : FocusScope.of(context).unfocus(),
  child: Scaffold(
      key: scaffoldKey,
      
      backgroundColor: FlutterFlowTheme.of(context).secondaryBackground  ,
      
      
      
      appBar:           AppBar(
            
                  backgroundColor: FlutterFlowTheme.of(context).secondaryBackground  ,
      
      automaticallyImplyLeading: false,
      
      title: Column(
      
      mainAxisSize: MainAxisSize.max,
      
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [Text(
      
       'Create ToDo'  ,
      
      
      style: FlutterFlowTheme.of(context).headlineMedium.override(    fontFamily: 'Outfit',
    
    
    letterSpacing: 0.0,
    
    
    
    
    
  ),
      
      
    ),
Text(
      
       'Please fill out the form below to continue.'  ,
      
      
      style: FlutterFlowTheme.of(context).labelMedium.override(    fontFamily: 'Readex Pro',
    
    
    letterSpacing: 0.0,
    
    
    
    
    
  ),
      
      
    ),].divide(const SizedBox(height: 4.0  )),
    ),
      actions: [Padding(
             padding: const EdgeInsetsDirectional.fromSTEB(
       0.0,
       8.0,
       12.0,
       8.0
  ),
             child: FlutterFlowIconButton(
      
      borderColor: FlutterFlowTheme.of(context).alternate  ,
      borderRadius: 12.0  ,
      borderWidth: 1.0  ,
      buttonSize: 40.0  ,
      fillColor: FlutterFlowTheme.of(context).secondaryBackground  ,
      
      
      
      
      icon:  Icon(
      
      Icons.close_rounded,
      color: FlutterFlowTheme.of(context).primaryText  ,
      size: 24.0  ,
    )  ,
      
      onPressed:  () async {context.safePop();},
    ),
           )
           ,],
      
      
      centerTitle: false,
      
      elevation: 0.0,

          ),
body: SafeArea(
        top: true,
        child: Form(
      key: _model.formKey,
      autovalidateMode: AutovalidateMode.disabled,
      child: Column(
      
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      
      children: [Expanded(
      
      child: SingleChildScrollView(
        
        
        
        child: Column(
      
      mainAxisSize: MainAxisSize.max,
      
      
      children: [Align(
      alignment: const AlignmentDirectional( 0.0  ,  -1.0  ),
      child: Container(
      
      
      constraints: const BoxConstraints( maxWidth: 770.0  ,),
      decoration: const BoxDecoration(
        
        
        
        
        
        
        
      ),
    
      
      child: Padding(
             padding: const EdgeInsetsDirectional.fromSTEB(
       16.0,
       12.0,
       16.0,
       0.0
  ),
             child: Column(
      
      mainAxisSize: MainAxisSize.max,
      
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [TextFormField(
      
      
      controller: _model.taskTextController ,
      focusNode: _model.taskFocusNode,
      
      
      
      autofocus: true  ,
      
      textCapitalization: TextCapitalization.words,
      
      
      obscureText: false,
      decoration: InputDecoration(
    
    labelText: 'ToDo...'  ,
    labelStyle: FlutterFlowTheme.of(context).headlineMedium.override(    fontFamily: 'Outfit',
    color:  FlutterFlowTheme.of(context).secondaryText  ,
    
    letterSpacing: 0.0,
    
    
    
    
    
  ),
    
    
    hintStyle: FlutterFlowTheme.of(context).labelMedium.override(    fontFamily: 'Readex Pro',
    
    
    letterSpacing: 0.0,
    
    
    
    
    
  ),
    errorStyle: FlutterFlowTheme.of(context).bodyMedium.override(    fontFamily: 'Readex Pro',
    color:  FlutterFlowTheme.of(context).error  ,
    fontSize: 12.0,
    letterSpacing: 0.0,
    
    
    
    
    
  ),
    
    enabledBorder: OutlineInputBorder(borderSide:     BorderSide(
      color:  FlutterFlowTheme.of(context).alternate  ,
      width: 2.0,
    )
  , borderRadius: BorderRadius.circular( 12.0  ),),
    focusedBorder: OutlineInputBorder(borderSide:     BorderSide(
      color:  FlutterFlowTheme.of(context).primary  ,
      width: 2.0,
    )
  , borderRadius: BorderRadius.circular( 12.0  ),),
    errorBorder: OutlineInputBorder(borderSide:     BorderSide(
      color:  FlutterFlowTheme.of(context).error  ,
      width: 2.0,
    )
  , borderRadius: BorderRadius.circular( 12.0  ),),
    focusedErrorBorder: OutlineInputBorder(borderSide:     BorderSide(
      color:  FlutterFlowTheme.of(context).error  ,
      width: 2.0,
    )
  , borderRadius: BorderRadius.circular( 12.0  ),),
    filled: true  ,
    fillColor: FlutterFlowTheme.of(context).secondaryBackground  ,
    contentPadding: const EdgeInsetsDirectional.fromSTEB(
       16.0,
       20.0,
       16.0,
       20.0
  ),
    
    
  ),
      style: FlutterFlowTheme.of(context).headlineMedium.override(    fontFamily: 'Outfit',
    
    
    letterSpacing: 0.0,
    
    
    
    
    
  ),
      
      
      
      cursorColor: FlutterFlowTheme.of(context).primary  ,
      validator: _model.taskTextControllerValidator.asValidator(context),
      
    ),
TextFormField(
      
      
      controller: _model.descriptionTextController ,
      focusNode: _model.descriptionFocusNode,
      
      
      
      autofocus: true  ,
      
      textCapitalization: TextCapitalization.words,
      
      
      obscureText: false,
      decoration: InputDecoration(
    
    labelText: 'Description...'  ,
    labelStyle: FlutterFlowTheme.of(context).labelLarge.override(    fontFamily: 'Readex Pro',
    
    
    letterSpacing: 0.0,
    
    
    
    
    
  ),
    alignLabelWithHint: true  ,
    
    hintStyle: FlutterFlowTheme.of(context).labelMedium.override(    fontFamily: 'Readex Pro',
    
    
    letterSpacing: 0.0,
    
    
    
    
    
  ),
    errorStyle: FlutterFlowTheme.of(context).bodyMedium.override(    fontFamily: 'Readex Pro',
    color:  FlutterFlowTheme.of(context).error  ,
    fontSize: 12.0,
    letterSpacing: 0.0,
    
    
    
    
    
  ),
    
    enabledBorder: OutlineInputBorder(borderSide:     BorderSide(
      color:  FlutterFlowTheme.of(context).alternate  ,
      width: 2.0,
    )
  , borderRadius: BorderRadius.circular( 12.0  ),),
    focusedBorder: OutlineInputBorder(borderSide:     BorderSide(
      color:  FlutterFlowTheme.of(context).primary  ,
      width: 2.0,
    )
  , borderRadius: BorderRadius.circular( 12.0  ),),
    errorBorder: OutlineInputBorder(borderSide:     BorderSide(
      color:  FlutterFlowTheme.of(context).error  ,
      width: 2.0,
    )
  , borderRadius: BorderRadius.circular( 12.0  ),),
    focusedErrorBorder: OutlineInputBorder(borderSide:     BorderSide(
      color:  FlutterFlowTheme.of(context).error  ,
      width: 2.0,
    )
  , borderRadius: BorderRadius.circular( 12.0  ),),
    filled: true  ,
    fillColor: FlutterFlowTheme.of(context).secondaryBackground  ,
    contentPadding: const EdgeInsetsDirectional.fromSTEB(
       16.0,
       16.0,
       16.0,
       16.0
  ),
    
    
  ),
      style: FlutterFlowTheme.of(context).bodyLarge.override(    fontFamily: 'Readex Pro',
    
    
    letterSpacing: 0.0,
    
    
    
    
    
  ),
      
      maxLines: 9  ,
      minLines: 5  ,
      
      
      
      
      cursorColor: FlutterFlowTheme.of(context).primary  ,
      validator: _model.descriptionTextControllerValidator.asValidator(context),
      
    ),
TextFormField(
      controller: _model.locationAddressController,
      decoration: const InputDecoration(
        labelText: 'Location address (optional)',
        hintText: 'e.g. 123 Main St, City, Country',
      ),
      style: FlutterFlowTheme.of(context).bodyMedium,
      validator: _model.locationAddressControllerValidator.asValidator(context),
    ),
Text(
      
       'Due Date'  ,
      
      
      style: FlutterFlowTheme.of(context).labelMedium.override(    fontFamily: 'Readex Pro',
    
    
    letterSpacing: 0.0,
    
    
    
    
    
  ),
      
      
    ),
InkWell(
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap:  () async {    final datePickedDate = await showDatePicker(
      context: context,
      initialDate: getCurrentTimestamp,
      firstDate: getCurrentTimestamp,
      lastDate: DateTime(2050),
      builder: (context, child) {
    return wrapInMaterialDatePickerTheme(context,
     child!,
     headerBackgroundColor:  FlutterFlowTheme.of(context).primary,
     headerForegroundColor:  FlutterFlowTheme.of(context).info,
     headerTextStyle: FlutterFlowTheme.of(context).headlineLarge.override(    fontFamily: 'Outfit',
    
    fontSize: 32.0,
    letterSpacing: 0.0,
    fontWeight: FontWeight.w600,
    
    
    
    
  ),
     pickerBackgroundColor:  FlutterFlowTheme.of(context).secondaryBackground,
     pickerForegroundColor:  FlutterFlowTheme.of(context).primaryText,
     selectedDateTimeBackgroundColor:  FlutterFlowTheme.of(context).primary,
     selectedDateTimeForegroundColor:  FlutterFlowTheme.of(context).info,
     actionButtonForegroundColor:  FlutterFlowTheme.of(context).primaryText,
     iconSize: 24.0,);
  },
    );
  

        if (datePickedDate != null) {
          safeSetState(() {
  _model.datePicked = DateTime(
              datePickedDate.year,
              datePickedDate.month,
              datePickedDate.day,
            );
});
        }},
      
      
      child: Container(
      
      width: double.infinity  ,height: 48.0  ,
      
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground  ,
        
        
        
        borderRadius: BorderRadius.circular( 12.0  ),
        
        border: Border.all(
      color: FlutterFlowTheme.of(context).alternate  ,
      width: 2.0,
    ),
      ),
    
      
      child: Align(
      alignment: const AlignmentDirectional( -1.0  ,  0.0  ),
      child: Padding(
             padding: const EdgeInsetsDirectional.fromSTEB(
       12.0,
       0.0,
       0.0,
       0.0
  ),
             child: Text(
      
       valueOrDefault<String>(dateTimeFormat('MMMEd', _model.datePicked ), 'Select a date',)  ,
      
      
      style: FlutterFlowTheme.of(context).bodyMedium.override(    fontFamily: 'Readex Pro',
    
    
    letterSpacing: 0.0,
    
    
    
    
    
  ),
      
      
    ),
           )
           ,
    )
    ,
    ),
    )
    ,
FFButtonWidget(
      
      onPressed:  () async {        final selectedMedia = await selectMediaWithSourceBottomSheet(context: context,
          
          
          
          
          allowPhoto: true,
          
          
          
              
    
    
  )
          ;
    if (selectedMedia != null &&
        selectedMedia.every(
            (m) => validateFileFormat(m.storagePath, context))) {
      setState(() => _model.isDataUploading = true);
      var selectedUploadedFiles = <FFUploadedFile>[];
      
      var downloadUrls = <String>[];
      try {
        showUploadMessage(context, 'Uploading file...', showLoading: true,);
        selectedUploadedFiles = selectedMedia.map(
    (m) => FFUploadedFile(
      name: m.storagePath.split('/').last,
      bytes: m.bytes,
      height: m.dimensions?.height,
      width: m.dimensions?.width,
      blurHash: m.blurHash,
    )
  ).toList();
  
        downloadUrls =     (await Future.wait(selectedMedia.map(
            (m) async => await uploadData(m.storagePath, m.bytes),),))
            .where((u) => u != null)
            .map((u) => u!)
            .toList();
  
      } finally {
        ScaffoldMessenger.of(context).hideCurrentSnackBar();
        _model.isDataUploading = false;
      }
      if (selectedUploadedFiles.length == selectedMedia.length&& downloadUrls.length == selectedMedia.length) {
        setState(() {
          _model.uploadedLocalFile = selectedUploadedFiles.first;
          _model.uploadedFileUrl = downloadUrls.first;
        });
        showUploadMessage(context, 'Success!');
      } else {
        setState(() {});showUploadMessage(context, 'Failed to upload data');
        return;
      }
    }
  },
      text: 'Add Image'  ,
      
      options: FFButtonOptions(
        
        height: 40.0  ,
        padding: const EdgeInsetsDirectional.fromSTEB(
       24.0,
       0.0,
       24.0,
       0.0
  ),
        iconPadding: const EdgeInsetsDirectional.fromSTEB(
       0.0,
       0.0,
       0.0,
       0.0
  ),
        color: FlutterFlowTheme.of(context).primary  ,
        textStyle: FlutterFlowTheme.of(context).titleSmall.override(    fontFamily: 'Readex Pro',
    color:  Colors.white  ,
    
    letterSpacing: 0.0,
    
    
    
    
    
  ),
        elevation: 3.0  ,
        borderSide: const BorderSide(
      color: Colors.transparent  ,
      width: 1.0  ,
    ),
        borderRadius: BorderRadius.circular( 8.0  ),
        
        
        
        
        
        
      ),
      
    ),
ClipRRect(
              
              borderRadius: BorderRadius.circular( 8.0),
              child: Image.network(      
       _model.uploadedFileUrl  ,
      width: 300.0  ,height: 200.0  ,
      fit: BoxFit.cover,
      
      
       
       
    ),
             ),].divide(const SizedBox(height: 12.0  )).addToEnd(const SizedBox(height: 32.0  )),
    ),
           )
           ,
    ),
    )
    ,],
    ),
      ),
    )
    ,
Container(
      
      
      constraints: const BoxConstraints( maxWidth: 770.0  ,),
      decoration: const BoxDecoration(
        
        
        
        
        
        
        
      ),
    
      
      child: Padding(
             padding: const EdgeInsetsDirectional.fromSTEB(
       16.0,
       12.0,
       16.0,
       12.0
  ),
            child: FFButtonWidget(
      
      onPressed:  () async {
        // Read user-entered address
        final address = _model.locationAddressController?.text;
        double? lat;
        double? lng;

        if (address != null && address.trim().isNotEmpty && googleMapsApiKey.isNotEmpty) {
          try {
            final url = Uri.parse('https://maps.googleapis.com/maps/api/geocode/json?address=${Uri.encodeComponent(address)}&key=$googleMapsApiKey');
            final resp = await http.get(url);
            if (resp.statusCode == 200) {
              final data = jsonDecode(resp.body);
              if (data['status'] == 'OK' && (data['results'] as List).isNotEmpty) {
                final loc = data['results'][0]['geometry']['location'];
                lat = (loc['lat'] as num).toDouble();
                lng = (loc['lng'] as num).toDouble();
              }
            }
          } catch (e) {
            // ignore geocoding errors; continue to save without coords
          }
        }

        unawaited(() async {
          await ToDoItemsRecord.collection.doc().set(
            createToDoItemsRecordData(
              title: _model.taskTextController.text,
              description: _model.descriptionTextController.text,
              dueDate: _model.datePicked,
              imageURL: _model.uploadedFileUrl,
              locationAddress: (address == null || address.trim().isEmpty) ? null : address.trim(),
              locationLat: lat,
              locationLng: lng,
            ),
          );
        }(),);

        context.pushNamed('ToDoList');
      },
      text: 'Add New ToDo Item'  ,
      
      options: FFButtonOptions(
        width: double.infinity  ,
        height: 48.0  ,
        padding: const EdgeInsetsDirectional.fromSTEB(
       24.0,
       0.0,
       24.0,
       0.0
  ),
        iconPadding: const EdgeInsetsDirectional.fromSTEB(
       0.0,
       0.0,
       0.0,
       0.0
  ),
        color: FlutterFlowTheme.of(context).primary  ,
        textStyle: FlutterFlowTheme.of(context).titleSmall.override(    fontFamily: 'Readex Pro',
    color:  Colors.white  ,
    
    letterSpacing: 0.0,
    
    
    
    
    
  ),
        elevation: 3.0  ,
        borderSide: const BorderSide(
      color: Colors.transparent  ,
      width: 1.0  ,
    ),
        borderRadius: BorderRadius.circular( 8.0  ),
        
        
        
        
        
        
      ),
      
    ),
           )
           ,
    ),],
    ),
    ),
      ),
    ),
)
;
  }

  
}
