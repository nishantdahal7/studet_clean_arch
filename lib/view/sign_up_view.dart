import 'package:flutter/material.dart';

class SignUpVIew extends StatefulWidget {
  const SignUpVIew({Key? key}) : super(key: key);

  @override
  _SignUpVIewState createState() => _SignUpVIewState();
}

class _SignUpVIewState extends State<SignUpVIew> {
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _additionalTextFieldController =
      TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final List<String> _selectedCourses = [];

  final List<String> _batches = [
    '29A',
    '29B',
    '30A',
    '30B',
    '31A',
    '31B',
  ];

  @override
  void dispose() {
    _fullNameController.dispose();
    _phoneNumberController.dispose();
    _additionalTextFieldController.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _onCourseSelected(bool selected, String course) {
    setState(() {
      if (selected) {
        _selectedCourses.add(course);
      } else {
        _selectedCourses.remove(course);
      }
    });
  }

  void _showCoursesDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Select Courses'),
          content: Wrap(
            children: [
              _buildCourseChip('Course A'),
              _buildCourseChip('Course B'),
              _buildCourseChip('Course C'),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Sign Up',
              style: TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _fullNameController,
              decoration: const InputDecoration(labelText: 'First Name'),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _phoneNumberController,
              decoration: const InputDecoration(labelText: 'Last Name'),
              keyboardType: TextInputType.phone,
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _additionalTextFieldController,
              decoration: const InputDecoration(labelText: 'Contact Number'),
            ),
            const SizedBox(height: 10),
            DropdownButtonFormField<String>(
              onChanged: (newValue) {
                setState(() {
                  // _selectedBatch = newValue;
                });
              },
              decoration: const InputDecoration(labelText: 'Batch'),
              items: _batches.map((batch) {
                return DropdownMenuItem<String>(
                  value: batch,
                  child: Text(batch),
                );
              }).toList(),
            ),
            const SizedBox(height: 10),
            TextFormField(
              readOnly: true,
              onTap: _showCoursesDialog,
              decoration: InputDecoration(
                labelText: 'Courses',
                suffixIcon: IconButton(
                  onPressed: _showCoursesDialog,
                  icon: const Icon(Icons.search),
                ),
              ),
              initialValue: _selectedCourses.join(', '),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _usernameController,
              decoration: const InputDecoration(labelText: 'Username'),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Sign Up'),
            ),
            const SizedBox(height: 10),
            TextButton(
              onPressed: () {
                Navigator.pop(context, '/login');
              },
              child: const Text('Already have an account? Login'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCourseChip(String course) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Chip(
        label: Text(course),
        deleteIcon: const Icon(Icons.close),
        onDeleted: () {
          _onCourseSelected(false, course);
        },
        deleteIconColor: Colors.grey,
        backgroundColor: Colors.grey[300],
        labelStyle: const TextStyle(color: Colors.black),
      ),
    );
  }
}
