import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HesapMakinesiButtonu extends StatelessWidget {
  // button taslak parametreleri
  final String metin;
  final int dolguRengi;
  final int metinRengi;
  final double metinBoyutu;
  final Function tiklama;

  const HesapMakinesiButtonu(
      {required this.metin,
      required this.dolguRengi,
      required this.metinRengi,
      required this.metinBoyutu,
      required this.tiklama});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(4.0),
        child: Column(
          children: [
            SizedBox(
              width: 80,
              height: 80,
              child: ElevatedButton(
                onPressed: () {
                  tiklama(metin);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(dolguRengi), // Metin rengi
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15), // Kenar yuvarlama
                  ),
                ),
                child: Text(metin,
                    style: GoogleFonts.rubik(
                        textStyle: TextStyle(
                      fontSize: metinBoyutu,
                      backgroundColor: Color(metinRengi),
                    ))),
              ),
            ),
          ],
        ));
  }
}
