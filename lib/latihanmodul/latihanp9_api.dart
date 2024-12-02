import 'package:flutter/material.dart';
import 'package:project_travel/models/makanan_model.dart';
import 'package:project_travel/services/makanan_service.dart';
import 'package:project_travel/widgets/makanan_cart.dart';

class Pertemuan9APIScreen extends StatelessWidget {
  final MakananService _makananService = MakananService();

  Pertemuan9APIScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Pertemuan 9 Latihan API',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      body: FutureBuilder<List<MakananModel>>(
        future: _makananService.fetchMakanan(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting){
            return Center(child: CircularProgressIndicator(),);
          } else if (snapshot.hasError){
            return Center(child: Text("Erorr: ${snapshot.error}"),);
          } else if (!snapshot.hasData || snapshot.data!.isEmpty ){
            return Center(child: Text("Tidak Ada Makanan Yang Tersedia!"),);
          }else{
            final makanan = snapshot.data!;
            return ListView.builder(itemBuilder: (context,index) {
              return MakananCard(makananModel: makanan[index]);
            });
          }
        },
      ),
    );
  }
}
