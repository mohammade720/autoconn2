import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';

class CompanyProfileScreen extends StatefulWidget {
  const CompanyProfileScreen({super.key});

  @override
  State<CompanyProfileScreen> createState() => _CompanyProfileScreenState();
}

class _CompanyProfileScreenState extends State<CompanyProfileScreen> {
  String? _selectedState;
  final List<String> _states = ['Goa', 'Gujarat','Delhi',];

  final TextEditingController _companyNameController = TextEditingController();
  final TextEditingController _emailAddressController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _websiteController = TextEditingController();
  final TextEditingController _address1Controller = TextEditingController();
  final TextEditingController _address2Controller = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _zipCodeController = TextEditingController();

  File? _selectedImage;
  final ImagePicker _picker = ImagePicker();

  @override
  void dispose() {
   _companyNameController.dispose();
   _emailAddressController.dispose();
   _phoneNumberController.dispose();
   _websiteController.dispose();
   _address1Controller.dispose();
   _address2Controller.dispose();
   _cityController.dispose();
   _zipCodeController.dispose();
   super.dispose();
  }

  Future<void> _pickImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _selectedImage = File(image.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          SizedBox(
            height: 200,
            child: Stack(
              children: [
                Positioned(
                  top: 17,
                  left: 0,
                  right: 0,
                  child: Container(
                    height: 124,
                    width: 124,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: const Color(0xFFD9D9D9),
                      image: _selectedImage != null
                        ? DecorationImage(
                        image: FileImage(_selectedImage!),
                        fit: BoxFit.cover,
                      )
                      : null,
                    ),
                  ),
                ),
                Positioned(
                  top: 119,
                  left: 0,
                  right: 0,
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: const Color(0xFFD9D9D9),
                      border: Border.all(
                        color: Colors.white,
                        width: 4.0,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 130,
                  left: 0,
                  right: 0,
                  child: GestureDetector(
                    onTap: _pickImage,
                    child: const Icon(
                      Icons.camera_alt,
                      size: 20,
                      color: Color(0xFF125DB7),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                _buildTextFieldContainer(),
                const SizedBox(height: 16),
                _buildAddressContainer(),
                const SizedBox(height: 36),
                _buildSaveButton(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSaveButton() {
    return SizedBox(
      width: MediaQuery.of(context).size.width - 32,
      height: 36,
      child: ElevatedButton(
        onPressed: () {
          print("Company Name: ${_companyNameController.text}");
          print("Email Address: ${_emailAddressController.text}");
          print("Phone Number: ${_phoneNumberController.text}");
          print("Website: ${_websiteController.text}");
          print("Address 1: ${_address1Controller.text}");
          print("Address 2: ${_address2Controller.text}");
          print("Selected State: ${_selectedState ?? 'None Selected'}");
          print("City: ${_cityController.text}");
          print("Zip Code: ${_zipCodeController.text}");
        },
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: const Color(0xFFEAB308),
        ),
        child: const Text(
          'Save detail',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildTextFieldContainer() {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFFFFFFF),
        borderRadius: BorderRadius.circular(4),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          const SizedBox(height: 16),
          _buildTextField('Company Name', controller: _companyNameController),
          const SizedBox(height: 16),
          _buildTextField('Email Address', controller: _emailAddressController, prefixIcon: Icons.alternate_email),
          const SizedBox(height: 16),
          _buildTextField('Phone number', controller: _phoneNumberController, prefixIcon: Icons.phone),
          const SizedBox(height: 16),
          _buildTextField('Website', controller: _websiteController, prefixIcon: Icons.public),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  Widget _buildAddressContainer() {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFFFFFFF),
        borderRadius: BorderRadius.circular(4),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          const SizedBox(height: 16),
          _buildTextField('Address Line (1)', controller: _address1Controller, prefixIcon: Icons.location_on),
          const SizedBox(height: 16),
          _buildTextField('Address Line (2)', controller: _address2Controller, prefixIcon: Icons.location_on),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: _buildStateDropdown(),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: _buildTextField('City', controller: _cityController),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: _buildTextField('Zip code', controller: _zipCodeController),
              ),
              const SizedBox(width: 16),
              Expanded(child: Container()),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStateDropdown() {
    return DropdownButtonFormField<String>(
      decoration: const InputDecoration(
        labelText: 'State',
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xFF172157),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xFF172157),
            width: 0.5,
          ),
        ),
      ),
      value: _selectedState,
      items: _states.map((state) {
        return DropdownMenuItem<String>(
          value: state,
          child: Text(state),
        );
      }).toList(),
      onChanged: (newValue) {
        setState(() {
          _selectedState = newValue;
        });
      },
    );
  }

  Widget _buildTextField(String label, {IconData? prefixIcon, required TextEditingController controller}) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xFF172157),
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xFF172157),
            width: 0.5,
          ),
        ),
        prefixIcon: prefixIcon != null
            ? Icon(
          prefixIcon,
          size: 20,
        )
            : null,
      ),
    );
  }
}

