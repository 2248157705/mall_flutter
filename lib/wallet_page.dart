import 'package:flutter/material.dart';

class TradeItem {
  String? title;
  int? type;

  TradeItem({this.title, this.type});
}

class WalletPage extends StatefulWidget {
  const WalletPage({super.key});

  @override
  State<WalletPage> createState() => _WalletPageState();
}

class _WalletPageState extends State<WalletPage> {
  String currentDate = '2025-10';
  int trade = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('钱包')),
      body: SingleChildScrollView(
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            _buildBalance(),
            Padding(
              padding: const EdgeInsets.only(
                top: 210,
                left: 0,
                right: 0,
                bottom: 20,
              ),
              child: Column(
                children: [
                  _buildWalletInfo(),
                  _buildTrade(),
                  _buildCalendarInfo(),
                  _buildPayItem(
                    '订单支付',
                    '已支付',
                    'iPhoneX',
                    '2025-10-30 13:36:18',
                    '500',
                  ),
                  _buildPayItem(
                    '订单支付',
                    '已支付',
                    'iPhoneX',
                    '2025-10-30 13:36:18',
                    '500',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildWalletInfo() {
    return Container(
      color: Colors.white,
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 40),
      child: Column(
        children: [
          Container(
            // color: Colors.white,
            // width: double.infinity,
            child: _buildCard(),
          ),
          const SizedBox(height: 20),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  flex: 1,
                  child: GestureDetector(
                    onTap: () {
                      print('click');
                    },
                    child: _buildWalletBtn(
                      '我的银行卡',
                      const Color(0xFFF5F5F5),
                      const Color(0xFF999999),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  flex: 1,
                  child: GestureDetector(
                    onTap: () {},
                    child: _buildWalletBtn(
                      '充值',
                      const Color(0xFF1678FF),
                      Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBalance() {
    return Container(
      height: 260,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFF1678FF), // #1678FF 100%
            Color(0x661678FF), // #1678FF 40%
            Color(0x00FFFFFF), // #FFFFFF 0%
          ],
          stops: [0.0, 0.7, 1.0],
        ),
      ),
      padding: const EdgeInsets.symmetric(vertical: 40),
      width: double.infinity,
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('账户余额', style: TextStyle(fontSize: 18, color: Colors.white)),
          SizedBox(height: 10),
          Text('3800.00', style: TextStyle(fontSize: 36, color: Colors.white)),
          // SizedBox(height: 100),
        ],
      ),
    );
  }

  Widget _buildCard() {
    return Container(
      // padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 8),
      child: GridView(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
          mainAxisExtent: 64,
        ),
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          _buildMoneyItem('1200.00', '授信额度'),
          _buildMoneyItem('5000.00', '保证金额度'),
          _buildMoneyItem('300.00', '冻结额度'),
          _buildMoneyItem('1900.00', '待付金额'),
        ],
      ),
    );
  }

  Widget _buildMoneyItem(String val, String title) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFF5F5F5),
        borderRadius: BorderRadius.circular(4),
      ),
      padding: const EdgeInsets.all(4),
      child: Column(
        children: [
          Text(
            val,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color(0xFF333333),
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 4),
          Text(
            title,
            style: const TextStyle(fontSize: 13, color: Color(0xFF999999)),
          ),
        ],
      ),
    );
  }

  Widget _buildWalletBtn(String title, Color bg, Color textColor) {
    return Container(
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(32),
      ),
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Center(
        child: Text(title, style: TextStyle(fontSize: 16, color: textColor)),
      ),
    );
  }

  Widget _buildCalendarInfo() {
    return GestureDetector(
      onTap: () {
        print('select date');
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              children: [
                Image.asset(
                  'assets/images/detail/7.png',
                  width: 20,
                  height: 20,
                ),
                const SizedBox(width: 6),
                Text(
                  currentDate,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Color(0xFF666666),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }



  Widget _buildTrade() {
    return Container(
      // 1. 强制 Container 占满全宽，确保 Row 从最左边开始排列
      width: double.infinity,
      // 2. 设置对齐方式为左中
      alignment: Alignment.centerLeft,
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        // 3. 这里是左边的间距
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Row(
          // 4. 确保 Row 内部子组件从头部开始排列
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min, // 关键：让 Row 仅占据内容需要的宽度
          children: [
            _buildTradeItem(TradeItem(title: '帐户流水', type: 1)),
            const SizedBox(width: 20),
            _buildTradeItem(TradeItem(title: '冻结流水', type: 2)),
            const SizedBox(width: 20),
            _buildTradeItem(TradeItem(title: '保证金流水', type: 3)),
          ],
        ),
      ),
    );
  }


  Widget _buildTrade3() {
    // 1. 定义数据源（实际开发中这部分可以来自 State 或 ViewModel）
    final List<TradeItem> tradeItems = [
      TradeItem(title: '帐户流水', type: 1),
      TradeItem(title: '冻结流水', type: 2),
      TradeItem(title: '保证金流水', type: 3),
    ];

    return Container(
      width: double.infinity,
      alignment: Alignment.centerLeft,
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: tradeItems.asMap().entries.map((entry) {
            int index = entry.key;
            TradeItem item = entry.value;

            return Padding(
              // 动态计算间距：除最后一项外，每项右侧添加 20 像素间距
              padding: EdgeInsets.only(
                right: index == tradeItems.length - 1 ? 0 : 20,
              ),
              child: _buildTradeItem(item),
            );
          }).toList(),
        ),
      ),
    );
  }

  Widget _buildTradeItem(TradeItem item) {
    return GestureDetector(
      onTap: () {
        setState(() {
          trade = item.type!;
        });
      },
      child: Column(
        children: [
          Text(
            item.title!,
            style: TextStyle(
              fontSize: 14,
              color: Color(item.type == trade ? 0xFF1678FF : 0xFF666666),
            ),
          ),
          const SizedBox(height: 6),
          Container(
            color: item.type == trade ? const Color(0xFF1678FF) : Colors.white,
            height: 2,
            width: 30,
          ),
        ],
      ),
    );
  }

  Widget _buildPayItem(
    String title,
    String status,
    String model,
    String time,
    String price,
  ) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        // color: Colors.white,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
        ),
        padding: const EdgeInsets.all(15),
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Color(0xFF333333),
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                Text(
                  status,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Color(0xFF999999),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text.rich(
                      TextSpan(
                        text: '机型：',
                        style: const TextStyle(
                          color: Color(0xFF666666),
                          fontSize: 13,
                        ),
                        children: [
                          TextSpan(
                            text: model,
                            style: const TextStyle(
                              fontSize: 13,
                              color: Color(0xFF666666),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text.rich(
                      TextSpan(
                        text: time,
                        style: const TextStyle(
                          color: Color(0xFF666666),
                          fontSize: 13,
                        ),
                      ),
                    ),
                  ],
                ),
                Text(
                  '-¥$price',
                  style: const TextStyle(
                    color: Color(0xFFF83C30),
                    fontSize: 28,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
