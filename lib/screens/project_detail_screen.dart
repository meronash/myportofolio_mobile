import 'package:flutter/material.dart';
import 'package:myportofolio_mobile/models/project.dart';

class ProjectDetailScreen extends StatelessWidget {
  final Project project;

  const ProjectDetailScreen({
    super.key,
    required this.project,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(project.title),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (project.projectImageUrl.isNotEmpty)
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  project.projectImageUrl,
                  width: double.infinity,
                  height: 220,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return const SizedBox(
                      height: 100,
                      child: Center(
                        child: Text('Failed to load project image.'),
                      ),
                    );
                  },
                ),
              ),

            const SizedBox(height: 16),

            Text(
              project.title,
              style: Theme.of(context).textTheme.headlineMedium,
            ),

            const SizedBox(height: 12),

            Text(
              'Tech Stack',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            Text(project.techStack),

            const SizedBox(height: 16),

            Text(
              'Description',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            Text(project.description),

            const SizedBox(height: 16),

            Text(
              'Project URL',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            SelectableText(project.projectUrl),
          ],
        ),
      ),
    );
  }
}
