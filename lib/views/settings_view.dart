import 'package:flutter/material.dart';
import 'package:southsea_cinema/constants.dart';
import 'package:southsea_cinema/widgets/primary_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({super.key});

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  // Keys for SharedPreferences
  static const _nameKey = 'cinema_profile_name';
  static const _emailKey = 'cinema_profile_email';
  static const _phoneKey = 'cinema_profile_phone';
  static const _addressKey = 'cinema_profile_address';
  static const _newsletterKey = 'cinema_newsletter_preference';

  // Form key
  final _formKey = GlobalKey<FormState>();

  // Controllers and state
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _addressController = TextEditingController();
  bool _isSaving = false;
  bool _newsletterSelected = false;

  @override
  void initState() {
    super.initState();
    _loadPreferences();
  }

  Future<void> _loadPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    if (!mounted) return;
    setState(() {
      _nameController.text = prefs.getString(_nameKey) ?? '';
      _emailController.text = prefs.getString(_emailKey) ?? '';
      _phoneController.text = prefs.getString(_phoneKey) ?? '';
      _addressController.text = prefs.getString(_addressKey) ?? '';
      _newsletterSelected = prefs.getBool(_newsletterKey) ?? false;
    });
  }

  Future<void> _savePreferences() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_nameKey, _nameController.text);
    await prefs.setString(_emailKey, _emailController.text);
    await prefs.setString(_phoneKey, _phoneController.text);
    await prefs.setString(_addressKey, _addressController.text);
    await prefs.setBool(_newsletterKey, _newsletterSelected);
  }

  void _handleSave() {
    if (_isSaving) return;
    if (_formKey.currentState!.validate()) {
      setState(() => _isSaving = true);
      _savePreferences();
      if (mounted) {
        setState(() => _isSaving = false);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Profile saved successfully!'),
            backgroundColor: cinemaBrand,
          ),
        );
      }
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _addressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Settings'),
        backgroundColor: cinemaSurface,
        iconTheme: const IconThemeData(color: cinemaBrand),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildNameField(),
              const SizedBox(height: 20),
              _buildEmailField(),
              const SizedBox(height: 20),
              _buildPhoneField(),
              const SizedBox(height: 20),
              _buildAddressField(),
              const SizedBox(height: 30),
              _buildNewsletterCheckbox(),
              const SizedBox(height: 40),
              _buildSaveButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNameField() {
    return TextFormField(
      controller: _nameController,
      decoration: const InputDecoration(
        labelText: 'Full Name',
        labelStyle: TextStyle(color: cinemaFontMuted),
        hintText: 'Enter your full name',
        border: OutlineInputBorder(),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your name';
        }
        return null;
      },
    );
  }

  Widget _buildEmailField() {
    return TextFormField(
      controller: _emailController,
      decoration: const InputDecoration(
        labelText: 'Email Address',
        labelStyle: TextStyle(color: cinemaFontMuted),
        hintText: 'you@example.com',
        border: OutlineInputBorder(),
        suffixIcon: Icon(Icons.email, color: cinemaBrand),
      ),
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your email';
        }
        if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
          return 'Please enter a valid email address';
        }
        return null;
      },
    );
  }

  Widget _buildPhoneField() {
    return TextFormField(
      controller: _phoneController,
      decoration: const InputDecoration(
        labelText: 'Phone Number',
        labelStyle: TextStyle(color: cinemaFontMuted),
        hintText: '+1 555 123 4567',
        border: OutlineInputBorder(),
        suffixIcon: Icon(Icons.phone, color: cinemaBrand),
      ),
      keyboardType: TextInputType.phone,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your phone number';
        }
        return null;
      },
    );
  }

  Widget _buildAddressField() {
    return TextFormField(
      controller: _addressController,
      decoration: const InputDecoration(
        labelText: 'Address',
        labelStyle: TextStyle(color: cinemaFontMuted),
        hintText: 'Street, City, State, ZIP',
        border: OutlineInputBorder(),
        suffixIcon: Icon(Icons.location_on, color: cinemaBrand),
      ),
      maxLines: 2,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your address';
        }
        return null;
      },
    );
  }

  Widget _buildNewsletterCheckbox() {
    return Row(
      children: [
        Theme(
          data: Theme.of(context).copyWith(
            unselectedWidgetColor: cinemaBrand,
          ),
          child: Checkbox(
            value: _newsletterSelected,
            onChanged: (bool? value) {
              setState(() {
                _newsletterSelected = value!;
              });
            },
          ),
        ),
        const Expanded(
          child: Text(
            'Subscribe to cinema news and offers',
            style: TextStyle(color: cinemaFontWhite),
          ),
        ),
      ],
    );
  }

  Widget _buildSaveButton() {
    return SizedBox(
      width: double.infinity,
      child: PrimaryButton(
        label: 'Save Changes',
        onPressed: _handleSave,
      ),
    );
  }
}