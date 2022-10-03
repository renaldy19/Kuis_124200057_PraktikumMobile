
import 'package:flutter/material.dart';
import 'detail_buku.dart';
import 'books_data.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cari Buku Yang Diinginkan')
      ),
      body:GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
          itemBuilder: (context,index) {
            final BooksData book = booksData[index];
                return InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => DetailBuku(book: book)));
                  },
                  child: Card(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.network(book.imageLinks,width: 200,height: 300,),

                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(book.id,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                              Text(book.title,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                            ],
                          )
                        ),
                      ],
                    )
                  ),
                );
          },
        itemCount: booksData.length,
      ),
    );
  }
}
