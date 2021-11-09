import 'package:flutter/material.dart';
import 'package:flutter_zodiac/burc_detay.dart';
import 'package:flutter_zodiac/model/burc.dart';

class BurcItem extends StatelessWidget {
  final Burc
      listelenenBurc; //Burc diye bir sınıf tanımlamıştık model içinde.  şimdi Burc sınıfı türünde lestenenBurc değişkenini oluşturduk.

  // listelenenBurc değişkeni Burc class türünde olduğundan, Burc içindeki verilere ulaşıcaz bununla.
  const BurcItem({required this.listelenenBurc, Key? key})
      : super(key: key); //mutlaka isteyecek listelenenBurc  değişkenini

  @override
  Widget build(BuildContext context) {
    var myTextStyle = Theme.of(context)
        .textTheme; //bu genel ifadeyi myTextStyle değişkenine tanımladık
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Card(
        elevation: 4, //card ın gölgeliği
        child: ListTile(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => BurcDetay(secilenBurc: listelenenBurc)));
          },
          leading: Image.asset(
            "images/" + listelenenBurc.burcKucukResim,
          ), //çok basit şekilde ulaştık. Burc modeli ile.
          title: Text(
            listelenenBurc.burcAdi,
            style: myTextStyle.headline5, //burda da style kullandık
          ),
          subtitle: Text(
            listelenenBurc.burcTarihi,
            style: myTextStyle.subtitle1,
          ),
          trailing: Icon(
            Icons.arrow_forward_ios,
            color: Colors.pink,
          ),
        ),
      ),
    );
  }
}
