import 'package:flutter/material.dart';
import 'package:sigset_xtc/widgets/card_widget.dart';
import 'package:sigset_xtc/widgets/button_app_widget.dart';
import 'package:sigset_xtc/widgets/footer_widget.dart';
import 'package:sigset_xtc/widgets/form_input_widget.dart';
import 'package:sigset_xtc/widgets/header_widget.dart';

class CreatePostPage extends StatefulWidget {
  const CreatePostPage({super.key});

  @override
  State<CreatePostPage> createState() => _CreatePostPageState();
}

class _CreatePostPageState extends State<CreatePostPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  DateTime? _selectedDate;
  bool _showPreview = false;

  void _pickDate() async {
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      setState(() {
        _selectedDate = pickedDate;
      });
    }
  }

  void _togglePreview() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _showPreview = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            HeaderWidget(),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),
                  Form(
                    key: _formKey,
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("Título",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          const SizedBox(height: 8),
                          FormInputWidget(
                            placeholderText: "Título de la publicación",
                            textEditingController: _titleController,
                          ),
                          const SizedBox(height: 16),
                          const Text("Fecha",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              Text(
                                _selectedDate != null
                                    ? "${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}"
                                    : "Selecciona una fecha",
                                style: const TextStyle(fontSize: 16),
                              ),
                              const Spacer(),
                              IconButton(
                                icon: const Icon(Icons.calendar_today),
                                onPressed: _pickDate,
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          const Text("Descripción",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          const SizedBox(height: 8),
                          FormInputWidget(
                            placeholderText: "Escribe la descripción...",
                            textEditingController: _descriptionController,
                          ),
                          const SizedBox(height: 16),
                          ButtonAppWidget(
                            text: "Preview",
                            onPressed: _togglePreview,
                          ),
                          const SizedBox(height: 16),
                          if (_showPreview)
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                const Text("Vista Previa",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                                const SizedBox(height: 8),
                                CardWidget(
                                  title: _titleController.text,
                                  date: _selectedDate != null
                                      ? "${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}"
                                      : "Sin fecha",
                                  description: _descriptionController.text,
                                ),
                                const SizedBox(height: 16),
                                ButtonAppWidget(
                                  text: "Crear Publicación",
                                  onPressed: () {},
                                  bgColor: const Color.fromARGB(255, 189, 130, 9),
                                ),
                              ],
                            ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: FooterWidget(),
    );
  }
}
