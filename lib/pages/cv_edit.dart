import 'package:flutter/material.dart';
import 'cv_data.dart';

class CVEditScreen extends StatelessWidget {
  final CVData initialCVData;

  const CVEditScreen({required this.initialCVData, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController fullNameController = TextEditingController(text: initialCVData.fullName);
    final TextEditingController slackUsernameController = TextEditingController(text: initialCVData.slackUsername);
    final TextEditingController githubHandleController = TextEditingController(text: initialCVData.githubHandle);
    final TextEditingController personalBioController = TextEditingController(text: initialCVData.personalBio);
    final TextEditingController technicalSkillsController = TextEditingController(text: initialCVData.technicalSkills);
    final TextEditingController languageProficiencyController = TextEditingController(text: initialCVData.languageProficiency);

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
                decoration: InputDecoration(labelText: 'Technical Skills'),
              ),
              TextFormField(
                controller: languageProficiencyController,
                decoration: InputDecoration(labelText: 'Language Proficiency'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  final updatedCV = CVData(
                    fullName: fullNameController.text,
                    slackUsername: slackUsernameController.text,
                    githubHandle: githubHandleController.text,
                    personalBio: personalBioController.text,
                    technicalSkills: technicalSkillsController.text,
                    languageProficiency: languageProficiencyController.text,
                  );

                  Navigator.pop(context, updatedCV); // Pass the updated data back
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
