import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hand_signature/signature.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:northern_border_university/controller/app_theme.dart';

HandSignatureControl control = HandSignatureControl(
  threshold: 0.01,
  smoothRatio: 0.65,
  velocityRange: 2.0,
);

class Signature extends StatefulWidget {
  @override
  State<Signature> createState() => _SignatureState();
}

class _SignatureState extends State<Signature> {
  @override
  void dispose() {
    super.dispose();
    control.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.background,
      body: Column(
        children: <Widget>[
          Expanded(
            child: Center(
              child: Stack(
                children: <Widget>[
                  Container(
                    constraints: BoxConstraints.expand(),
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    color: AppTheme.transparent,
                    child: HandSignature(
                      control: control,
                      type: SignatureDrawType.shape,
                    ),
                  ),
                  CustomPaint(
                    painter: DebugSignaturePainterCP(
                      control: control,
                      cp: false,
                      cpStart: false,
                      cpEnd: false,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              CupertinoButton(
                color: AppTheme.nearlyBlack,
                onPressed: () {
                  control.clear();
                },
                child: Text('Clear', style: TextStyle(letterSpacing: 1)),
              ),
              CupertinoButton(
                color: AppTheme.lightGreen,
                onPressed: () async {
                  ByteData? bytes =
                      await control.toImage(background: AppTheme.background);
                  final result = await ImageGallerySaver.saveImage(
                      bytes!.buffer.asUint8List(),
                      name: "Signature");
                },
                child: Text('SAVE', style: TextStyle(letterSpacing: 1)),
              ),
            ],
          ),
          SizedBox(
            height: 16.0,
          ),
        ],
      ),
    );
  }
}
