import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:pdfshow/pdfpreview.dart';
import 'metalListModel.dart';
import 'metalpdf.dart';

class ShowPdf extends StatefulWidget {
  const ShowPdf({super.key});

  @override
  State<ShowPdf> createState() => _ShowPdfState();
}

class _ShowPdfState extends State<ShowPdf> {
  List<MetalListModel> metalList = [
    MetalListModel('ABC', '1022030'),
    MetalListModel('DEF', '1022222'),
    MetalListModel('DEF', '1022222'),
    MetalListModel('DEF', '1022222'),
    MetalListModel('DEF', '1022222'),
    MetalListModel('DEF', '1022222'),
    MetalListModel('DEF', '1022222'),
  ];

    List<MetalListModel> closerList = [
    MetalListModel('ABC', '1022030'),
    MetalListModel('DEF', '1022222'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 5,
        backgroundColor: Colors.amber,
        title: Text('Show Pdf'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            
            //String dir = (await getExternalStorageDirectory())!.path;
            final bytes =  await metalPdf(PdfPageFormat.legal, '', metalList, closerList);
            // final file = File('$dir/thana_information.pdf');
            // await file.writeAsBytes(bytes);
            // if (!context.mounted) return;

            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => PdfPreviewPage(
                  bytes: bytes,
                ),
              ),
            );
          },
          child: Text('Show PDF'),
        ),
      ),
    );
  }
}
