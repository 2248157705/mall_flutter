
import 'package:flutter/material.dart';
import 'package:login_app/address_page.dart';

class UserInfo {
  final String avatar;
  final String name;
  final String phone;

  UserInfo({required this.avatar, required this.name, required this.phone});
}

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  final UserInfo userInfo = UserInfo(
    avatar: 'assets/images/user/1.png',
    name: '昵称Abc',
    phone: '158****6502',
  );

  final List<Map<String, dynamic>> list = [
    {'icon': Icons.account_box, 'title': '基本信息管理'},
    {'icon': Icons.account_balance_wallet, 'title': '资金账户'},
    {'icon': Icons.people, 'title': '子账户管理'},
    {'icon': Icons.location_on, 'title': '收货仓位管理'},
    {'icon': Icons.assignment, 'title': '售后申请记录'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '我的',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.more_horiz)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.remove_red_eye_outlined)),
        ],
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(16),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage(userInfo.avatar),
                ),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('主账号：${userInfo.name}', style: const TextStyle(fontSize: 16)),
                    Text(userInfo.phone, style: const TextStyle(fontSize: 14, color: Colors.grey)),
                  ],
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: ListView.separated(
              shrinkWrap: true,
              itemCount: list.length,
              separatorBuilder: (context, index) => const Divider(height: 1),
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Icon(list[index]['icon']),
                  title: Text(list[index]['title']),
                  trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
                  onTap: () {
                    if(index==3){
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const AddressPage()));
                    }
                  },
                );
              },
            ),
          ),
          const Spacer(),
          Container(
            margin: const EdgeInsets.only(bottom: 32),
            child: ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.logout),
              label: const Text('退出登录'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
