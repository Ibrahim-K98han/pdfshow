// ignore_for_file: deprecated_member_use

import 'dart:typed_data';
import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdfshow/metalListModel.dart';

Future<Uint8List> metalPdf(
  PdfPageFormat pageFormat,
  String title,
  List<MetalListModel> metalList,
  List<MetalListModel> closerList,
) async {
  final doc = pw.Document(pageMode: PdfPageMode.outlines);

  //final ttf = pw.Font.ttf(font);
  doc.addPage(pw.MultiPage(
    pageFormat: PdfPageFormat.legal,
    footer: (context) {
      return pw.Container(
          
          alignment: pw.Alignment.centerRight,
          margin: const pw.EdgeInsets.only(top: 1.0 * PdfPageFormat.cm),
          child: pw.Column(children: [
            pw.Divider(),
            pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                children: [
                  pw.Text('Print Source',
                      style: pw.Theme.of(context)
                          .defaultTextStyle
                          .copyWith(color: PdfColors.grey)),
                  pw.Text(
                      'Page: ${context.pageNumber} of ${context.pagesCount}',
                      style: pw.Theme.of(context)
                          .defaultTextStyle
                          .copyWith(color: PdfColors.grey)),
                ])
          ]));
    },
    build: (context) => <pw.Widget>[
      pw.Column(children: [
        pw.Center(
          child: pw.Text(
            'Telecommunications Service Operations Management',
            textScaleFactor: 1,
            style: pw.TextStyle(
                fontSize: 18, fontWeight: pw.FontWeight.bold, lineSpacing: 2),
          ),
        ),
      ]),
      pw.Divider(),
      pw.SizedBox(height: 10),
      pw.Container(
        padding: pw.EdgeInsets.symmetric(vertical: 8),
        width: double.infinity,
        decoration: pw.BoxDecoration(
            color: PdfColor.fromHex('#E5E7E9'),
            border: pw.Border.all(color: PdfColor.fromHex('#000000'))),
        child: pw.Center(
          child: pw.Text(
            'Work Order Details',
            style: pw.TextStyle(
                fontSize: 13, fontWeight: pw.FontWeight.bold, lineSpacing: 2),
          ),
        ),
      ),
      metalList.isNotEmpty
          ? pw.Table.fromTextArray(
              // headerDecoration: const pw.BoxDecoration(
              //   color: PdfColor.fromInt(0xFFc7c7c7),
              //   //color: PdfColor.fromInt(0xFFc7c7c7),
              // ),
              headerAlignment: pw.Alignment.centerLeft,
              cellAlignment: pw.Alignment.centerLeft,
              cellStyle: pw.TextStyle(),
              data: <List<String>>[
                for (var i = 0; i < metalList.length; i++)
                  <String>[
                    metalList[i].title!,
                    metalList[i].value!,
                    metalList[i].title!,
                    metalList[i].value!,
                  ],
              ],
              columnWidths: {
                0: const pw.FlexColumnWidth(3),
                1: const pw.FlexColumnWidth(3),
                2: const pw.FlexColumnWidth(3),
                3: const pw.FlexColumnWidth(3),
              },
            )
          : pw.Center(child: pw.Text('No Data')),
      pw.SizedBox(height: 10),
      pw.Container(
        padding: pw.EdgeInsets.symmetric(vertical: 8),
        width: double.infinity,
        decoration: pw.BoxDecoration(
            color: PdfColor.fromHex('#E5E7E9'),
            border: pw.Border.all(color: PdfColor.fromHex('#000000'))),
        child: pw.Center(
          child: pw.Text(
            'Work Order Closer Form',
            style: pw.TextStyle(
                fontSize: 13, fontWeight: pw.FontWeight.bold, lineSpacing: 2),
          ),
        ),
      ),
      closerList.isNotEmpty
          ? pw.Table.fromTextArray(
              // headerDecoration: const pw.BoxDecoration(
              //   color: PdfColor.fromInt(0xFFc7c7c7),
              //   //color: PdfColor.fromInt(0xFFc7c7c7),
              // ),
              headerAlignment: pw.Alignment.centerLeft,
              cellAlignment: pw.Alignment.centerLeft,
              cellStyle: pw.TextStyle(),
              data: <List<String>>[
                ['WO Clauser Reson','','Remark','',],
                ['User Name','','User Mobile','',],
                // for (var i = 0; i < closerList.length; i++)
                //   <String>[
                    
                //     closerList[i].title!,
                //     closerList[i].value!,
                //     closerList[i].title!,
                //     closerList[i].value!,
                //   ],
              ],
              columnWidths: {
                0: const pw.FlexColumnWidth(3),
                1: const pw.FlexColumnWidth(3),
                2: const pw.FlexColumnWidth(3),
                3: const pw.FlexColumnWidth(3),
              },
            )
          : pw.Center(child: pw.Text('No Data')),
      pw.SizedBox(height: 10),
      pw.Container(
        padding: pw.EdgeInsets.symmetric(vertical: 8),
        width: double.infinity,
        decoration: pw.BoxDecoration(
            color: PdfColor.fromHex('#E5E7E9'),
            border: pw.Border.all(color: PdfColor.fromHex('#000000'))),
        child: pw.Center(
          child: pw.Text(
            'Work Order Query',
            style: pw.TextStyle(
                fontSize: 13, fontWeight: pw.FontWeight.bold, lineSpacing: 2),
          ),
        ),
      ),
      closerList.isNotEmpty
          ? pw.Table.fromTextArray(
              // headerDecoration: const pw.BoxDecoration(
              //   color: PdfColor.fromInt(0xFFc7c7c7),
              //   //color: PdfColor.fromInt(0xFFc7c7c7),
              // ),
              headerAlignment: pw.Alignment.centerLeft,
              cellAlignment: pw.Alignment.centerLeft,
              cellStyle: pw.TextStyle(),
              data: <List<String>>[
                ['Department Name','','User Name','',],
                ['User Mobile','','Remark','',],
                // for (var i = 0; i < closerList.length; i++)
                //   <String>[
                //     closerList[i].title!,
                //     closerList[i].value!,
                //     closerList[i].title!,
                //     closerList[i].value!,
                //   ],
              ],
              columnWidths: {
                0: const pw.FlexColumnWidth(3),
                1: const pw.FlexColumnWidth(3),
                2: const pw.FlexColumnWidth(3),
                3: const pw.FlexColumnWidth(3),
              },
            )
          : pw.Center(child: pw.Text('No Data')),
          pw.SizedBox(height: 10),
      pw.Container(
        padding: pw.EdgeInsets.symmetric(vertical: 8),
        width: double.infinity,
        decoration: pw.BoxDecoration(
            color: PdfColor.fromHex('#E5E7E9'),
            border: pw.Border.all(color: PdfColor.fromHex('#000000'))),
        child: pw.Center(
          child: pw.Text(
            'Start Trip',
            style: pw.TextStyle(
                fontSize: 13, fontWeight: pw.FontWeight.bold, lineSpacing: 2),
          ),
        ),
      ),
      closerList.isNotEmpty
          ? pw.Table.fromTextArray(
              // headerDecoration: const pw.BoxDecoration(
              //   color: PdfColor.fromInt(0xFFc7c7c7),
              //   //color: PdfColor.fromInt(0xFFc7c7c7),
              // ),
              headerAlignment: pw.Alignment.centerLeft,
              cellAlignment: pw.Alignment.centerLeft,
              cellStyle: pw.TextStyle(),
              data: <List<String>>[
                ['Enter Start Loaction','','ETA','',],
                // for (var i = 0; i < closerList.length; i++)
                //   <String>[
                //     closerList[i].title!,
                //     closerList[i].value!,
                //     closerList[i].title!,
                //     closerList[i].value!,
                //   ],
              ],
              columnWidths: {
                0: const pw.FlexColumnWidth(3),
                1: const pw.FlexColumnWidth(3),
                2: const pw.FlexColumnWidth(3),
                3: const pw.FlexColumnWidth(3),
              },
            )
          : pw.Center(child: pw.Text('No Data')),
           pw.SizedBox(height: 10),
      pw.Container(
        padding: pw.EdgeInsets.symmetric(vertical: 8),
        width: double.infinity,
        decoration: pw.BoxDecoration(
            color: PdfColor.fromHex('#E5E7E9'),
            border: pw.Border.all(color: PdfColor.fromHex('#000000'))),
        child: pw.Center(
          child: pw.Text(
            'End Trip',
            style: pw.TextStyle(
                fontSize: 13, fontWeight: pw.FontWeight.bold, lineSpacing: 2),
          ),
        ),
      ),
      closerList.isNotEmpty
          ? pw.Table.fromTextArray(
              // headerDecoration: const pw.BoxDecoration(
              //   color: PdfColor.fromInt(0xFFc7c7c7),
              //   //color: PdfColor.fromInt(0xFFc7c7c7),
              // ),
              headerAlignment: pw.Alignment.centerLeft,
              cellAlignment: pw.Alignment.centerLeft,
              cellStyle: pw.TextStyle(),
              data: <List<String>>[
                ['Enter End Loaction','','ETA','',],
                // for (var i = 0; i < closerList.length; i++)
                //   <String>[
                //     closerList[i].title!,
                //     closerList[i].value!,
                //     closerList[i].title!,
                //     closerList[i].value!,
                //   ],
              ],
              columnWidths: {
                0: const pw.FlexColumnWidth(3),
                1: const pw.FlexColumnWidth(3),
                2: const pw.FlexColumnWidth(3),
                3: const pw.FlexColumnWidth(3),
              },
            )
          : pw.Center(child: pw.Text('No Data')),
          pw.SizedBox(height: 10),
      pw.Container(
        padding: pw.EdgeInsets.symmetric(vertical: 8),
        width: double.infinity,
        decoration: pw.BoxDecoration(
            color: PdfColor.fromHex('#E5E7E9'),
            border: pw.Border.all(color: PdfColor.fromHex('#000000'))),
        child: pw.Center(
          child: pw.Text(
            'FORM',
            style: pw.TextStyle(
                fontSize: 13, fontWeight: pw.FontWeight.bold, lineSpacing: 2),
          ),
        ),
      ),
      closerList.isNotEmpty
          ? pw.Table.fromTextArray(
              // headerDecoration: const pw.BoxDecoration(
              //   color: PdfColor.fromInt(0xFFc7c7c7),
              //   //color: PdfColor.fromInt(0xFFc7c7c7),
              // ),
              headerAlignment: pw.Alignment.centerLeft,
              cellAlignment: pw.Alignment.centerLeft,
              cellStyle: pw.TextStyle(),
              data: <List<String>>[
                ['User Name','','User Mobile','',],
                ['Alarm Category','','Alarm Sub-category','',],
                ['Fault Reasulatino Time','','Domain','',],
                ['RCA Value Leve 1','','RCA Value Leve 2','',],
                ['Remark','','Quentity','',],
                // for (var i = 0; i < closerList.length; i++)
                //   <String>[
                //     closerList[i].title!,
                //     closerList[i].value!,
                //     closerList[i].title!,
                //     closerList[i].value!,
                //   ],
              ],
              columnWidths: {
                0: const pw.FlexColumnWidth(3),
                1: const pw.FlexColumnWidth(3),
                2: const pw.FlexColumnWidth(3),
                3: const pw.FlexColumnWidth(3),
              },
            )
          : pw.Center(child: pw.Text('No Data')),
    ],
  ));
  return await doc.save();
}
