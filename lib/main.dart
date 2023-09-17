import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  HomePage({super.key});

  var images = [
    'https://cdn.pixabay.com/photo/2022/11/19/14/42/e-learning-7602244_1280.jpg',
    'https://cdn.pixabay.com/photo/2014/06/29/07/49/possible-379215_1280.jpg',
    'https://cdn.pixabay.com/photo/2015/11/15/07/47/geometry-1044090_1280.jpg',
    'https://cdn.pixabay.com/photo/2018/03/21/07/16/learning-3245793_1280.jpg',
    'https://cdn.pixabay.com/photo/2017/03/21/11/27/board-2161880_1280.jpg',
    'https://cdn.pixabay.com/photo/2016/06/13/07/59/pi-1453836_1280.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Photo Gallery'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Welcome to My Photo Gallery!',
                style: TextStyle(fontSize: 22.0),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Search for photos'),
              ),
            ),
            SizedBox(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: images.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 30,
                    crossAxisSpacing: 30,
                  ),
                  itemBuilder: (context, index) {
                    return GridTile(
                      footer: Container(
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Center(
                            child: Text(
                              'Photo $index',
                              style: const TextStyle(fontSize: 20),
                            ),
                          ),
                        ),
                      ),
                      child: GestureDetector(
                        onTap: () {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text('Image $index clicked!'),
                          ));
                        },
                        child: Container(
                          height: 150,
                          color: Colors.grey,
                          child: Image.network(
                            images[index],
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            SizedBox(
              child: ListView.builder(
                itemCount: 3,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) => ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(images[index]),
                  ),
                  title: Text('Photo ${index + 1}'),
                  subtitle: Text('Description of photo ${index + 1}'),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            FloatingActionButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text('Photos Uploded Successfully!')));
              },
              child: const Icon(Icons.upload),
            )
          ],
        ),
      ),
    );
  }
}
