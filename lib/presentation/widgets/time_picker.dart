import 'package:flutter/material.dart';

class TimePicker extends StatefulWidget {
  final ValueChanged<TimeOfDay> onChange;
  TimeOfDay? value = TimeOfDay.now();
  String? label;

  TimePicker({super.key, required this.onChange, this.value, this.label});

  @override
  State<TimePicker> createState() => _TimePickerState();
}

class _TimePickerState extends State<TimePicker> {
  TimeOfDay selectedTime = TimeOfDay.now();


  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
    context: context,
    initialTime: selectedTime,
  );

  if (picked != null && picked != selectedTime) {
    setState(() {
      selectedTime = picked;
    });
    widget.onChange(picked);  // Wywołanie metody onChange po zmianie godziny
  }
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: (){
        _selectTime(context);
      },
      controller: TextEditingController(text: selectedTime.format(context)),
      readOnly: true,
      decoration: InputDecoration(
        labelText: widget.label,
        suffixIcon: const Icon(Icons.access_time),
      ),
    );
  }
}
