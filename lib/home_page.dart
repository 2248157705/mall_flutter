import 'package:flutter/material.dart';
import 'dart:async';

import 'package:login_app/deals_page.dart';
import 'package:login_app/quotation_page.dart';
import 'package:login_app/user_page.dart';
import 'package:login_app/data_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    const InquiryPage(),
    const Center(child: Text('报价')),
    const DealsPage(),
    const DataPage(),
    const UserPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _widgetOptions,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.request_quote_outlined),
            label: '询价',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list_alt_outlined),
            label: '报价',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.handshake_outlined),
            label: '成交',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.data_usage_outlined),
            label: '数据',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: '我的',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }
}

class InquiryPage extends StatefulWidget {
  const InquiryPage({super.key});

  @override
  State<InquiryPage> createState() => _InquiryPageState();
}

class _InquiryPageState extends State<InquiryPage> with TickerProviderStateMixin {
  late TabController _tabController;
  final List<String> _tabs = ['全部', '苹果', '华为', '小米', '三星'];
  String _selectedSort = '默认排序';

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _tabs.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const Icon(Icons.arrow_back_ios, color: Colors.black),
        title: const Text('询价', style: TextStyle(color: Colors.black)),
        centerTitle: true,
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 16.0),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: [
                const SizedBox(width: 8),
                const Icon(Icons.more_horiz, color: Colors.black, size: 20),
                const SizedBox(width: 4),
                Container(width: 1, height: 12, color: Colors.grey.shade300),
                const SizedBox(width: 4),
                const Icon(Icons.track_changes, color: Colors.black, size: 20),
                const SizedBox(width: 8),
              ],
            ),
          )
        ],
        bottom: TabBar(
          controller: _tabController,
          tabs: _tabs.map((String name) => Tab(text: name)).toList(),
          isScrollable: true,
          labelColor: Colors.blue,
          unselectedLabelColor: Colors.black,
          indicatorColor: Colors.blue,
        ),
      ),
      body: Column(
        children: [
          _buildFilterChips(),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: _tabs.map((String name) {
                return _buildInquiryList();
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterChips() {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
      child: Column(
        children: [
          SizedBox(
            height: 30,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                _buildChip('全部', isSelected: true, isBlue: true),
                _buildChip('KA'),
                _buildChip('权益'),
                _buildChip('HW单'),
                _buildChip('XM单'),
                _buildChip('价格维护'),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: SizedBox(
                  height: 30,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                       _buildChip('待报价', isSelected: true),
                       _buildChip('已报价未截标'),
                       _buildChip('已报价已截标'),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () => _showSortMenu(context),
                child: Row(
                  children: [
                    const SizedBox(width: 8),
                    Text(_selectedSort, style: const TextStyle(color: Colors.blue)),
                    const Icon(Icons.swap_vert, color: Colors.blue),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildChip(String label, {bool isSelected = false, bool isBlue = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: ChoiceChip(
        label: Text(label),
        selected: isSelected,
        onSelected: (bool selected) {},
        backgroundColor: Colors.grey[200],
        selectedColor: isBlue ? Colors.blue : Colors.blue.withOpacity(0.1),
        labelStyle: TextStyle(
          color: isSelected ? (isBlue ? Colors.white : Colors.blue) : Colors.black,
          fontSize: 12,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
          side: BorderSide(
            color: isSelected ? (isBlue ? Colors.blue : Colors.blue) : Colors.transparent,
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
      ),
    );
  }

  void _showSortMenu(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return Container(
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Wrap(
            children: <Widget>[
              _buildSortOption('默认排序'),
              const Divider(height: 1),
              _buildSortOption('截标时间由远到近'),
              const Divider(height: 1),
              _buildSortOption('截标时间由近到远'),
            ],
          ),
        );
      },
    );
  }

  Widget _buildSortOption(String title) {
     return ListTile(
      title: Center(
        child: Text(
          title,
          style: TextStyle(
            color: _selectedSort == title ? Colors.blue : Colors.black,
          ),
        ),
      ),
      onTap: () {
        setState(() {
          _selectedSort = title;
        });
        Navigator.pop(context);
      },
    );
  }

  Widget _buildInquiryList() {
    return ListView.builder(
      padding: const EdgeInsets.all(8.0),
      itemCount: 3,

      itemBuilder: (context, index) {
        return GestureDetector(onTap: (){
          // Navigator.push(context, MaterialPageRoute(builder: (context) => const DealsPage()));
          Navigator.push(context, MaterialPageRoute(builder: (context) => const QuotationPage()));
        },child:  _buildCardItem());
      },
    );
  }

  Widget _buildCardItem() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      margin: const EdgeInsets.symmetric(vertical: 6.0),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('iPhone11 Pro', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                Row(
                  children: [
                    _buildCountdownTimer(),
                    const SizedBox(width: 4),
                    const Text('后结束', style: TextStyle(color: Colors.grey)),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: Colors.grey[200],
                  ),
                  child: const Icon(Icons.image, color: Colors.grey, size: 40),
                ),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('IMEI: 5402314654992', style: TextStyle(color: Colors.grey)),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        _buildTag('KA', Colors.orange),
                        const SizedBox(width: 8),
                        _buildTag('权益', Colors.blue),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('2025-09-22 18:36:49', style: TextStyle(color: Colors.grey, fontSize: 12)),
                OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: Colors.grey.shade300),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    ),
                  ),
                  child: const Text('查看详情', style: TextStyle(color: Colors.grey)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
  
   Widget _buildTag(String text, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(text, style: TextStyle(color: color, fontSize: 12)),
    );
  }

  Widget _buildCountdownTimer() {
    return Row(
      children: [
        _buildTimeBox('00'),
        const Text(' : ', style: TextStyle(fontWeight: FontWeight.bold)),
        _buildTimeBox('00'),
        const Text(' : ', style: TextStyle(fontWeight: FontWeight.bold)),
        _buildTimeBox('46'),
      ],
    );
  }

  Widget _buildTimeBox(String time) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(time, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
    );
  }
}