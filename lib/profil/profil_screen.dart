import 'package:flutter/material.dart';

class ProfilScreen extends StatefulWidget {
  const ProfilScreen({super.key});

  @override
  _ProfilScreenState createState() => _ProfilScreenState();
}

class _ProfilScreenState extends State<ProfilScreen> {
  final _formKey = GlobalKey<FormState>();
  bool _hasChanged = false;

  // Controllers for text fields
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();

  // This function will be called when any field is modified
  void _onFieldChanged() {
    setState(() {
      _hasChanged = true;
    });
  }

  // Function to submit the form
  void _submitForm() {
    if (_formKey.currentState!.validate()) {
        
      // Save the form and perform update action
      _formKey.currentState!.save();
      
      // Hide the check icon
      setState(() {
        _hasChanged = false;
      });
      
      // Perform submission logic here
      print('Form submitted');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profile'),
        centerTitle: true,
        actions: [
          // Show check button only when fields have changed
          if (_hasChanged)
            IconButton(
              icon: const Icon(Icons.check),
              onPressed: _submitForm,
            ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
          child: Form(
            key: _formKey,
            onChanged: _onFieldChanged,
            child: Column(
              children: [
                // Profile picture and update button
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 100,),
                  child: Container(
                    height: 120,
                    width: 120,
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(80),
                    ),
                  ),
                ),
                const SizedBox(height: 20,),
                Container(
                  height: 35,
                  width: 180,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: const Color(0xFFFF6600),
                      width: 1,
                    ),
                  ),
                  child: const Center(
                    child: Text(
                      "Update Profile",
                      style: TextStyle(
                        color: Color(0xFFFF6600),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 30),

                // Last Name and First Name
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("Last Name"),
                          const SizedBox(height: 5),
                          TextFormField(
                            controller: _lastNameController,
                            decoration: InputDecoration(
                              hintText: "Last Name",
                              constraints: const BoxConstraints.expand(height: 45),
                              filled: true,
                              fillColor: Colors.grey[200],
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide: BorderSide.none,
                              ),
                            ),
                            onChanged: (value) => _onFieldChanged(),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your last name';
                              }
                              return null;
                            },
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 15),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("First Name"),
                          const SizedBox(height: 5),
                          TextFormField(
                            controller: _firstNameController,
                            decoration: InputDecoration(
                              hintText: "First Name",
                              constraints: const BoxConstraints.expand(height: 45),
                              filled: true,
                              fillColor: Colors.grey[200],
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide: BorderSide.none,
                              ),
                            ),
                            onChanged: (value) => _onFieldChanged(),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your first name';
                              }
                              return null;
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 15),

                // Email
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Email"),
                    const SizedBox(height: 5),
                    TextFormField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        hintText: "Email",
                        constraints: const BoxConstraints.expand(height: 45),
                        filled: true,
                        fillColor: Colors.grey[200],
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide.none,
                        ),
                      ),
                      onChanged: (value) => _onFieldChanged(),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email';
                        } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                          return 'Please enter a valid email address';
                        }
                        return null;
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 15),

                // Gender and Date of Birth
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("Gender"),
                          const SizedBox(height: 5),
                          TextFormField(
                            controller: _genderController,
                            decoration: InputDecoration(
                              hintText: "Gender",
                              constraints: const BoxConstraints.expand(height: 45),
                              filled: true,
                              fillColor: Colors.grey[200],
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide: BorderSide.none,
                              ),
                            ),
                            onChanged: (value) => _onFieldChanged(),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your gender';
                              }
                              return null;
                            },
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 15),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("Date of Birth"),
                          const SizedBox(height: 5),
                          TextFormField(
                            controller: _dobController,
                            decoration: InputDecoration(
                              hintText: "Date of Birth",
                              constraints: const BoxConstraints.expand(height: 45),
                              filled: true,
                              fillColor: Colors.grey[200],
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide: BorderSide.none,
                              ),
                            ),
                            onChanged: (value) => _onFieldChanged(),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your date of birth';
                              }
                              return null;
                            },
                          ),
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
  }
}
