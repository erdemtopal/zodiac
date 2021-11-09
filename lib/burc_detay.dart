import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';
import 'model/burc.dart';

class BurcDetay extends StatefulWidget {
  final Burc secilenBurc; // Burc sınıfı veri türünde tanımladık.
  BurcDetay({required this.secilenBurc, Key? key}) : super(key: key);
  @override
  State<BurcDetay> createState() => _BurcDetayState();
}

class _BurcDetayState extends State<BurcDetay> {
  Color appBarRengi = Colors.pink; //Color türünde bir değişken tanımladık.
  late PaletteGenerator
      _generator; //late kelimesi ben seni initilaze edicem sonra, bana hata verme demek.

  @override //initState ekledik. init state hangi değişiklik olursa olsun. statefull wid.'da 1 kez çalışır.
  void initState() {
    super.initState();
    appBarRenginiBul();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 250, //açılan appbar yüksekliğ,
            pinned: true, //sabit kalması için
            backgroundColor: appBarRengi,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(widget.secilenBurc.burcAdi + " Burcu ve Özellikleri"),
              centerTitle: true,
              background: Image.asset(
                'images/' + widget.secilenBurc.burcBuyukResim,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: EdgeInsets.all(16),
              child: SingleChildScrollView(
                child: Text(
                  widget.secilenBurc.burcDetayi,
                  style: Theme.of(context).textTheme.subtitle1,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void appBarRenginiBul() async {
    //future yapmamız gerekiyor. uygulama açıldıktan sonra rengi bulacak. async ve await ile future yaptık.
    _generator = await PaletteGenerator.fromImageProvider(AssetImage('images/' +
        widget.secilenBurc
            .burcBuyukResim)); //widget ile statefull içindeki değişkene ulaştım.
    appBarRengi = _generator.dominantColor!.color;
    setState(() {});
  }
}
