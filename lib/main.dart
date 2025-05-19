import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class Produto {
  final String nome;
  final double preco;
  final String imagemUrl;

  Produto(this.nome, this.preco, this.imagemUrl);
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Produto> produtos = [
    Produto("Red Dead Redemption 2", 179.90, "https://cdn1.epicgames.com/b30b6d1b4dfd4dcc93b5490be5e094e5/offer/RDR2476298253_Epic_Games_Wishlist_RDR2_2560x1440_V01-2560x1440-2a9ebe1f7ee202102555be202d5632ec.jpg"),
    Produto("Forza Horizon 5", 229.90, "https://shared.fastly.steamstatic.com/store_item_assets/steam/apps/1551360/d466b468fb5d5c7efe08507852eb3c0b40707aec/header_alt_assets_2.jpg?t=1745496023"),
    Produto("Grand Theft Auto V", 79.90, "https://shared.fastly.steamstatic.com/store_item_assets/steam/apps/3240220/header.jpg?t=1741381848"),
    Produto("NBA 2K25", 129.90, "https://images.ctfassets.net/wn7ipiv9ue5v/2o2zzN8bdBFi6BwGFJR1lK/fab7d2a0fa20e7a8ec13c6400bd21422/N25-BASE-STANDARD_EDITION_ANNOUNCE-NA-STATIC-ESRB-AGN-1920x1080.jpg?w=&h=630&fm=&q="),
    Produto("Call of Duty®: Black Ops 6", 289.90, "https://assets.nuuvem.com/image/upload/t_product_sharing_banner/v1/products/6543ff19f6edbe0018707109/sharing_images/hwncoz2ifm9bneqsgx8i.jpg"),
    Produto("EA SPORTS FC™ 25", 199.90, "https://i.ytimg.com/vi/QrID0EA3hhI/maxresdefault.jpg"),
  ];

  double total = 0;

  void adicionar(double preco) {
    setState(() {
      total += preco;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Row(
          children: [
            const Icon(
              Icons.shopping_cart,
              color: Colors.white,
              size: 30,
              ), 
              const SizedBox(
                width: 20
              ),
            Text("Carrinho de Compras"),
          ],
        )),
        body: Column(
          children: [
            Expanded(
              child: GridView.builder(
                padding: EdgeInsets.all(8),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.75,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                ),
                itemCount: produtos.length,
                itemBuilder: (context, index) {
                  final p = produtos[index];
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: EdgeInsets.all(8),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.network(p.imagemUrl, height: 100),
                        Text(p.nome, style: TextStyle(fontWeight: FontWeight.bold)),
                        Text('R\$ ${p.preco.toStringAsFixed(2)}'),
                        ElevatedButton(
                          onPressed: () => adicionar(p.preco),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(
                              Icons.add,
                              color: Colors.white,
                              size: 30,
                              ), 

                              Text("Adicionar"),
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
            Container(
              color: Colors.blue,
              padding: EdgeInsets.all(16),
              width: double.infinity,
              child: Text(
                "Total: R\$ ${total.toStringAsFixed(2)}",
                style: TextStyle(fontSize: 18, color: Colors.white),
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
      ),
    );
  }
}
