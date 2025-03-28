import 'package:flutter/cupertino.dart';
import 'Color_item.dart';
import 'constants.dart';

class colorlist extends StatefulWidget {
  const colorlist({super.key, required this.selectedIndex, required this.onColorSelected});
  final int selectedIndex;
  final Function(int) onColorSelected; //Function to do an action when this color is selected
  @override
  State<colorlist> createState() => _colorlistState();
}

class _colorlistState extends State<colorlist> {


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 18*2,
      child: ListView.builder(
          itemCount: colores.length,
          scrollDirection: Axis.horizontal,
          itemBuilder:(context,index){
            return GestureDetector(
              onTap: (){
                widget.onColorSelected(index);
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: coloritem(
                  color: colores[index],
                  isactive: widget.selectedIndex == index,
                ),
              ),
            );
          } ),
    );
  }
}
