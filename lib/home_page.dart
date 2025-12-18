import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    const InquiryPage(),
    const ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '询价',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: '我的',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }
}

class InquiryPage extends StatelessWidget {
  const InquiryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: const Text('询价', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            icon: Image.asset('assets/images/home/sort.png', width: 24, height: 24),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        children: [
          _buildSearch(),
          _buildIconGrid(),
          _buildHotSelling(),
          _buildProductList(),
        ],
      ),
    );
  }

  Widget _buildSearch() {
    return Container(
      padding: const EdgeInsets.fromLTRB(16.0, 0, 16.0, 16.0),
      color: Colors.white,
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: Row(
                children: [
                  Image.asset('assets/images/home/search.png', width: 20, height: 20),
                  const SizedBox(width: 8),
                  const Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: '请输入您要查询的型号',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 16.0),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            ),
            child: const Text('搜索', style: TextStyle(fontSize: 16)),
          ),
        ],
      ),
    );
  }

  Widget _buildIconGrid() {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      margin: const EdgeInsets.only(top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildIconGridItem(Icons.calculate_outlined, 'BOM配单', Colors.orange),
          _buildIconGridItem(Icons.history_outlined, '询价历史', Colors.blue),
          _buildIconGridItem(Icons.list_alt_outlined, '我的订单', Colors.green),
          _buildIconGridItem(Icons.headset_mic_outlined, '联系我们', Colors.purple),
        ],
      ),
    );
  }

  Widget _buildIconGridItem(IconData icon, String label, Color color) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            shape: BoxShape.circle,
          ),
          child: Icon(icon, size: 30.0, color: color),
        ),
        const SizedBox(height: 8.0),
        Text(label, style: const TextStyle(fontSize: 14)),
      ],
    );
  }

  Widget _buildHotSelling() {
    return Container(
      padding: const EdgeInsets.fromLTRB(16.0, 20.0, 16.0, 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text('热卖型号', style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
          Row(
            children: const [
              Text('更多', style: TextStyle(color: Colors.grey)),
              Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildProductList() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          _buildProductItem('assets/images/home/1.png', 'STM32F103C8T6', ['最小包装', '2000']),
          const Divider(height: 1, indent: 16, endIndent: 16),
          _buildProductItem('assets/images/home/3.png', 'STM32F103VET6', ['最小包装', '600']),
          const Divider(height: 1, indent: 16, endIndent: 16),
          _buildProductItem('assets/images/home/5.png', 'GD32F303CCT6', ['最小包装', '2000']),
        ],
      ),
    );
  }

  Widget _buildProductItem(String imageUrl, String title, List<String> tags) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.asset(
              imageUrl,
              width: 80.0,
              height: 80.0,
              fit: BoxFit.cover,
              errorBuilder: (c, o, s) => Image.asset('assets/images/home/no-image.png', width: 80.0, height: 80.0),
            ),
          ),
          const SizedBox(width: 16.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold)),
                const SizedBox(height: 8.0),
                Row(
                  children: tags.map((tag) => Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                    margin: const EdgeInsets.only(right: 8.0),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                    child: Text(tag, style: const TextStyle(color: Colors.black54)),
                  )).toList(),
                ),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue.withOpacity(0.1),
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
            ),
            child: const Text('询价', style: TextStyle(color: Colors.blue)),
          ),
        ],
      ),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('我的'),
      ),
    );
  }
}
