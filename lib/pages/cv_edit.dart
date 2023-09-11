import 'package:flutter/material.dart';
import 'cv_data.dart';

class CVEditScreen extends StatefulWidget {
  final CVData initialCVData;
  final Function(CVData) onSave;

  const CVEditScreen({required this.initialCVData, required this.onSave, Key? key}) : super(key: key);

  @override
  _CVEditScreenState createState() => _CVEditScreenState();
}

class _CVEditScreenState extends State<CVEditScreen> {
  late TextEditingController fullNameController;
  late TextEditingController slackUsernameController;
  late TextEditingController githubHandleController;
  late TextEditingController personalBioController;
  late TextEditingController technicalSkillsController;
  late TextEditingController languageProficiencyController;

  @override
  void initState() {
    super.initState();
    fullNameController = TextEditingController(text: widget.initialCVData.fullName);
    slackUsernameController = TextEditingController(text: widget.initialCVData.slackUsername);
    githubHandleController = TextEditingController(text: widget.initialCVData.githubHandle);
    personalBioController = TextEditingController(text: widget.initialCVData.personalBio);
    technicalSkillsController = TextEditingController(text: widget.initialCVData.technicalSkills);
    languageProficiencyController = TextEditingController(text: widget.initialCVData.languageProficiency);
  }

  @override
  void dispose() {
    fullNameController.dispose();
    slackUsernameController.dispose();
    githubHandleController.dispose();
    personalBioController.dispose();
    technicalSkillsController.dispose();
    languageProficiencyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit CV'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: fullNameController,
                decoration: InputDecoration(labelText: 'Full Name'),
              ),
              TextFormField(
                controller: slackUsernameController,
                decoration: InputDecoration(labelText: 'Slack Username'),
              ),
              TextFormField(
                controller: githubHandleController,
                decoration: InputDecoration(labelText: 'GitHub Handle'),
              ),
              TextFormField(
                controller: personalBioController,
                decoration: InputDecoration(labelText: 'Personal Bio'),
                maxLines: 3,
              ),
              TextFormField(
                controller: technicalSkillsController,
                decoration: InputDecoration(labelText: 'Technical Skills'), // Corrected
              ),
              TextFormField(
                controller: languageProficiencyController,
                decoration: InputDecoration(labelText: 'Language Proficiency'), // Corrected
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  final updatedCV = CVData(
                    fullName: fullNameController.text,
                    slackUsername: slackUsernameController.text,
                    githubHandle: githubHandleController.text,
                    personalBio: personalBioController.text,
                    technicalSkills: technicalSkillsController.text, // Corrected
                    languageProficiency: languageProficiencyController.text, // Corrected
                  );
                  widget.onSave(updatedCV);

                  Navigator.pop(context);
                },
                child: Text('Save'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
