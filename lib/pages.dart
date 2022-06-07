import 'package:flutter/material.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({Key? key}) : super(key: key);

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  DateTimeRange dateRange = DateTimeRange(
    start: DateTime.now(),
    end: DateTime.now().add(const Duration(days: 1)),
  );
  @override
  Widget build(BuildContext context) {
    final start = dateRange.start;
    final end = dateRange.end;
    final difference = dateRange.duration;
    return Scaffold(
      body: Column(
        children: [
          Container(
            child: Text('Date Range'),
          ),
          SizedBox(
            height: 16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                  child: ElevatedButton(
                child: Text('${start.year}/${start.month}/${start.day}'),
                onPressed: pickDataRange,
              )),
              SizedBox(width: 12),
              Expanded(
                  child: ElevatedButton(
                child: Text('${start.year}/${start.month}/${start.day}'),
                onPressed: pickDataRange,
              )),
            ],
          ),
          SizedBox(
            height: 16,
          ),
          Text('Difference ${difference.inDays}')
        ],
      ),
    );
  }

  Future pickDataRange() async {
    DateTimeRange? newDataRange = await showDateRangePicker(
        context: context,
        firstDate: DateTime(1900),
        lastDate: DateTime(2100),
        initialDateRange: dateRange);
    if (newDataRange == null) return; //pressed x
    setState((() => dateRange = newDataRange));
  }
}
