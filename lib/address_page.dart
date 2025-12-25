import 'package:flutter/material.dart';

class AddressPage extends StatefulWidget {
  const AddressPage({super.key});

  @override
  State<AddressPage> createState() => AddressPageState();
}

class AddressPageState extends State<AddressPage> {
  List<int> list = [1, 2, 3, 4, 5, 6];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('收货仓位管理')),
      body: Container(
        color: const Color(0xF5F5F5),
        child: Padding(padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12), child:Column(
          children: [
            Container(
              color: Colors.white,
              padding: EdgeInsets.only(left: 16, bottom: 16, top: 16),
              alignment: Alignment.centerLeft,
              child: const Text(
                '收货仓位管理',
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF333333),
                ),
              ),
            ),
            _buildAddressList(),
            GestureDetector(
              onTap: () {},
              child: Container(
                width: double.infinity,
                margin: const EdgeInsets.all(16),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: const Color(0xFF1678FF),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Center(
                  child: const Text(
                    '新增仓位',
                    style: const TextStyle(fontSize: 13, color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),)
      ),
    );
  }

  Widget _buildAddressList() {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: list.map((item) {
            return _buildAddressItem(item);
          }).toList(),
        ),
      ),
    );
  }

  Widget _buildAddressItem(int item) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(bottom: BorderSide(color: Color(0xFF1678FF), width: 1)),
      ),
      padding: EdgeInsets.symmetric(horizontal: 16,vertical: 16),
      width: double.infinity,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                '王先生',
                style: TextStyle(fontSize: 14, color: Color(0xFF333333)),
              ),
              Text.rich(
                TextSpan(
                  text: '186547897210',
                  style: TextStyle(fontSize: 14, color: Color(0xFF333333)),
                  children: [
                    // WidgetSpan(
                    //   alignment: PlaceholderAlignment.middle, // 确保标签与文字居中对齐
                    //   child: Container(
                    //     margin: const EdgeInsets.only(left: 8), // 与手机号保持间距
                    //     padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2), // 标签内边距
                    //     decoration: BoxDecoration(
                    //       color: const Color(0xFF1678FF), // #1678FF 背景色
                    //       borderRadius: BorderRadius.circular(4), // 标签圆角
                    //     ),
                    //     child: const Text(
                    //       '默认',
                    //       style: TextStyle(
                    //         fontSize: 10, // 标签文字通常建议小一点
                    //         color: Colors.white,
                    //         fontWeight: FontWeight.bold,
                    //       ),
                    //     ),
                    //   ),
                    // )
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '收货地址',
                style: TextStyle(fontSize: 14, color: Color(0xFF333333)),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        '广东省 深圳市 宝安区',
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0xFF333333),
                        ),
                        textAlign: TextAlign.right,
                      ),
                      Text(
                        '西乡街道桃花源科技创新园A栋',
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0xFF333333),
                        ),
                        textAlign: TextAlign.right,
                      ),
                    ],
                  ),
                  const SizedBox(width: 8),
                  Image.asset(
                    'assets/images/user/16.png',
                    width: 20,
                    height: 20,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
