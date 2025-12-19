import 'package:flutter/material.dart';

class TaskForm extends StatefulWidget {
  const TaskForm({super.key});

  @override
  State<TaskForm> createState() => _TaskFormState();
}

class _TaskFormState extends State<TaskForm> {
  final TextEditingController _dateController = TextEditingController();

  Future<void> _selectDateTime(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.dark(
              primary: Color(0xFF215FD6),
              onPrimary: Colors.white,
              onSurface: Colors.white,
              surface: Color(0xFF2C2C2C),
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: const Color(0xFF215FD6),
              ),
            ),
          ),
          child: child!,
        );
      },
    );

    if (pickedDate != null) {
      if (!context.mounted) return;
      final TimeOfDay? pickedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
        builder: (context, child) {
          return Theme(
            data: Theme.of(context).copyWith(
              timePickerTheme: const TimePickerThemeData(
                backgroundColor: Color(0xFF2C2C2C),
                hourMinuteColor: Color(0xFF424242),
                hourMinuteTextColor: Colors.white,
                dayPeriodColor: Color(0xFF215FD6),
                dayPeriodTextColor: Colors.white,
                dialHandColor: Color(0xFF215FD6),
                dialBackgroundColor: Color(0xFF424242),
              ),
              textButtonTheme: TextButtonThemeData(
                style: TextButton.styleFrom(
                  foregroundColor: const Color(0xFF215FD6),
                ),
              ),
            ),
            child: child!,
          );
        },
      );

      if (pickedTime != null) {
        final DateTime finalDateTime = DateTime(
          pickedDate.year,
          pickedDate.month,
          pickedDate.day,
          pickedTime.hour,
          pickedTime.minute,
        );

        String formattedDate =
            "${finalDateTime.year}-${finalDateTime.month.toString().padLeft(2, '0')}-${finalDateTime.day.toString().padLeft(2, '0')} ${finalDateTime.hour.toString().padLeft(2, '0')}:${finalDateTime.minute.toString().padLeft(2, '0')}";

        setState(() {
          _dateController.text = formattedDate;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    const Color backgroundColor = Color(0xFF2C2C2C);
    const Color inputFillColor = Color(0xFF424242);
    const Color buttonColor = Color(0xFF215FD6);
    const Color hintTextColor = Colors.white54;

    final InputDecoration commonInputDecoration = InputDecoration(
      filled: true,
      fillColor: inputFillColor,
      hintStyle: const TextStyle(color: hintTextColor),
      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4),
        borderSide: BorderSide.none,
      ),
    );

    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Add Task",
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Form(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                    style: const TextStyle(color: Colors.white),
                    decoration: commonInputDecoration.copyWith(
                      hintText: "Task Name",
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    style: const TextStyle(color: Colors.white),
                    decoration: commonInputDecoration.copyWith(
                      hintText: "Task Description",
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _dateController,
                    readOnly: true,
                    onTap: () => _selectDateTime(context),
                    style: const TextStyle(color: Colors.white),
                    decoration: commonInputDecoration.copyWith(
                      hintText: "YYYY-MM-DD HH:MM",
                      suffixIcon: const Icon(
                        Icons.calendar_today,
                        color: Colors.white54,
                        size: 18,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: buttonColor,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                      child: const Text(
                        "Add Reminder",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
