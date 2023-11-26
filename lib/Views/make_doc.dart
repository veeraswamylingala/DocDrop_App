import 'dart:io';

import 'package:document_scanner_flutter/configs/configs.dart';
import 'package:document_scanner_flutter/document_scanner_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';

class MakeDoc extends StatefulWidget {
  const MakeDoc({super.key});

  @override
  State<MakeDoc> createState() => _MakeDocState();
}

class _MakeDocState extends State<MakeDoc> {
  String? _scannedDocumentPath;
  File? _scannedDocumentFile;
  File? _scannedImage;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Doc Scanner"),
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (_scannedDocumentPath != null || _scannedImage != null) ...[
              if (_scannedImage != null)
                Image.file(_scannedImage!,
                    width: 300, height: 300, fit: BoxFit.contain),
              if (_scannedDocumentPath != null)
                Expanded(
                    child: Container(
                  color: Colors.green,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: PDFView(
                      filePath: _scannedDocumentPath!,
                      enableSwipe: true,
                      swipeHorizontal: true,
                      autoSpacing: false,
                      pageFling: false,
                    ),
                  ),
                )),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                    _scannedDocumentFile?.path ?? _scannedImage?.path ?? ''),
              ),
            ],
            TextButton(
                onPressed: () async {
                  var image = await DocumentScannerFlutter.launch(context,
                      //source: ScannerFileSource.CAMERA,
                      labelsConfig: {
                        ScannerLabelsConfig.ANDROID_NEXT_BUTTON_LABEL:
                            "Next Step",
                        ScannerLabelsConfig.ANDROID_OK_LABEL: "OK"
                      });
                  if (image != null) {
                    _scannedImage = image;
                    setState(() {});
                  }
                },
                child: const Text("Scan Image")),
            TextButton(
                onPressed: () async {
                  var doc = await DocumentScannerFlutter.launchForPdf(
                    context,
                    labelsConfig: {
                      ScannerLabelsConfig.ANDROID_NEXT_BUTTON_LABEL:
                          "Next Steps",
                      ScannerLabelsConfig.PDF_GALLERY_FILLED_TITLE_SINGLE:
                          "Only 1 Page",
                      ScannerLabelsConfig.PDF_GALLERY_FILLED_TITLE_MULTIPLE:
                          "Only {PAGES_COUNT} Page"
                    },
                    //source: ScannerFileSource.CAMERA
                  );
                  if (doc != null) {
                    _scannedDocumentPath = null;
                    setState(() {});
                    await Future.delayed(const Duration(milliseconds: 100));
                    _scannedDocumentFile = doc;
                    _scannedDocumentPath = doc.path;
                    setState(() {});
                  }
                },
                child: const Text("Export PDF")),
          ],
        ),
      ),
    );
  }
}
