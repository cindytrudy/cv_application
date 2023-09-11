import 'package:flutter/material.dart';
import 'cv_edit.dart';
import 'cv_data.dart';

class CVScreen extends StatefulWidget {
  const CVScreen({Key? key}) : super(key: key);

  @override
  _CVScreenState createState() => _CVScreenState();
}

class _CVScreenState extends State<CVScreen> {
  CVData cvData = CVData(
    fullName: 'Achu Ijeoma Cynthia',
    slackUsername: 'Ij_Trudy',
    githubHandle: 'https://github.com/cindytrudy',
    personalBio: '''
      A logical and result-driven mobile app developer who is dedicated to building user-focused mobile apps for customers with various business objectives. Proficient in Dart, Flutter, and Firebase, as well as writing clean, readable, and testable code. Passionate about learning innovative new mobile technologies.
    ''',
    technicalSkills: 'Teamwork and Collaboration, Efficiency in documentation, Effective communicator, Detail-oriented',
    languageProficiency: 'Dart, Flutter, Firebase',
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My CV'),
      ),
      body: Center( // Center the content
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildInfoRow(Icons.person, 'Full Name:', cvData.fullName),
              _buildInfoRow(Icons.message, 'Slack Username:', cvData.slackUsername),
              _buildInfoRow(Icons.link, 'GitHub Handle:', cvData.githubHandle),
              Container(
                margin: EdgeInsets.only(bottom: 10),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blue, width: 2),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Technical Skills:',
                      style: TextStyle(fontSize: 18, color: Colors.blue), // Blue color for heading
                    ),
                    _buildBulletList(cvData.technicalSkills.split(', ')), // Split skills and create bullet points
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 10),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.green, width: 2), // Green border for language proficiency
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Language Proficiency:',
                      style: TextStyle(fontSize: 18, color: Colors.green), // Green color for heading
                    ),
                    _buildBulletList(cvData.languageProficiency.split(', ')), // Split languages and create bullet points
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 10),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blue, width: 2),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Personal Bio:',
                      style: TextStyle(fontSize: 18),
                    ),
                    Text(
                      cvData.personalBio,
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  // Navigate to the CV edit screen
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CVEditScreen(
                        initialCVData: cvData,
                        onSave: (updatedCV) {
                          setState(() {
                            // Update the CV data in real-time
                            cvData = updatedCV;
                          });
                        },
                      ),
                    ),
                  );
                },
                child: Text('Edit CV'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String label, String value) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blue, width: 2),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, size: 18),
              SizedBox(width: 10),
              Text(
                label,
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
          Text(
            value,
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }

  Widget _buildBulletList(List<String> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: items.map((item) {
        return Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Row(
            children: [
              Icon(Icons.arrow_right, size: 16, color: Colors.blue), // Blue bullet point
              SizedBox(width: 10),
              Text(
                item,
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}
