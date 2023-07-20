import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:printing/printing.dart';

class PdfPreviewPage extends StatelessWidget {
  final String? title;
  final Uint8List bytes;
  final PdfPageFormat? format;
  const PdfPreviewPage(
      {Key? key, this.title, required this.bytes, this.format,})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(
          '',
          maxLines: 2,
          style: const TextStyle(fontSize: 14),
        ),
       
      ),
      body: PdfPreview(
        canDebug: false,
        pdfFileName: '$title.pdf',
        build: (context) => bytes,
      ),
    );
  }
}