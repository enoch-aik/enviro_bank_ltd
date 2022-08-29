import 'package:enviro_bank_ltd/export.dart';
import 'package:intl/intl.dart';

class KDateFormField extends StatefulWidget {
  final TextEditingController date;
  final String labelText;

  const KDateFormField({Key? key, required this.date, required this.labelText})
      : super(key: key);

  @override
  State<KDateFormField> createState() => _KDateFormFieldState();
}

class _KDateFormFieldState extends State<KDateFormField> {
  @override
  void initState() {
    widget.date.text = ""; //set the initial value of text field
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70.h,
      child: TextFormField(
        controller: widget.date,
        style: GoogleFonts.openSans(
            fontSize: 15.sp, color: CustomColors.textColorLight2),
        decoration: InputDecoration(
          helperText: '',
          labelText: widget.labelText,
          counter: const SizedBox(height: 0),
        ),
        readOnly: true,
        validator: (value) {
          if (value!.isEmpty) {
            return 'This field is required';
          }
          return null;
        },
        onTap: () async {
          DateTime? pickedDate = await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(2000),
              lastDate: DateTime(2101));

          if (pickedDate != null) {
            String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);

            setState(() {
              widget.date.text = formattedDate;
            });
          } else {}
        },
      ),
    );
  }
}
