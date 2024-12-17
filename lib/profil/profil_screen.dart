import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../features/auth/presentation/bloc/auth_bloc.dart';

class ProfilScreen extends StatefulWidget {
  const ProfilScreen({super.key});

  @override
  _ProfilScreenState createState() => _ProfilScreenState();
}

class _ProfilScreenState extends State<ProfilScreen> {
  final _formKey = GlobalKey<FormState>();
  bool _isEditMode = false;

  // User information
  String _fullName = "Jane Doe";
  String _email = "johndoe@example.com";
  String _gender = "male";
  String _token = "";
  DateTime? _dateOfBirth = DateTime(1990, 1, 1);

  // Controllers
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _fullNameController.text = _fullName;
    _emailController.text = _email;
    _dobController.text = _dateOfBirth != null
        ? DateFormat('dd/MM/yyyy').format(_dateOfBirth!)
        : '';
  }

  void _toggleEditMode() {
    setState(() {
      _isEditMode = !_isEditMode;

      // Reset controllers to current values when entering edit mode
      _fullNameController.text = _fullName;
      _emailController.text = _email;
      _dobController.text = _dateOfBirth != null
          ? DateFormat('dd/MM/yyyy').format(_dateOfBirth!)
          : '';
    });
  }

  void _saveChanges() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _fullName = _fullNameController.text;
        _email = _emailController.text;
        _isEditMode = false;
      });
    }
  }

  // Future<void> _selectDate(BuildContext context) async {
  //   final DateTime? picked = await showDatePicker(
  //     context: context,
  //     initialDate: _dateOfBirth ?? DateTime.now(),
  //     firstDate: DateTime(1900),
  //     lastDate: DateTime.now(),
  //   );
  //   if (picked != null && picked != _dateOfBirth) {
  //     setState(() {
  //       _dateOfBirth = picked;
  //       _dobController.text = DateFormat('dd/MM/yyyy').format(picked);
  //     });
  //   }
  // }

  void _pickProfileImage() {
    // TODO: Implement image picking logic
    print('Pick profile image');
  }

  void _logout() {

    // Dispatch LogoutEvent to AuthBloc
  context.read<AuthBloc>().add(LogoutEvent());
  
  // Optional: Navigate to login screen or initial screen
  // You might want to add navigation logic depending on your app's structure
  // For example:
  // Navigator.of(context).pushReplacement(MaterialPageRoute(
  //   builder: (context) => LoginScreen()
  // ));
    //print('Logout');
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
      // Mettre à jour les informations si un utilisateur est connecté
      if (state is AuthSuccess && state.user != null) {

        _token = state.user!.token!;
        _fullName = state.user!.touristUserName ?? state.user!.touristName;
        _fullNameController.text = _fullName;

        _email = state.user!.email ?? _email;
        _emailController.text = _email;

        // Vous pouvez ajouter d'autres champs si disponibles dans votre modèle utilisateur
        // Par exemple :
        // _gender = state.user['gender'] ?? _gender;
        // _dateOfBirth = state.user['dateOfBirth'] != null
        //   ? DateTime.parse(state.user['dateOfBirth'])
        //   : _dateOfBirth;
      }
      return Scaffold(
        appBar: AppBar(
          title: const Text('Profile'),
          centerTitle: true,
          actions: [
            if (!_isEditMode)
              IconButton(
                icon: const Icon(Icons.edit),
                onPressed: _toggleEditMode,
              ),
            if (_isEditMode)
              IconButton(
                icon: const Icon(Icons.check),
                onPressed: _saveChanges,
              ),
            IconButton(
              icon: const Icon(Icons.logout),
              onPressed: _logout,
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  // Token
                  Text(_token),
                  // Profile picture with camera icon
                  GestureDetector(
                    onTap: _isEditMode ? _pickProfileImage : null,
                    child: Stack(
                      children: [
                        Container(
                          height: 120,
                          width: 120,
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(80),
                          ),
                        ),
                        if (_isEditMode)
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: Container(
                              decoration: BoxDecoration(
                                color: const Color(0xFFFF6600),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              padding: const EdgeInsets.all(8),
                              child: const Icon(
                                Icons.camera_alt,
                                color: Colors.white,
                                size: 20,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Full Name
                  _buildProfileField(
                    label: "Full Name",
                    controller: _fullNameController,
                    hint: "Full Name",
                    enabled: _isEditMode,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your full name';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 15),

                  // Email
                  _buildProfileField(
                    label: "Email",
                    controller: _emailController,
                    hint: "Email",
                    enabled: _isEditMode,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+')
                          .hasMatch(value)) {
                        return 'Please enter a valid email address';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 15),

                  // Gender and Date of Birth Row
                  Row(
                    children: [
                      // Gender Selection
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("Gender"),
                            const SizedBox(height: 5),
                            _buildGenderSelector(),
                          ],
                        ),
                      ),
                      const SizedBox(width: 15),
                      // Date of Birth
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("Date of Birth"),
                            const SizedBox(height: 5),
                            _buildDateOfBirthField(context),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }

  // Helper method to create consistent profile fields
  Widget _buildProfileField({
    required String label,
    required TextEditingController controller,
    required String hint,
    required String? Function(String?)? validator,
    bool enabled = true,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label),
        const SizedBox(height: 5),
        TextFormField(
          controller: controller,
          decoration: InputDecoration(
            hintText: hint,
            constraints: const BoxConstraints.expand(height: 45),
            filled: true,
            fillColor: enabled ? Colors.white : Colors.grey[200],
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(color: Colors.grey[300]!),
            ),
          ),
          enabled: enabled,
          validator: enabled ? validator : null,
        ),
      ],
    );
  }

  // Gender Selector Widget
  Widget _buildGenderSelector() {
    return Row(
      children: [
        _buildGenderIcon(
          icon: Icons.male,
          isSelected: _gender == 'male',
          onTap: _isEditMode
              ? () {
                  setState(() {
                    _gender = 'male';
                  });
                }
              : null,
        ),
        const SizedBox(width: 15),
        _buildGenderIcon(
          icon: Icons.female,
          isSelected: _gender == 'female',
          onTap: _isEditMode
              ? () {
                  setState(() {
                    _gender = 'female';
                  });
                }
              : null,
        ),
      ],
    );
  }

  // Gender Icon Widget
  Widget _buildGenderIcon({
    required IconData icon,
    required bool isSelected,
    VoidCallback? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isSelected ? const Color(0xFFFF6600) : Colors.grey[200],
        ),
        child: Icon(
          icon,
          color: isSelected ? Colors.white : Colors.grey,
          size: 30,
        ),
      ),
    );
  }

  // Date of Birth Field
  Widget _buildDateOfBirthField(BuildContext context) {
    return TextFormField(
      controller: _dobController,
      decoration: InputDecoration(
        hintText: "DD/MM/YYYY",
        suffixIcon: _isEditMode
            ? IconButton(
                icon: const Icon(Icons.calendar_today),
                onPressed: () => _selectDate(context),
              )
            : null,
        constraints: const BoxConstraints.expand(height: 45),
        filled: true,
        fillColor: _isEditMode ? Colors.white : Colors.grey[200],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(color: Colors.grey[300]!),
        ),
      ),
      enabled: _isEditMode,
      keyboardType: TextInputType.number,
      onChanged: (value) {
        // Format input as DD/MM/YYYY
        if (value.length == 2 && !value.contains('/')) {
          _dobController.text = '$value/';
          _dobController.selection = TextSelection.fromPosition(
              TextPosition(offset: _dobController.text.length));
        }
        if (value.length == 5 && value.split('/').length == 2) {
          _dobController.text = '$value/';
          _dobController.selection = TextSelection.fromPosition(
              TextPosition(offset: _dobController.text.length));
        }
      },
      validator: _isEditMode
          ? (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your date of birth';
              }

              // Validate format
              final parts = value.split('/');
              if (parts.length != 3) {
                return 'Invalid date format. Use DD/MM/YYYY';
              }

              // Validate day (1-31)
              final day = int.tryParse(parts[0]);
              if (day == null || day < 1 || day > 31) {
                return 'Invalid day. Must be between 1 and 31';
              }

              // Validate month (1-12)
              final month = int.tryParse(parts[1]);
              if (month == null || month < 1 || month > 12) {
                return 'Invalid month. Must be between 1 and 12';
              }

              // Validate year (not future)
              final year = int.tryParse(parts[2]);
              final currentYear = DateTime.now().year;
              if (year == null || year > currentYear) {
                return 'Invalid year. Cannot be in the future';
              }

              return null;
            }
          : null,
    );
  }

// Modify the _selectDate method to use the text field's date
  Future<void> _selectDate(BuildContext context) async {
    // Try to parse the existing date from the text field
    DateTime initialDate = DateTime.now();
    try {
      final parts = _dobController.text.split('/');
      if (parts.length == 3) {
        initialDate = DateTime(
            int.parse(parts[2]), int.parse(parts[1]), int.parse(parts[0]));
      }
    } catch (_) {}

    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (picked != null) {
      setState(() {
        _dateOfBirth = picked;
        _dobController.text = DateFormat('dd/MM/yyyy').format(picked);
      });
    }
  }
}
