import 'package:coffee_bill_flutter/models/bill.dart';
import 'package:coffee_bill_flutter/screens/detail_screen.dart';
import 'package:coffee_bill_flutter/services/api_service.dart';
import 'package:coffee_bill_flutter/utils/app_styles.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final Future<List<BillModel>> bills = ApiService.getAllBills();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('☕️ coffee bill'),
        backgroundColor: Styles.primaryColor,
        elevation: 10,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 36),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton.icon(
                  icon: const Icon(Icons.add_circle_outline),
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Styles.primaryColor,
                    padding: const EdgeInsets.symmetric(
                        vertical: 12, horizontal: 24),
                  ),
                  label: Text(
                    '새 주문서 만들기',
                    style: Styles.buttonTextStyle,
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 48,
            ),
            Text(
              '커피 주문서 목록',
              style: Styles.headLineStyle2,
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: FutureBuilder(
                  future: bills,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ListView.separated(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          var bill = snapshot.data![index];
                          return ListItem(
                            name: bill.name,
                            seq: bill.seq,
                            description: bill.description,
                          );
                        },
                        separatorBuilder: (context, index) {
                          return const SizedBox(height: 12);
                        },
                      );
                    }
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}

class ListItem extends StatelessWidget {
  final String name, description;
  final int seq;

  const ListItem({
    super.key,
    required this.name,
    required this.description,
    required this.seq,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigator.push 해당 주문서 상세화면으로 이동
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DetailScreen(seq: seq)),
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
        decoration: BoxDecoration(
          color: Styles.greyColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            Icon(
              Icons.check_circle_outline_rounded,
              color: Styles.primaryColor,
            ),
            const SizedBox(
              width: 12,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: Styles.headLineStyle3,
                ),
                Text(
                  description,
                  style: Styles.headLineStyle4,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
