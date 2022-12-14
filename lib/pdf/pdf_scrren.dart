import 'dart:math';

import 'package:flutter/material.dart';
import 'package:scipro/pdf/pdf_api.dart';
import 'package:scipro/pdf/pdf_invoice_api.dart';
import 'package:scipro/pdf/widget/button_widget.dart';
import 'package:scipro/pdf/widget/title_widget.dart';

import '../main.dart';
import 'model/customer.dart';
import 'model/invoice.dart';
import 'model/supplier.dart';

class PdfPage extends StatefulWidget {
    String listID = "";
 creatNewMeeting() async {
    var random = Random();
    String roomName = (random.nextInt(10000000) + 10000000).toString();
    // _jitsiMeetMethods.createMeeting(roomName: roomName, isAudioMuted: true, isVideoMuted: true);
    listID = roomName;
  }
  @override
  _PdfPageState createState() => _PdfPageState();
}

class _PdfPageState extends State<PdfPage> {
  @override
  Widget build(BuildContext context) => Scaffold(
    
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: Text('Invoice'),
          centerTitle: true,
        ),
        body: Container(
          padding: EdgeInsets.all(32),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TitleWidget(
                  icon: Icons.picture_as_pdf,
                  text: 'Generate Invoice',
                ),
                const SizedBox(height: 48),
                ButtonWidget(
                  text: 'Invoice PDF',
                  onClicked: () async {
                    final date = DateTime.now();
                    final dueDate = date.add(Duration(days: 7));

                    final invoice = Invoice(
                      supplier: Supplier(
                        name: 'Sci Pro',
                        address: 'VECTORWIND-TECH SYSTEMS PVT LTD.\nDoor N0: 4/461, Valamkottil towers,\nKakkanad, Kochi',
                        paymentInfo: 'https://paypal.me/sarahfieldzz',
                      ),
                      customer: Customer(
                        name: 'Apple Inc.',
                        address: 'Apple Street, Cupertino, CA 95014',
                      ),
                      info: InvoiceInfo(
                        date: date,
                        dueDate: dueDate,
                        description: 'My description...',
                        number: '${DateTime.now().year}-${widget.listID}',
                      ),
                      items: [
                        InvoiceItem(
                          description: 'Coffee',
                          date: DateTime.now(),
                          quantity: 1,
                          vat: 0,
                          unitPrice:0.0 ,
                        ),
                      
                      ],
                    );

                    final pdfFile = await PdfInvoiceApi.generate(invoice);

                    PdfApi.openFile(pdfFile);
                  },
                ),
              ],
            ),
          ),
        ),
      );
}
