
import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('详情页'),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.more_horiz)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.remove_red_eye_outlined)),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildAddressSection(),
            _buildShopSection(),
            _buildOrderReportSection(),
            _buildOrderDetailSection(),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: const Text('确认收货'),
        ),
      ),
    );
  }

  Widget _buildAddressSection() {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.local_shipping, color: Colors.orange),
              const SizedBox(width: 8),
              const Text('已代签收', style: TextStyle(color: Colors.orange)),
              const SizedBox(width: 8),
              const Expanded(child: Text('经客户同意, 快递已放在 (南山区软件...)', overflow: TextOverflow.ellipsis)),
              const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              const Text('默认', style: TextStyle(color: Colors.red)),
              const SizedBox(width: 8),
              const Text('广东省 深圳市 南山区', style: TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
          const SizedBox(height: 8),
          const Text('软件园二期十一栋602', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          const Text('用户名 175****4231', style: TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }

  Widget _buildShopSection() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      color: Colors.white,
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          const Icon(Icons.store, color: Colors.blue),
          const SizedBox(width: 8),
          const Text('小米之家浙江绍兴越城区胜利东路世贸广场专卖店', style: TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  Widget _buildOrderReportSection() {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('订单报告', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),
          const Text('顾客自选', style: TextStyle(fontWeight: FontWeight.bold)),
          Container(
            color: Colors.orange.withOpacity(0.1),
            padding: const EdgeInsets.all(8),
            margin: const EdgeInsets.symmetric(vertical: 8),
            child: Row(
              children: [
                const Icon(Icons.info, color: Colors.orange),
                const SizedBox(width: 8),
                const Expanded(child: Text('店员备注: 正常开机进入桌面; 苹果 iCloud 账户可退出; 无维修情况;')),
              ],
            ),
          ),
          const Text('店员选项', style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          const Text('外观细微划痕, 无磕碰 | 屏幕轻微使用痕迹 | NFC正常 | 震动正常 | 闪光灯正常 | 重力感应正常'),
          const SizedBox(height: 16),
          const Text('顾客拍照', style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset('assets/images/detail/1.png', width: 80, height: 80),
              Image.asset('assets/images/detail/2.png', width: 80, height: 80),
              Image.asset('assets/images/detail/3.png', width: 80, height: 80),
              Image.asset('assets/images/detail/4.png', width: 80, height: 80),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildOrderDetailSection() {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      color: Colors.white,
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('订单详情', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),
          _buildDetailRow('发货类型', '门店自取'),
          _buildDetailRow('报价金额', '¥3600', valueColor: Colors.red),
          _buildDetailRow('快递费', '¥6', valueColor: Colors.red),
          _buildDetailRow('快递单号', '95040144789', copyable: true),
          _buildDetailRow('实付金额', '¥3606', valueColor: Colors.red),
          _buildDetailRow('付款状态', '已付款'),
          _buildDetailRow('机型', 'iPhone 14Pro'),
          _buildDetailRow('skuid', '564dv545qs1877455fg1as84s1fd47'),
          _buildDetailRow('imei', '879514014445454412', copyable: true),
          _buildDetailRow('订单条码', 'BO20251018878225484122', copyable: true),
        ],
      ),
    );
  }

  Widget _buildDetailRow(String title, String value, {Color? valueColor, bool copyable = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: const TextStyle(color: Colors.grey)),
          Expanded( // Wrap the second part of the row in Expanded
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end, // Align content to the end
              children: [
                Flexible( // Use Flexible instead of Expanded here for the text to prevent overflow
                  child: Text(
                    value,
                    style: TextStyle(color: valueColor ?? Colors.black),
                    textAlign: TextAlign.right,
                    overflow: TextOverflow.ellipsis, // Add overflow handling
                  ),
                ),
                if (copyable) ...[
                  const SizedBox(width: 8),
                  const Icon(Icons.copy, size: 16),
                ]
              ],
            ),
          ),
        ],
      ),
    );
  }
}
