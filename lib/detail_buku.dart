import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'books_data.dart';

class DetailBuku extends StatefulWidget {
  final BooksData book;

  const DetailBuku ({Key? key, required this.book}) : super(key: key);

  @override
  State<DetailBuku> createState() => _DetailBukuState();
}

class _DetailBukuState extends State<DetailBuku> {
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Buku'),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            height: (MediaQuery
                .of(context)
                .size
                .height)/3,

            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemBuilder: (context,index)
      {
                return Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: Image.network(widget.book.imageLinks),
                );
              },
              itemCount: widget.book.imageLinks.length,
            ),
          ),
          Container(
            padding: EdgeInsets.all(12),
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                boldText(widget.book.title),
                SizedBox(height: 5,),
                mediumText(widget.book.id),
                SizedBox(height: 5,),
                mediumText(widget.book.publisher),
                SizedBox(height: 5,),
                mediumText(widget.book.publishedDate),
                SizedBox(height: 5,),
                mediumText(widget.book.description),
              ],
            ),
          ),
        ],
      ),
    );
  }
  Widget boldText(String text){
    return Text(
      text,
      style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600,color: Colors.red),
    );
  }
  Widget mediumText(String text){
    return Text(
      text,
      style: TextStyle(fontSize:15,color: Colors.black87),
      textAlign: TextAlign.center,

    );
  }
}
