import 'package:flutter/material.dart';


class ChoicesListView extends StatefulWidget {
  const ChoicesListView({super.key, required this.length, required this.color,required this.answer,required this.selectedColor});

  final int length;
  final List<Color> color;
  final Color answer;
  final Color selectedColor;


  @override
  State<ChoicesListView> createState() => _ChoicesListViewState();
}

class _ChoicesListViewState extends State<ChoicesListView> {

  @override
  void initState() {
    super.initState();
    // TODO: implement initState
    widget.color.shuffle();
  }
  bool win=false;




  List<bool> selectOrNot =[
    false,
    false,
    false
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const FixedExtentScrollPhysics(),
      scrollDirection: Axis.horizontal,
      itemCount: widget.length,
      itemBuilder: (context, index) =>
          MaterialButton(
            padding: const EdgeInsets.all(15),
            onPressed: () {
              setState(() {
                selectOrNot.fillRange(0, selectOrNot.length,false);
                selectOrNot[index]=true;
                if(widget.color[index]==widget.answer){
                 win=true;
                }
                else{
                  win=false;
                }
              });
            },
            child: Container(
              alignment: Alignment.center,
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                  color: selectOrNot[index]==false? Colors.white:widget.selectedColor,
                  borderRadius: BorderRadius.circular(35)),
              child: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: widget.color[index],)
              ),
            ),
          ),
    );
  }
}
