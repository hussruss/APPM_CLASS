import 'package:flutter/material.dart';
import 'package:m1_s4/services/api_service.dart';

class HttpPage extends StatefulWidget {
  @override
  _HttpPageState createState() => _HttpPageState();
}

class _HttpPageState extends State<HttpPage> {
  late Future<List<dynamic>> _list;

  @override
  void initState() {
    super.initState();
    _list = ApiService().fetchPost();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HTTP Example'),
      ),
      body: Center(
        child: FutureBuilder(
            future: _list,
            builder: (context, data) {
              if (data.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              } else if (data.hasError) {
                return Text('Error');
              } else {
                return ListView.builder(
                  itemCount: data.data!.length,
                  itemBuilder: (context, index) {
                    final post = data.data![index];
                    return ListTile(
                      title: Text(post['title']),
                      subtitle: Text(post['body']),
                    );
                  },
                );
              }
            }),
      ),
    );
  }
}
