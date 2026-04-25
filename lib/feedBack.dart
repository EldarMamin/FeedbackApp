import 'package:flutter/material.dart';

class FeedBack extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Формы обратной связи',
      home: Scaffold(
        appBar: AppBar(title: Text('Обратная связь'), centerTitle: true),
        body: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Напишите нам',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),

              SizedBox(height: 8),

              Text('Введите ваше имя и нажмите кнопку отправки'),

              SizedBox(height: 24),

              FeedBackForm(),
            ],
          ),
        ),
      ),
    );
  }
}

class FeedBackForm extends StatefulWidget {
  @override
  FeedBackFormState createState() => FeedBackFormState();
}

class FeedBackFormState extends State<FeedBackForm> {
  TextEditingController controller = TextEditingController();
  String name = "";
  bool isSent = false;

  String get sendedName => controller.text;

 
  void send(String sendedName) {
    setState(() {
      name = sendedName;
      isSent = true;
      controller.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: controller,
          keyboardType: TextInputType.name,
          decoration: InputDecoration(
            labelText: 'Ваше имя',
            border: OutlineInputBorder(),
          ),
        ),

        SizedBox(height: 16),

        ElevatedButton(
          onPressed: () {
            send(sendedName);
          },
          child: Text('Отправить'),
        ),
        
        SizedBox(height: 16),
        
        if (isSent) Text('Отправлено! Спасибо, $name', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.green, fontSize: 16))
      ],
    );
  }
}
