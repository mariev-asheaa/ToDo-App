import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'constants.dart';

class Textfield extends StatelessWidget {

  Textfield({super.key, this.onchanged,this.obsecure=false, required this.title});
  final Function(String)?onchanged;
  final bool ?obsecure;
 final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),),
        TextFormField(
          obscureText: obsecure!,

          validator:(data){
            if(data!.isEmpty){
              return 'This field is required';
            }
          } ,

          onChanged: onchanged,
          decoration: InputDecoration(
              fillColor: ksecondary,
              filled: true,
              hintStyle: const TextStyle(color:ksecondary,fontSize: 16),
              enabledBorder:  OutlineInputBorder(
                  borderRadius:BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    color:Color(0xffC8C5CB),
                  )
              ),
              focusedBorder:  OutlineInputBorder(
                  borderRadius:BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    color:Color(0xffC8C5CB),
                  )
              )
          ),
        ),
      ],
    );
  }
}
