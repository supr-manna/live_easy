import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';

import '../../../../constraint/my_color.dart';

class CountryCodePickerTextField extends StatefulWidget {
  /** CallBack function which return PhoneNumber */
  final Function(String, String) onPhoneNumberChanged;

  const CountryCodePickerTextField({super.key, required this.onPhoneNumberChanged});

  @override
  _CountryCodePickerTextFieldState createState() =>
      _CountryCodePickerTextFieldState();
}

class _CountryCodePickerTextFieldState extends State<CountryCodePickerTextField> {
  String selectedCountryCode = "+91"; // Default country code
  String selectedFlag = "🇮🇳"; // Default country flag (India)
  final TextEditingController phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: double.infinity,
      child: TextField(
        keyboardType: TextInputType.phone,
        controller: phoneNumberController,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderSide: BorderSide(color: MyColor.grayColor),
          ),
          labelText: 'Please Enter phoneNumber',
          labelStyle: TextStyle(
            color: MyColor.grayColor, // Set the label color to gray
          ),
          prefixIcon: GestureDetector(
            onTap: () {
              showCountryPicker(
                context: context,
                showPhoneCode: true, // Show phone code
                onSelect: (Country country) {
                  setState(() {
                    selectedCountryCode = "+${country.phoneCode}";
                    selectedFlag = country.flagEmoji; // Get the country flag emoji
                  });
                },
              );
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    selectedFlag, // Display the selected country flag
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(width: 8),
                  Text(
                    selectedCountryCode, // Display the selected country code
                    style: TextStyle(fontSize: 16),
                  ),
                  Icon(Icons.arrow_drop_down), // Drop-down icon
                ],
              ),
            ),
          ),
        ),
        onChanged: (value) {
          widget.onPhoneNumberChanged(selectedCountryCode, value);
        },
      ),
    );
  }
}
