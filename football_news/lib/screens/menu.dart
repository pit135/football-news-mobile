import 'package:flutter/material.dart';
import 'package:football_news/widgets/left_drawer.dart';
import 'package:football_news/screens/newslist_form.dart'; // Import halaman form

// itemHomepage: model data untuk tombol grid
class ItemHomepage {
  final String name;
  final IconData icon;

  ItemHomepage(this.name, this.icon);
}

class InfoCard extends StatelessWidget {
  final String title;
  final String content;

  const InfoCard({
    super.key,
    required this.title,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 18.0, horizontal: 20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              content,
              style: const TextStyle(
                fontSize: 16.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ItemCard extends StatelessWidget {
  final ItemHomepage item;

  const ItemCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).colorScheme.primary,
      borderRadius: BorderRadius.circular(24),
      child: InkWell(
        onTap: () {
          if (item.name == "Add News") {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const NewsFormPage(),
              ),
            );
          } else if (item.name == "See Football News") {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Fitur lihat berita belum dibuat.")),
            );
          } else if (item.name == "Logout") {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Logout berhasil (contoh).")),
            );
          }
        },
        borderRadius: BorderRadius.circular(24),
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  item.icon,
                  color: Colors.white,
                  size: 36.0,
                ),
                const SizedBox(height: 12),
                Text(
                  item.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});

  final String npm = "2406275678";
  final String nama = "Lionel Messi";
  final String kelas = "B";

  final List<ItemHomepage> items = [
    ItemHomepage("See Football News", Icons.newspaper),
    ItemHomepage("Add News", Icons.add),
    ItemHomepage("Logout", Icons.logout),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Judul aplikasi "Football News" dengan teks putih dan tebal

        title: const Text(
          'Football News',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        // Warna latar belakang AppBar diambil dari skema warna tema aplikasi.
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      drawer: const LeftDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: InfoCard(title: 'NPM', content: npm),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: InfoCard(title: 'Name', content: nama),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: InfoCard(title: 'Class', content: kelas),
                ),
              ],
            ),

            const SizedBox(height: 32.0),

            const Text(
              'Selamat datang di Football News',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22.0,
              ),
            ),

            const SizedBox(height: 24.0),

            GridView.count(
              primary: false,
              padding: const EdgeInsets.symmetric(horizontal: 8),
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              crossAxisCount: 3,
              shrinkWrap: true,
              children: items
                  .map(
                    (ItemHomepage item) => ItemCard(item: item),
                  )
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
