
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:provider/provider.dart';
import 'package:login_app/service/api_client.dart';
import 'package:login_app/service/order_api_client.dart';
import 'package:login_app/store/user_provider.dart';
import 'package:login_app/model/order_detail.dart';

class DetailPage extends StatefulWidget {
  final int orderId;
  const DetailPage({super.key, required this.orderId});

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  OrderDetail? orderInfo;
  late final OrderDetailService _orderDetailService;
  late final Dio _dio;

  @override
  void initState() {
    super.initState();
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    _dio = buildDioClient("https://testenv.huanjintech.com/api/gtw/xgj-mall-api/", token: userProvider.token);
    _orderDetailService = OrderDetailService(_dio);
    _fetchOrderDetail();
  }

  void _fetchOrderDetail() async {
    try {
      final response = await _orderDetailService.getOrderDetail(widget.orderId);
      
      if (response.data != null) {
        setState(() {
          orderInfo = response.data;
        });
        print('Order Info: $orderInfo');
      } else {
        print('Order detail data is null in response.');
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Failed to load order details: data is empty')),
        );
      }
    } on DioError catch (e) {
      print('Error fetching order detail: ${e.message}');
      print('DioError response data: ${e.response?.data}');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error fetching order detail: ${e.message}')),
      );
    } catch (e) {
      print('An unexpected error occurred: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('An unexpected error occurred: $e')),
      );
    }
  }

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
      body: orderInfo == null
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
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
              Text(orderInfo?.orderStatus == 20 ? '已代签收' : '运输中', style: const TextStyle(color: Colors.orange)),
              const SizedBox(width: 8),
              Expanded(child: Text('经客户同意, 快递已放在 (${orderInfo?.receiveAddress ?? ''})', overflow: TextOverflow.ellipsis)),
              const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              const Text('默认', style: TextStyle(color: Colors.red)),
              const SizedBox(width: 8),
              Text('${orderInfo?.receiveProvince ?? ''} ${orderInfo?.receiveCity ?? ''} ${orderInfo?.receiveArea ?? ''}', style: const TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
          const SizedBox(height: 8),
          Text(orderInfo?.receiveAddress ?? '', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Text('${orderInfo?.receiveName ?? ''} ${orderInfo?.receivePhone ?? ''}', style: const TextStyle(color: Colors.grey)),
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
          Expanded(child: Text(orderInfo?.customerName ?? 'N/A', style: const TextStyle(fontWeight: FontWeight.bold))),
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
                Expanded(child: Text('店员备注: ${orderInfo?.orderRemark ?? ''}')), 
              ],
            ),
          ),
          const Text('店员选项', style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Text(orderInfo?.reviewOrderAuditReportList?.map((e) => e.optionName).join(' | ') ?? 'N/A'),
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
          _buildDetailRow('报价金额', '¥${orderInfo?.quoteAmount ?? 0}', valueColor: Colors.red),
          _buildDetailRow('快递费', '¥${orderInfo?.payAmount?.toStringAsFixed(2) ?? 0}', valueColor: Colors.red),
          _buildDetailRow('快递单号', orderInfo?.logisticsSendCount.toString() ?? 'N/A', copyable: true),
          _buildDetailRow('实付金额', '¥${orderInfo?.dealAmount ?? 0}', valueColor: Colors.red),
          _buildDetailRow('付款状态', orderInfo?.payStatus == 20 ? '已付款' : '未付款'),
          _buildDetailRow('机型', orderInfo?.itemName ?? 'N/A'),
          _buildDetailRow('skuid', orderInfo?.skuId ?? 'N/A'),
          _buildDetailRow('imei', orderInfo?.imei ?? 'N/A', copyable: true),
          _buildDetailRow('订单条码', orderInfo?.orderCode ?? 'N/A', copyable: true),
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
