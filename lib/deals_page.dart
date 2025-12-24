import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dio/dio.dart';
import 'package:login_app/detail_page.dart';
import 'package:login_app/model/order_list_response.dart';
import 'package:login_app/service/order_api_client.dart';

class DealsPage extends ConsumerStatefulWidget {
  const DealsPage({super.key});

  @override
  ConsumerState<DealsPage> createState() => _DealsPageState();
}

class _DealsPageState extends ConsumerState<DealsPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  List<OrderItem> orderList = [];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 6, vsync: this);
    _fetchOrderList();
  }

  void _fetchOrderList() async {
    try {
      final response = await ref.read(orderServiceProvider("https://testenv.manhd.cn/api/gtw/xgj-mall-api/"))
          .queryOrders({
            'pageSize': 12,
            'currentPage': 1,
          });
      
      if (response.data != null && response.data.code == 0) {
        setState(() {
          orderList = response.data.data.data;
        });
        print('Order List: $orderList'); // Debugging statement
      } else {
        print('Order list data is null in response.');
      }
    } on DioException catch (e) {
      print('Error fetching order list: ${e.message}');
      print('DioError response data: ${e.response?.data}');
    } catch (e) {
      print('An unexpected error occurred: $e');
    }
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('成交'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            // Handle back button press
          },
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.more_horiz)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.remove_red_eye_outlined)),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(100.0),
          child: Column(
            children: [
              _buildSearchAndFilter(),
              TabBar(
                controller: _tabController,
                isScrollable: true,
                tabs: const [
                  Tab(text: '全部'),
                  Tab(text: '待发货'),
                  Tab(text: '待收货'),
                  Tab(text: '暂停收货'),
                  Tab(text: '已完成'),
                  Tab(text: '待验收'),
                ],
              ),
            ],
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: List.generate(6, (index) => _buildDealsList()),
      ),
    );
  }

  Widget _buildSearchAndFilter() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        children: [
          const Text('订单号'),
          const Icon(Icons.arrow_drop_down),
          const SizedBox(width: 8),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(20),
              ),
              child: const TextField(
                decoration: InputDecoration(
                  hintText: '请输入搜索内容...',
                  prefixIcon: Icon(Icons.search),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(vertical: 10),
                ),
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.filter_list),
            onPressed: () {
              // Handle filter button press
            },
          ),
        ],
      ),
    );
  }

  Widget _buildDealsList() {
    return ListView(
      children: orderList.map((order) {
        return _buildDealItem(
          order.itemName ?? '未知商品',
          _getStatusText(order.orderStatus),
          '¥${order.dealAmount}',
          '', // itemSpec not available in OrderItem model
          'KA',
          '0人报价',
          null, // quoterName not available in OrderItem model
        );
      }).toList(),
    );
  }

  String _getStatusText(int status) {
    switch (status) {
      case 10: return '待发货';
      case 20: return '待收货';
      case 30: return '暂停收货';
      case 40: return '已完成';
      case 50: return '待验收';
      default: return '未知状态';
    }
  }

  Widget _buildDealItem(String title, String? status, String price, String storage, String type, String quote, String? quoter) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const DetailPage(orderId: 1179)),
        );
      },
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  Row(
                    children: [
                      if (status != null)
                        Text(status, style: const TextStyle(color: Colors.green)),
                      const SizedBox(width: 8),
                      Text(price, style: const TextStyle(color: Colors.red, fontSize: 18, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Image.asset('assets/images/customer/1.png', width: 80, height: 80),
                  const SizedBox(width: 16),
                  Expanded( // Wrap the column in Expanded
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(storage),
                        const SizedBox(height: 8),
                        Wrap( // Use Wrap to prevent overflow of tags
                          spacing: 8.0,
                          runSpacing: 4.0,
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                              decoration: BoxDecoration(
                                color: Colors.orange.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Text(type, style: const TextStyle(color: Colors.orange)),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                              decoration: BoxDecoration(
                                color: Colors.blue.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Text(quote, style: const TextStyle(color: Colors.blue)),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (quoter != null) Text('报价师: $quoter', style: const TextStyle(color: Colors.grey)),
                  OutlinedButton(
                    onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const DetailPage(orderId: 1179)),
                        );
                    },
                    child: const Text('查看详情'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
