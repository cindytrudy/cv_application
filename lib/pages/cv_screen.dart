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
    githubHandle: 'Cindytrudy',
    personalBio: '''
      Hello, I'm Achu Ijeoma Cynthia, a dedicated and results-driven mobile app developer. With a keen eye for detail and a passion for clean, efficient code, I create user-focused mobile applications that meet diverse business objectives. Proficient in Dart, Flutter, and Firebase, I'm committed to staying at the forefront of innovative mobile technologies. When I'm not coding, you'll find me exploring new programming challenges and expanding my skill set. Let's connect and build something amazing together
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
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Full Name
              Center(
                child: Text(
                  cvData.fullName,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 20),

              // Slack Username
              _buildInfoRow(Icons.person, 'Slack Username:', cvData.slackUsername),

              // GitHub Handle
              _buildInfoRow(Icons.link, 'GitHub Handle:', cvData.githubHandle),

              // Personal Bio
              _buildSectionHeader('Personal Bio'),
              Text(
                cvData.personalBio,
                style: TextStyle(fontSize: 16),
              ),

              // Technical Skills
              _buildSectionHeader('Technical Skills'),
              Container(
                height: 120, // Set a fixed height to prevent overflow
                child: _buildBulletList(cvData.technicalSkills.split(', ')),
              ),

              // Language Proficiency
              _buildSectionHeader('Language Proficiency'),
              Container(
                height: 80, // Set a fixed height to prevent overflow
                child: _buildBulletList(cvData.languageProficiency.split(', ')),
              ),

              // Edit CV Button
              SizedBox(height: 30),
              Center(
                child: ElevatedButton(
                  onPressed: () async {
                    final updatedCV = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CVEditScreen(
                          initialCVData: cvData,
                        ),
                      ),
                    );

                    if (updatedCV != null) {
                      setState(() {
                        // Update the CV data in real-time
                        cvData = updatedCV;
                      });
                    }
                  },
                  child: Text('Edit CV'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        children: [
          Icon(icon, size: 18, color: Colors.blue),
          SizedBox(width: 10),
          Text(
            label,
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(width: 10),
          Text(
            value,
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0, bottom: 10),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.blue,
        ),
      ),
    );
  }

  Widget _buildBulletList(List<String> items) {
    return ListView(
      shrinkWrap: true,
      children: items.map((item) {
        return Padding(
          padding: const EdgeInsets.only(left: 16.0, bottom: 4.0),
          child: Row(
            children: [
              Icon(Icons.arrow_right, size: 18, color: Colors.blue),
              SizedBox(width: 10),
              Flexible(
                child: Text(
                  item,
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: CVScreen(),
  ));
}
