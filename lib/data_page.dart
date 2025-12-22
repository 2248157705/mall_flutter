import 'package:flutter/material.dart';

class DataPage extends StatefulWidget {
  const DataPage({super.key});

  @override
  State<DataPage> createState() => _DataPageState();
}

class _DataPageState extends State<DataPage> {
  String _selectedTime = '今日';
  String _selectedAnalysisFilter = '价格段';
  String _selectedPriceRange = '0-200';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const Icon(Icons.arrow_back_ios, color: Colors.black),
        title: const Text('数据', style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold)),
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
                const Icon(Icons.show_chart, color: Colors.black, size: 20),
                const SizedBox(width: 8),
              ],
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildCoreMetricsSection(),
            const SizedBox(height: 12),
            _buildIndicatorAnalysisSection(),
            const SizedBox(height: 12),
            _buildOrderTrackingSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildCoreMetricsSection() {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('核心指标监控', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  children: const [
                    Text('选择报价师', style: TextStyle(fontSize: 12)),
                    SizedBox(width: 4),
                    Icon(Icons.keyboard_arrow_down, size: 16),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  _buildTimeButton('今日', isSelected: true),
                  _buildTimeButton('昨日'),
                  _buildTimeButton('本月'),
                ],
              ),
              TextButton(
                onPressed: () {},
                child: const Text('自定义时间', style: TextStyle(color: Colors.blue)),
              ),
            ],
          ),
          const SizedBox(height: 16),
          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 4,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
            children: [
              _buildMetricCard('订单推流', '6093', '+19.85%', Colors.red),
              _buildMetricCard('报价次数', '856', '-10.33%', Colors.green),
              _buildMetricCard('成交数量', '0', '0%', Colors.blue),
              _buildMetricCard('取消数量', '0', '0%', Colors.blue),
              _buildMetricCard('成交率', '34%', '-16.99%', Colors.green),
              _buildMetricCard('成交金额', '8696', '+10.25%', Colors.red),
              _buildMetricCard('成交均价', '369', '+26.11%', Colors.red),
              _buildMetricCard('报价效率', '24s', '-15.43%', Colors.green),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTimeButton(String text, {bool isSelected = false}) {
    return Container(
      margin: const EdgeInsets.only(right: 12),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: isSelected ? Colors.blue : Colors.grey.shade100,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: isSelected ? Colors.white : Colors.black,
          fontSize: 12,
        ),
      ),
    );
  }

  Widget _buildMetricCard(String title, String value, String change, Color changeColor) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                change.startsWith('+') ? Icons.trending_up : Icons.trending_down,
                size: 12,
                color: changeColor,
              ),
              const SizedBox(width: 4),
              Text(
                change,
                style: TextStyle(
                  color: changeColor,
                  fontSize: 12,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            value,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            title,
            style: TextStyle(
              color: Colors.grey.shade600,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildIndicatorAnalysisSection() {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('指标分析', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                _buildAnalysisFilter('子账号'),
                _buildAnalysisFilter('价格维护'),
                _buildAnalysisFilter('品牌'),
                _buildAnalysisFilter('价格段'),
                _buildAnalysisFilter('关注'),
              ],
            ),
          ),
          const SizedBox(height: 16),
          _buildPriceRangeCard('0-200', '623', '652', '6233', '26%'),
          const SizedBox(height: 12),
          _buildPriceRangeCard('201-500', '233', '102', '2463', '8%'),
        ],
      ),
    );
  }

  Widget _buildAnalysisFilter(String text) {
    final isSelected = _selectedAnalysisFilter == text;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedAnalysisFilter = text;
        });
      },
      child: Container(
        margin: const EdgeInsets.only(right: 12),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? Colors.blue : Colors.grey.shade100,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black,
            fontSize: 12,
          ),
        ),
      ),
    );
  }

  Widget _buildPriceRangeCard(String range, String quoteCount, String dealCount, String dealAmount, String dealRate) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            range,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildPriceRangeMetric('报价次数', quoteCount),
              _buildPriceRangeMetric('成交数量', dealCount),
              _buildPriceRangeMetric('成交金额', dealAmount),
              _buildPriceRangeMetric('成交率', dealRate),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPriceRangeMetric(String title, String value) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          title,
          style: TextStyle(
            color: Colors.grey.shade600,
            fontSize: 12,
          ),
        ),
      ],
    );
  }

  Widget _buildOrderTrackingSection() {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('订单跟踪', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),
          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 4,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
            children: [
              _buildTrackingCard('待发货', '365'),
              _buildTrackingCard('待收货', '66'),
              _buildTrackingCard('待付款', '2014'),
              _buildTrackingCard('物流时效', '10天'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTrackingCard(String title, String value) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.all(12),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            value,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            title,
            style: TextStyle(
              color: Colors.grey.shade600,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
