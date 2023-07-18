import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sqftask/pages/service/api_service.dart';
import 'package:sqftask/provider/user_provider.dart';

import '../model/user_model.dart';
import '../widget/button_widget.dart';
import '../widget/custom_text_filed_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  InfoService infoService = InfoService();
  List<UserModel>? userModel;

  final TextEditingController titleControler = TextEditingController();
  final TextEditingController desControler = TextEditingController();

  void sendData() async {
    infoService.sendData(
        context: context, title: titleControler.text, des: desControler.text);
  }

  fetechAllInfo() async {
    userModel = await infoService.getData(context);
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetechAllInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("data"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                CustomField(
                  controller: titleControler,
                  hintText: "Title",
                ),
                SizedBox(
                  height: 20,
                ),
                CustomField(
                  controller: desControler,
                  hintText: "des",
                ),
                SizedBox(
                  height: 20,
                ),
                CustomButtonWidget(
                  text: 'Sava',
                  onTap: () {
                    sendData();
                  },
                ),
                Text("hwllow"),
                SizedBox(
                  height: 200,
                  child:userModel==null?Center(child: Text("please wait............."),): ListView.builder(
                      itemCount:userModel!.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        final infoData = userModel![index];
                        return ListTile(
                          title: Text(infoData.title),
                        );
                      }),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
