
import 'package:flutter/material.dart';

class QuotationPage extends StatelessWidget {
  const QuotationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('订单报价'),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.more_horiz)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.remove_red_eye_outlined)),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildProductInfo(),
            _buildMachinePictures(),
            _buildStoreOptions(),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomButtons(),
    );
  }

  Widget _buildProductInfo() {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset('assets/images/customer/1.png', width: 80),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('iPhone11 Pro', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 8),
                    const Text('IMEI: 5402314654992', style: TextStyle(color: Colors.grey)),
                    const SizedBox(height: 8),
                    Wrap( // Use Wrap to prevent overflow of tags
                      spacing: 8.0, // space between adjacent chips
                      runSpacing: 4.0, // space between lines
                      children: [
                        _buildTag('256G'),
                        _buildTag('国行'),
                        _buildTag('黑色'),
                      ],
                    ),
                  ],
                ),
              ),
              OutlinedButton(
                onPressed: () {},
                child: const Text('串号查询'),
              ),
            ],
          ),
          const SizedBox(height: 16),
          _buildInfoRow('串号查询结果:', 'XXX: 0201548821550 | XXX: 154542848832', color: Colors.red.withOpacity(0.1)),
          const SizedBox(height: 8),
          _buildInfoRow('店员备注:', '屏幕有划痕, 外观有破损', color: Colors.yellow.withOpacity(0.1)),
        ],
      ),
    );
  }

  Widget _buildTag(String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      margin: const EdgeInsets.only(right: 8),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(label),
    );
  }

  Widget _buildInfoRow(String title, String content, {required Color color}) {
    return Container(
      color: color,
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(width: 8),
          Expanded(child: Text(content)),
        ],
      ),
    );
  }

  Widget _buildMachinePictures() {
    return Container(
      color: Colors.white,
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('机器图片', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset('assets/images/detail/1.png', width: 80, height: 80),
              Image.asset('assets/images/detail/2.png', width: 80, height: 80),
              Image.asset('assets/images/detail/3.png', width: 80, height: 80),
              Container(
                width: 80,
                height: 80,
                color: Colors.black.withOpacity(0.5),
                child: const Center(
                  child: Text('+8', style: TextStyle(color: Colors.white, fontSize: 24)),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStoreOptions() {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(16.0),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('店员选择项', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          SizedBox(height: 16),
          Text('外观细微划痕, 无磕碰 | 屏幕轻微使用痕迹 | NFC正常 | 震动正常 | 闪光灯正常 | 重力感应正常'),
        ],
      ),
    );
  }

  Widget _buildBottomButtons() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          Expanded(
            child: OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              child: const Text('跳过本单'),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              child: const Text('立即报价'),
            ),
          ),
        ],
      ),
    );
  }
}
