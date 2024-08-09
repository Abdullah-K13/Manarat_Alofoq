import '/flutter_flow/flutter_flow_audio_player.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flip_card/flip_card.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'flipcard_travel_model.dart';
export 'flipcard_travel_model.dart';

class FlipcardTravelWidget extends StatefulWidget {
  const FlipcardTravelWidget({super.key});

  @override
  State<FlipcardTravelWidget> createState() => _FlipcardTravelWidgetState();
}

class _FlipcardTravelWidgetState extends State<FlipcardTravelWidget> {
  late FlipcardTravelModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FlipcardTravelModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 60.0,
            icon: Icon(
              Icons.arrow_back_rounded,
              color: FlutterFlowTheme.of(context).primaryText,
              size: 30.0,
            ),
            onPressed: () async {
              context.pop();
            },
          ),
          title: Text(
            'TRAVEL',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Outfit',
                  color: FlutterFlowTheme.of(context).primaryText,
                  fontSize: 36.0,
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.w600,
                ),
          ),
          actions: [],
          centerTitle: true,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: Container(
                    width: 600.0,
                    height: 600.0,
                    child: CarouselSlider(
                      items: [
                        Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: FlipCard(
                                    fill: Fill.fillBack,
                                    direction: FlipDirection.HORIZONTAL,
                                    speed: 400,
                                    front: Align(
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: Container(
                                        width: 300.0,
                                        height: 500.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(12.0),
                                            bottomRight: Radius.circular(12.0),
                                            topLeft: Radius.circular(12.0),
                                            topRight: Radius.circular(12.0),
                                          ),
                                        ),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          child: Image.asset(
                                            'assets/images/5.1b_Car.JPG',
                                            width: 300.0,
                                            height: 200.0,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                    back: Container(
                                      width: 300.0,
                                      height: 500.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(12.0),
                                          bottomRight: Radius.circular(12.0),
                                          topLeft: Radius.circular(12.0),
                                          topRight: Radius.circular(12.0),
                                        ),
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            child: Image.asset(
                                              'assets/images/5.1a_Car.JPG',
                                              width: 300.0,
                                              height: 220.0,
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                          FlutterFlowAudioPlayer(
                                            audio: Audio(
                                              'assets/audios/5.1c_car.mp3',
                                              metas: Metas(
                                                id: '5.1c_car.mp3-487fe5b7',
                                                title: 'Sayaa-ra',
                                              ),
                                            ),
                                            titleTextStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleLarge
                                                    .override(
                                                      fontFamily: 'Outfit',
                                                      letterSpacing: 0.0,
                                                    ),
                                            playbackDurationTextStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .override(
                                                      fontFamily: 'Readex Pro',
                                                      letterSpacing: 0.0,
                                                    ),
                                            fillColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondaryBackground,
                                            playbackButtonColor:
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                            activeTrackColor:
                                                FlutterFlowTheme.of(context)
                                                    .alternate,
                                            elevation: 4.0,
                                            playInBackground: PlayInBackground
                                                .disabledRestoreOnForeground,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: FlipCard(
                            fill: Fill.fillBack,
                            direction: FlipDirection.HORIZONTAL,
                            speed: 400,
                            front: Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: Container(
                                width: 300.0,
                                height: 500.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(12.0),
                                    bottomRight: Radius.circular(12.0),
                                    topLeft: Radius.circular(12.0),
                                    topRight: Radius.circular(12.0),
                                  ),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: Image.asset(
                                    'assets/images/5.2b_Bike.JPG',
                                    width: 300.0,
                                    height: 200.0,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            back: Container(
                              width: 300.0,
                              height: 500.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(12.0),
                                  bottomRight: Radius.circular(12.0),
                                  topLeft: Radius.circular(12.0),
                                  topRight: Radius.circular(12.0),
                                ),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(8.0),
                                    child: Image.asset(
                                      'assets/images/5.2a_Bike.JPG',
                                      width: 300.0,
                                      height: 220.0,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  FlutterFlowAudioPlayer(
                                    audio: Audio(
                                      'assets/audios/5.2c_bike.mp3',
                                      metas: Metas(
                                        id: '5.2c_bike.mp3-ebf1f4d5',
                                        title: 'Daraa-jat hawa-yiya',
                                      ),
                                    ),
                                    titleTextStyle: FlutterFlowTheme.of(context)
                                        .titleLarge
                                        .override(
                                          fontFamily: 'Outfit',
                                          letterSpacing: 0.0,
                                        ),
                                    playbackDurationTextStyle:
                                        FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              letterSpacing: 0.0,
                                            ),
                                    fillColor: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    playbackButtonColor:
                                        FlutterFlowTheme.of(context).primary,
                                    activeTrackColor:
                                        FlutterFlowTheme.of(context).alternate,
                                    elevation: 4.0,
                                    playInBackground: PlayInBackground
                                        .disabledRestoreOnForeground,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: FlipCard(
                            fill: Fill.fillBack,
                            direction: FlipDirection.HORIZONTAL,
                            speed: 400,
                            front: Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: Container(
                                width: 300.0,
                                height: 500.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(12.0),
                                    bottomRight: Radius.circular(12.0),
                                    topLeft: Radius.circular(12.0),
                                    topRight: Radius.circular(12.0),
                                  ),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: Image.asset(
                                    'assets/images/5.3b_Lorry.JPG',
                                    width: 300.0,
                                    height: 200.0,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                            ),
                            back: Container(
                              width: 300.0,
                              height: 500.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(12.0),
                                  bottomRight: Radius.circular(12.0),
                                  topLeft: Radius.circular(12.0),
                                  topRight: Radius.circular(12.0),
                                ),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(8.0),
                                    child: Image.asset(
                                      'assets/images/5.3a_Lorry.JPG',
                                      width: 300.0,
                                      height: 220.0,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  FlutterFlowAudioPlayer(
                                    audio: Audio(
                                      'assets/audios/5.3_lorry.mp3',
                                      metas: Metas(
                                        id: '5.3_lorry.mp3-502b69d7',
                                        title: 'Shah-ina',
                                      ),
                                    ),
                                    titleTextStyle: FlutterFlowTheme.of(context)
                                        .titleLarge
                                        .override(
                                          fontFamily: 'Outfit',
                                          letterSpacing: 0.0,
                                        ),
                                    playbackDurationTextStyle:
                                        FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              letterSpacing: 0.0,
                                            ),
                                    fillColor: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    playbackButtonColor:
                                        FlutterFlowTheme.of(context).primary,
                                    activeTrackColor:
                                        FlutterFlowTheme.of(context).alternate,
                                    elevation: 4.0,
                                    playInBackground: PlayInBackground
                                        .disabledRestoreOnForeground,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: FlipCard(
                            fill: Fill.fillBack,
                            direction: FlipDirection.HORIZONTAL,
                            speed: 400,
                            front: Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: Container(
                                width: 300.0,
                                height: 500.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(12.0),
                                    bottomRight: Radius.circular(12.0),
                                    topLeft: Radius.circular(12.0),
                                    topRight: Radius.circular(12.0),
                                  ),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: Image.asset(
                                    'assets/images/5.4b_Plane.JPG',
                                    width: 300.0,
                                    height: 200.0,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                            ),
                            back: Container(
                              width: 300.0,
                              height: 5100.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(12.0),
                                  bottomRight: Radius.circular(12.0),
                                  topLeft: Radius.circular(12.0),
                                  topRight: Radius.circular(12.0),
                                ),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(8.0),
                                    child: Image.asset(
                                      'assets/images/5.4a_Plane.JPG',
                                      width: 300.0,
                                      height: 220.0,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  FlutterFlowAudioPlayer(
                                    audio: Audio(
                                      'assets/audios/5.3_plane.mp3',
                                      metas: Metas(
                                        id: '5.3_plane.mp3-8e761e22',
                                        title: 'Ta-yira',
                                      ),
                                    ),
                                    titleTextStyle: FlutterFlowTheme.of(context)
                                        .titleLarge
                                        .override(
                                          fontFamily: 'Outfit',
                                          letterSpacing: 0.0,
                                        ),
                                    playbackDurationTextStyle:
                                        FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              letterSpacing: 0.0,
                                            ),
                                    fillColor: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    playbackButtonColor:
                                        FlutterFlowTheme.of(context).primary,
                                    activeTrackColor:
                                        FlutterFlowTheme.of(context).alternate,
                                    elevation: 4.0,
                                    playInBackground: PlayInBackground
                                        .disabledRestoreOnForeground,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: FlipCard(
                            fill: Fill.fillBack,
                            direction: FlipDirection.HORIZONTAL,
                            speed: 400,
                            front: Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: Container(
                                width: 300.0,
                                height: 500.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(12.0),
                                    bottomRight: Radius.circular(12.0),
                                    topLeft: Radius.circular(12.0),
                                    topRight: Radius.circular(12.0),
                                  ),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: Image.asset(
                                    'assets/images/5.5b_Ship.JPG',
                                    width: 300.0,
                                    height: 200.0,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                            ),
                            back: Container(
                              width: 300.0,
                              height: 500.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(12.0),
                                  bottomRight: Radius.circular(12.0),
                                  topLeft: Radius.circular(12.0),
                                  topRight: Radius.circular(12.0),
                                ),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(8.0),
                                    child: Image.asset(
                                      'assets/images/5.5a_Ship.JPG',
                                      width: 300.0,
                                      height: 220.0,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  FlutterFlowAudioPlayer(
                                    audio: Audio(
                                      'assets/audios/5.5_ship.mp3',
                                      metas: Metas(
                                        id: '5.5_ship.mp3-e5aea666',
                                        title: 'Safina',
                                      ),
                                    ),
                                    titleTextStyle: FlutterFlowTheme.of(context)
                                        .titleLarge
                                        .override(
                                          fontFamily: 'Outfit',
                                          letterSpacing: 0.0,
                                        ),
                                    playbackDurationTextStyle:
                                        FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              letterSpacing: 0.0,
                                            ),
                                    fillColor: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    playbackButtonColor:
                                        FlutterFlowTheme.of(context).primary,
                                    activeTrackColor:
                                        FlutterFlowTheme.of(context).alternate,
                                    elevation: 4.0,
                                    playInBackground: PlayInBackground
                                        .disabledRestoreOnForeground,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                      carouselController: _model.carouselController ??=
                          CarouselController(),
                      options: CarouselOptions(
                        initialPage: 1,
                        viewportFraction: 0.5,
                        disableCenter: true,
                        enlargeCenterPage: true,
                        enlargeFactor: 0.25,
                        enableInfiniteScroll: true,
                        scrollDirection: Axis.vertical,
                        autoPlay: false,
                        onPageChanged: (index, _) =>
                            _model.carouselCurrentIndex = index,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
