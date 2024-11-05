// ignore_for_file: avoid_bool_literals_in_conditional_expressions

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Calendar extends StatelessWidget {
  const Calendar({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: CustomDateRangePicker(),
        ),
      ),
    );
  }
}

class CustomDateRangePicker extends StatefulWidget {
  const CustomDateRangePicker({
    super.key,
    this.minDate,
    this.maxDate,
    this.selectedColor = Colors.teal,
    this.onStartDateSelected,
    this.onEndDateSelected,
  });

  final DateTime? minDate;
  final DateTime? maxDate;
  final Color selectedColor;
  final void Function(DateTime)? onStartDateSelected;
  final void Function(DateTime)? onEndDateSelected;

  @override
  CustomDateRangePickerState createState() => CustomDateRangePickerState();
}

class CustomDateRangePickerState extends State<CustomDateRangePicker> {
  DateTime? _startDate;
  DateTime? _endDate;
  late DateTime _currentDate;

  @override
  void initState() {
    super.initState();
    _currentDate = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    final dateFormat =
        DateFormat.yMMMM(Localizations.localeOf(context).toString());
    final monthWidgets = <Widget>[];

    var monthIterator = DateTime(_currentDate.year, _currentDate.month);
    while (monthIterator.isBefore(
      widget.maxDate ?? _currentDate.add(const Duration(days: 365)),
    )) {
      monthWidgets.add(_buildMonthWidget(monthIterator, dateFormat));
      monthIterator = DateTime(monthIterator.year, monthIterator.month + 1);
    }

    return Column(
      children: monthWidgets,
    );
  }

  Widget _buildMonthWidget(DateTime month, DateFormat dateFormat) {
    final dayWidgets = <Widget>[];
    final daysOfWeek = DateFormat.E(Localizations.localeOf(context).toString())
        .dateSymbols
        .STANDALONESHORTWEEKDAYS;
    final daysInMonth = DateUtils.getDaysInMonth(month.year, month.month);

    for (var i = 0; i < daysOfWeek.length; i++) {
      dayWidgets.add(
        Center(child: Text(daysOfWeek[i].substring(0, 1).toUpperCase())),
        // Expanded(child: Center(child: Text(daysOfWeek[i].substring(0, 1)))),
      );
    }

    for (var i = 1; i <= daysInMonth; i++) {
      final date = DateTime(month.year, month.month, i);
      dayWidgets.add(_buildDayWidget(date));
    }

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8),
          child: Text(
            dateFormat.format(month),
            // .capitalizeFirstLetter()
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        GridView.count(
          crossAxisCount: 7,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          children: dayWidgets,
        ),
      ],
    );
  }

  Widget _buildDayWidget(DateTime date) {
    final isSelected = _startDate != null &&
        _endDate != null &&
        date.isAfter(_startDate!.subtract(const Duration(days: 1))) &&
        date.isBefore(_endDate!.add(const Duration(days: 1)));

    final isInRange = _startDate != null &&
        _endDate == null &&
        date.isAfter(_startDate!.subtract(const Duration(days: 1))) &&
        date.isBefore(_startDate!.add(const Duration(days: 1)));
    final isStartOrEndSelected = (_startDate != null && _endDate != null)
        ? (date.isAtSameMomentAs(_startDate!) ||
                date.isAtSameMomentAs(_endDate!))
            ? true
            : false
        : false;

    return GestureDetector(
      onTap: () => _onDateSelected(date),
      child: Container(
        margin: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: isStartOrEndSelected
              ? widget.selectedColor.withOpacity(1)
              : isSelected
                  ? widget.selectedColor.withOpacity(0.5)
                  : (isInRange
                      ? widget.selectedColor.withOpacity(0.5)
                      : Colors.transparent),
          borderRadius: BorderRadius.circular(1000),
        ),
        child:  Center(
          child: Text(date.day.toString(),),
          // AppText(
          //   date.day.toString(),
          //   color: isSelected || isInRange
          //       ? Theme.of(context).colorScheme.onPrimary
          //       : Theme.of(context).colorScheme.onSurface,
          // ),
        ),
      ),
    );
  }

  void _onDateSelected(DateTime date) {
    setState(() {
      if (_startDate == null || (_startDate != null && _endDate != null)) {
        _startDate = date;
        _endDate = null;
        widget.onStartDateSelected?.call(date);
      } else if (_endDate == null) {
        if (date.isAfter(_startDate!)) {
          _endDate = date;
          widget.onEndDateSelected?.call(date);
        } else {
          _startDate = date;
          _endDate = null;
          widget.onStartDateSelected?.call(date);
        }
      }
    });
  }
}
