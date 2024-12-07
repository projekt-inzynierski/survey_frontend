import 'package:flutter/material.dart';

class TimePicker extends StatefulWidget {
  final ValueChanged<TimeOfDay> onChange;
  TimeOfDay value = TimeOfDay.now();
  final String? label;

  TimePicker({super.key, required this.onChange, required this.value, this.label});

  @override
  State<TimePicker> createState() => _TimePickerState();
}

class _TimePickerState extends State<TimePicker> {
  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
    context: context,
    initialTime: widget.value,
  );

  if (picked != null && picked != widget.value) {
    setState(() {
      widget.value = picked;
    });
    widget.onChange(picked);
  }
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: (){
        _selectTime(context);
      },
      controller: TextEditingController(text: widget.value.format(context)),
      readOnly: true,
      decoration: InputDecoration(
        labelText: widget.label,
        suffixIcon: const Icon(Icons.access_time),
      ),
    );
  }
}
