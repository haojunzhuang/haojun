import 'package:flutter/material.dart';

class Mom extends StatelessWidget {
  const Mom({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    double pad = size.width * 0.1;
    double fs = 40;

    return Scaffold(
      backgroundColor: const Color.fromARGB(124, 222, 164, 131),
      body: Container(
        padding: EdgeInsets.all(size.width * 0.1),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text('致妈妈：', style: TextStyle(fontSize: fs)),
              const SizedBox(height: 20),
              Text('妈妈，祝您生日快乐！', style: TextStyle(fontSize: fs)),
              const SizedBox(height: 20),
              Text('虽然我们的距离有一万公里，但我每时每刻都能感觉到您对我的牵挂',
                  style: TextStyle(fontSize: fs)),
              Padding(
                  padding: EdgeInsets.all(pad),
                  child: Image.asset('assets/images/mom1.jpeg')),
              Text('您的每一句话，每一条短信，每一次电话，都让我感到温暖',
                  style: TextStyle(fontSize: fs)),
              Padding(
                  padding: EdgeInsets.all(pad),
                  child: Image.asset('assets/images/mom2.jpeg')),
              Text('您的每一次关心，每一次关怀，每一次关爱，都让我感到幸福',
                  style: TextStyle(fontSize: fs)),
              Padding(
                  padding: EdgeInsets.all(pad),
                  child: Image.asset('assets/images/mom3.jpeg')),
              Text('您的每一次劝告，每一次建议，每一次指导，都让我感到受益',
                  style: TextStyle(fontSize: fs)),
              Padding(
                  padding: EdgeInsets.all(pad),
                  child: Image.asset('assets/images/mom4.jpeg')),
              Text('请您放心，我一定会在国外好好学习，天天进步', style: TextStyle(fontSize: fs)),
              Padding(
                  padding: EdgeInsets.all(pad),
                  child: Image.asset('assets/images/mom5.jpeg')),
              Text('再次祝您生日快乐！', style: TextStyle(fontSize: fs)),
              const SizedBox(height: 20),
              Text('儿子，', style: TextStyle(fontSize: fs)),
              const SizedBox(height: 20),
              Text('庄皓骏', style: TextStyle(fontSize: fs)),
              const SizedBox(height: 20),
              Text('2023年4月14日', style: TextStyle(fontSize: fs)),
            ],
          ),
        ),
      ),
    );
  }
}
