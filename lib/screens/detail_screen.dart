import 'package:coffee_bill_flutter/models/bill.dart';
import 'package:coffee_bill_flutter/models/order.dart';
import 'package:coffee_bill_flutter/services/api_service.dart';
import 'package:coffee_bill_flutter/utils/app_styles.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatefulWidget {
  final int seq;

  const DetailScreen({
    super.key,
    required this.seq,
  });

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  late Future<BillModel> bill;
  late Future<List<OrderModel>> orders;

  @override
  void initState() {
    super.initState();
    bill = ApiService.getBill(widget.seq);
    orders = ApiService.getAllOrders(widget.seq);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: FutureBuilder(
          future: bill,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Text(snapshot.data!.name);
            }
            return const Text('loading...');
          },
        ),
        backgroundColor: Styles.primaryColor,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 36),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FutureBuilder(
              future: bill,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Text(
                    snapshot.data!.description,
                    style: Styles.headLineStyle3,
                  );
                }
                return const CircularProgressIndicator();
              },
            ),
            const SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    print('마감!');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Styles.pointColor,
                    padding: const EdgeInsets.symmetric(
                        vertical: 12, horizontal: 24),
                  ),
                  icon: const Icon(Icons.av_timer),
                  label: const Text('주문마감'),
                ),
                const SizedBox(
                  width: 8,
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    print('추가!');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Styles.primaryColor,
                    padding: const EdgeInsets.symmetric(
                        vertical: 12, horizontal: 24),
                  ),
                  icon: const Icon(Icons.add_circle_outline),
                  label: const Text('추가'),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            FutureBuilder(
              future: orders,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '총 ${snapshot.data!.length}잔',
                          style: Styles.headLineStyle2,
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        Expanded(
                          child: ListView.separated(
                            itemCount: snapshot.data!.length,
                            itemBuilder: (context, index) {
                              String drinkType =
                                  snapshot.data![index].drinkType == 0
                                      ? 'HOT'
                                      : 'ICE';
                              return Container(
                                decoration: BoxDecoration(
                                  color: Styles.greyColor,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                padding: const EdgeInsets.symmetric(
                                    vertical: 16, horizontal: 24),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            snapshot.data![index].drinkName,
                                            style: Styles.headLineStyle2,
                                          ),
                                          Chip(
                                            label: Text(
                                              drinkType,
                                              style: TextStyle(
                                                color: Styles.whiteColor,
                                              ),
                                            ),
                                            backgroundColor: drinkType == 'HOT'
                                                ? Colors.red
                                                : Colors.blue,
                                          ),
                                        ]),
                                    Text(
                                        snapshot.data![index].optionDescription,
                                        style: Styles.headLineStyle4),
                                  ],
                                ),
                              );
                            },
                            separatorBuilder: (context, index) {
                              return const SizedBox(
                                height: 8,
                              );
                            },
                          ),
                        )
                      ],
                    ),
                  );
                }
                return const CircularProgressIndicator();
              },
            )
          ],
        ),
      ),
    );
  }
}
