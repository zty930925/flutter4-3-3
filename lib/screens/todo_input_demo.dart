import 'package:flutter/material.dart';

//建立一個類別叫做TodoInputDemoScreen，並繼承StatefulWidget
class TodoInputDemoScreen extends StatefulWidget {
  //用來儲存待辦事項的列表
  //為了有效保存可戶資料，設計一個List叫做todoList
  List<String> todoList = [];
  @override
  //必須實作的createState函數，調用一個State的物件，名為_TodoInputDemoScreen
  State createState() {
    return _TodoInputDemoScreen();
  }
}

//建立State類別叫做_TodoInputDemoScreen，提供StatefulWidget的狀態管理
class _TodoInputDemoScreen extends State<TodoInputDemoScreen> {
  @override
  Widget build(BuildContext context) {
    //建立一個TextEditingController來控制TextField
    var textEditingController = TextEditingController();

    //使用Container包裝TextField並設定其寬度
    Widget userInputTextField = Container(
      width: 400,
      child: TextField(
        //decoration是裝飾用的，使用InputDecoration進行外觀變化
        decoration: InputDecoration(
          //輸入框的外框線
          border: OutlineInputBorder(),
          //輸入框的提示文字
          hintText: '輸入要執行的任務',
        ),

        //指定TextField的控制器
        controller: textEditingController,
        //當用戶提交輸入(按Enter)時觸發
        onSubmitted: (inputValue) {
          setState(() {
            //將輸入的值添加到待辦事項列表中
            this.widget.todoList.add(inputValue);
            //清空TextField的輸入
            textEditingController.clear();
          });
        },
      ),
    );

    //Scaffold提供了一個應用的基本結構
    return Scaffold(
      body: Container(
        alignment: Alignment.topCenter,
        //使用Column來排列子元件
        child: Column(
          children: [
            //用戶輸入的TextField
            userInputTextField,
            //將待辦事項列表中的每個項目轉換為Text元件
            //三個點的意思:使該list成為children內的元素
            ...this
                .widget
                .todoList
                .map((taskString) => Text(taskString))
                .toList()
          ],
        ),
      ),
    );
  }
}
