import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hesapmakinesi61/widgets/butontasarimi.dart';

void main() {
  runApp(HesapMakinesi());
}

class HesapMakinesi extends StatefulWidget {
  const HesapMakinesi({super.key});

  @override
  State<HesapMakinesi> createState() => _HesapMakinesiState();
}

class _HesapMakinesiState extends State<HesapMakinesi> {
  //tutucular
  late int sayi1;
  late int sayi2;
  String gosterilecekSayi = "";
  String islemGecmisi = "";
  late String sonuc;
  late String islemTutucu;

  //buttontıklama
  void btnTiklama(String buttonDegeriTutucu) {
    print("buttonDegeriTutucu");

    if (buttonDegeriTutucu == "AC") {
      // hepsini sil
      gosterilecekSayi = "";
      sonuc = "";
      sayi1 = 0;
      sayi2 = 0;
      islemGecmisi = "";
      islemTutucu = "";
    } else if (buttonDegeriTutucu == "C") {
      //işlem geçmişi hariç yerleri sil
      gosterilecekSayi = "";
      sonuc = "";
      sayi1 = 0;
      sayi2 = 0;
    } else if (buttonDegeriTutucu == "Back") {
      //sondan başlayıp silmeye devam et
      sonuc = gosterilecekSayi.substring(0, gosterilecekSayi.length - 1);
    } else if (buttonDegeriTutucu == "/") {
      //gösterilen sayıyı sayı 1 e aktar ,sonucu temizle ve / işlemini tutucuda sakla
      sayi1 = int.parse(gosterilecekSayi);
      sonuc = "";
      islemTutucu = buttonDegeriTutucu;
    } else if (buttonDegeriTutucu == "X") {
      //gösterilen sayıyı sayı 1 e aktar ,sonucu temizle ve x işlemini tutucuda sakla
      sayi1 = int.parse(gosterilecekSayi);
      sonuc = "";
      islemTutucu = buttonDegeriTutucu;
    } else if (buttonDegeriTutucu == "+") {
      //gösterilen sayıyı sayı 1 e aktar ,sonucu temizle ve + işlemini tutucuda sakla
      sayi1 = int.parse(gosterilecekSayi);
      sonuc = "";
      islemTutucu = buttonDegeriTutucu;
    } else if (buttonDegeriTutucu == "-") {
      //gösterilen sayıyı sayı 1 e aktar ,sonucu temizle ve - işlemini tutucuda sakla

      sayi1 = int.parse(gosterilecekSayi);
      sonuc = "";
      islemTutucu = buttonDegeriTutucu;
    } else if (buttonDegeriTutucu == "+/-") {
      //pozitifse negatif yapsın negatifse pozitif yapsın
      if (gosterilecekSayi[0] != "-") {
        //başında eksi yoksa ekle
        sonuc = "-" + gosterilecekSayi;
      } else {
        sonuc = gosterilecekSayi.substring(1);
      }
    } else if (buttonDegeriTutucu == "=") {
      //sayı 2 yi ata hangi işlemse yaptır
      sayi2 = int.parse(gosterilecekSayi);

      if (islemTutucu == "+") {
        //toplama yaptır
        sonuc = (sayi1 + sayi2).toString();
        islemGecmisi =
            sayi1.toString() + islemTutucu.toString() + sayi2.toString();
      } else if (islemTutucu == "-") {
        //çıkarma yaptır
        sonuc = (sayi1 - sayi2).toString();
        islemGecmisi =
            sayi1.toString() + islemTutucu.toString() + sayi2.toString();
      } else if (islemTutucu == "X") {
        //çarpma
        sonuc = (sayi1 * sayi2).toString();
        islemGecmisi =
            sayi1.toString() + islemTutucu.toString() + sayi2.toString();
      } else if (islemTutucu == "/") {
        //bölme yaptır
        sonuc = (sayi1 / sayi2).toString();
        islemGecmisi =
            sayi1.toString() + islemTutucu.toString() + sayi2.toString();
      }
    }
    //rakamlara tıklandığında
    else {
      sonuc = int.parse(gosterilecekSayi + buttonDegeriTutucu).toString();
    }

    //durum yenileme

    setState(() {
      gosterilecekSayi = sonuc;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme:
            ThemeData(appBarTheme: AppBarTheme(backgroundColor: Colors.blue)),
        home: Scaffold(
          appBar: AppBar(
            title: Text("Hesap Makinesi"),
            centerTitle: true,
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                alignment: Alignment(-1.0, -1.0),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 12, 8),
                  child: Text(
                    islemGecmisi,
                    style: GoogleFonts.rubik(
                      textStyle: TextStyle(
                        fontSize: 30,
                        color: Colors.black54,
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                alignment: Alignment(1.0, 1.0),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 12, 8),
                  child: Text(
                    gosterilecekSayi,
                    style: GoogleFonts.rubik(
                      textStyle: TextStyle(
                        fontSize: 40,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  HesapMakinesiButtonu(
                    metin: "AC",
                    dolguRengi: 0xFF9800FF,
                    metinRengi: 0x000000FF,
                    metinBoyutu: 24.0,
                    tiklama: btnTiklama,
                  ),
                  HesapMakinesiButtonu(
                    metin: "C",
                    dolguRengi: 0xFF9800FF,
                    metinRengi: 0x000000FF,
                    metinBoyutu: 24.0,
                    tiklama: btnTiklama,
                  ),
                  HesapMakinesiButtonu(
                    metin: "Back",
                    dolguRengi: 0xF44336FF,
                    metinRengi: 0x000000FF,
                    metinBoyutu: 13.0,
                    tiklama: btnTiklama,
                  ),
                  HesapMakinesiButtonu(
                    metin: "/",
                    dolguRengi: 0xF44336FF,
                    metinRengi: 0x000000FF,
                    metinBoyutu: 24.0,
                    tiklama: btnTiklama,
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  HesapMakinesiButtonu(
                    metin: "9",
                    dolguRengi: 0xFF9800FF,
                    metinRengi: 0x000000FF,
                    metinBoyutu: 35.0,
                    tiklama: btnTiklama,
                  ),
                  HesapMakinesiButtonu(
                    metin: "8",
                    dolguRengi: 0xFF9800FF,
                    metinRengi: 0x000000FF,
                    metinBoyutu: 35.0,
                    tiklama: btnTiklama,
                  ),
                  HesapMakinesiButtonu(
                    metin: "7",
                    dolguRengi: 0xFF9800FF,
                    metinRengi: 0x000000FF,
                    metinBoyutu: 35.0,
                    tiklama: btnTiklama,
                  ),
                  HesapMakinesiButtonu(
                    metin: "X",
                    dolguRengi: 0xF44336FF,
                    metinRengi: 0x000000FF,
                    metinBoyutu: 35.0,
                    tiklama: btnTiklama,
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  HesapMakinesiButtonu(
                    metin: "6",
                    dolguRengi: 0xFF9800FF,
                    metinRengi: 0x000000FF,
                    metinBoyutu: 35.0,
                    tiklama: btnTiklama,
                  ),
                  HesapMakinesiButtonu(
                    metin: "5",
                    dolguRengi: 0xFF9800FF,
                    metinRengi: 0x000000FF,
                    metinBoyutu: 35.0,
                    tiklama: btnTiklama,
                  ),
                  HesapMakinesiButtonu(
                    metin: "4",
                    dolguRengi: 0xFF9800FF,
                    metinRengi: 0x000000FF,
                    metinBoyutu: 35.0,
                    tiklama: btnTiklama,
                  ),
                  HesapMakinesiButtonu(
                    metin: "+",
                    dolguRengi: 0xF44336FF,
                    metinRengi: 0x000000FF,
                    metinBoyutu: 35.0,
                    tiklama: btnTiklama,
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  HesapMakinesiButtonu(
                    metin: "3",
                    dolguRengi: 0xFF9800FF,
                    metinRengi: 0x000000FF,
                    metinBoyutu: 35.0,
                    tiklama: btnTiklama,
                  ),
                  HesapMakinesiButtonu(
                    metin: "2",
                    dolguRengi: 0xFF9800FF,
                    metinRengi: 0x000000FF,
                    metinBoyutu: 35.0,
                    tiklama: btnTiklama,
                  ),
                  HesapMakinesiButtonu(
                    metin: "1",
                    dolguRengi: 0xFF9800FF,
                    metinRengi: 0x000000FF,
                    metinBoyutu: 35.0,
                    tiklama: btnTiklama,
                  ),
                  HesapMakinesiButtonu(
                    metin: "-",
                    dolguRengi: 0xF44336FF,
                    metinRengi: 0x000000FF,
                    metinBoyutu: 35.0,
                    tiklama: btnTiklama,
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  HesapMakinesiButtonu(
                    metin: "+/-",
                    dolguRengi: 0xFF9800FF,
                    metinRengi: 0x000000FF,
                    metinBoyutu: 15.0,
                    tiklama: btnTiklama,
                  ),
                  HesapMakinesiButtonu(
                    metin: "0",
                    dolguRengi: 0xFF9800FF,
                    metinRengi: 0x000000FF,
                    metinBoyutu: 35.0,
                    tiklama: btnTiklama,
                  ),
                  HesapMakinesiButtonu(
                    metin: "00",
                    dolguRengi: 0xF44336FF,
                    metinRengi: 0x000000FF,
                    metinBoyutu: 20.0,
                    tiklama: btnTiklama,
                  ),
                  HesapMakinesiButtonu(
                    metin: "=",
                    dolguRengi: 0xF44336FF,
                    metinRengi: 0x000000FF,
                    metinBoyutu: 35.0,
                    tiklama: btnTiklama,
                  )
                ],
              )
            ],
          ),
        ));
  }
}
