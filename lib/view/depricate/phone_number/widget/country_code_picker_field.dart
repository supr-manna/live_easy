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
            color: MyColor.grayColor,
          ),
          prefixIcon: GestureDetector(
            onTap: () {
              showCountryPicker(
                context: context,
                showPhoneCode: true,
                onSelect: (Country country) {
                  setState(() {
                    selectedCountryCode = "+${country.phoneCode}";
                    selectedFlag = country.flagEmoji;
                  });
                },
              );
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    selectedFlag,
                    style: const TextStyle(fontSize: 18),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    selectedCountryCode,
                    style: const TextStyle(fontSize: 16),
                  ),
                  const Icon(Icons.arrow_drop_down),
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
