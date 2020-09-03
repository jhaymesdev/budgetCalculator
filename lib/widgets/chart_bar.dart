import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double spendingAmount;
  final double spendingPcntTotal;

  ChartBar(this.label,this.spendingAmount,this.spendingPcntTotal);
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
       FittedBox(child: Text("\$${spendingAmount.toStringAsFixed(0)}")),
        SizedBox(height: 4,),
        Container(
          height: 60,
          width: 10,
          child:Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blueGrey,width: 1.0),
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(10)
                ),
              ),
              FractionallySizedBox(heightFactor: spendingPcntTotal,child: Container(
                decoration: BoxDecoration(color: Colors.amber,
                    borderRadius: BorderRadius.circular(10)
                ),
              ),)
            ],
          ),
        ),
        SizedBox(height: 4,),
        Text(label)
      ],
    );
  }
}
