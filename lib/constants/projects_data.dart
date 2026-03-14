class Project {
  final String title;
  final String description;
  final List<String> technologies;
  final String? githubUrl;
  final String? liveUrl;
  final int? stars;

  const Project({
    required this.title,
    required this.description,
    required this.technologies,
    this.githubUrl,
    this.liveUrl,
    this.stars,
  });
}

/// All projects in a single list, ordered by importance.
const List<Project> projects = [
  Project(
    title: 'Bored',
    description: 'An entertainment app for when you\'re bored.',
    technologies: ['Dart', 'Flutter'],
    githubUrl: 'https://github.com/DakshDB/iambored',
    liveUrl: 'https://bored.dakshbhatia.com',
    stars: 2,
  ),
  Project(
    title: 'ToolGrid',
    description:
        'Central hub for 50+ developer utilities — text processing, encoding/decoding, code formatting, generators, network tools.',
    technologies: ['Web', 'Developer Tools'],
    liveUrl: 'https://toolgrid.dev',
  ),
  Project(
    title: 'Sandesh',
    description: 'A modern email application.',
    technologies: ['Web'],
    liveUrl: 'https://sandesh.email',
  ),
  Project(
    title: 'Wrongs.ai',
    description:
        'AI-powered advisory platform delivering expert-level, actionable guidance with safety by design.',
    technologies: ['Next.js', 'AI'],
    liveUrl: 'https://wrongs.ai',
  ),
  Project(
    title: 'Sachin.run',
    description:
        'Interactive scroll experience through Sachin Tendulkar\'s 34,357 career runs — a digital tribute to the God of Cricket.',
    technologies: ['Next.js', 'React', 'Tailwind CSS'],
    liveUrl: 'https://sachin.run',
  ),
  Project(
    title: 'TypeGhost',
    description:
        'A touch typing mastery application to improve typing speed and accuracy.',
    technologies: ['Web', 'JavaScript'],
    liveUrl: 'https://typeghost.dakshbhatia.com',
  ),
  Project(
    title: 'go-db',
    description: 'A database project built with Go.',
    technologies: ['Go'],
    githubUrl: 'https://github.com/DakshDB/go-db',
  ),
  Project(
    title: 'simple_alert_box',
    description: 'A simple and customizable alert box package for Flutter.',
    technologies: ['Dart', 'Flutter'],
    githubUrl: 'https://github.com/DakshDB/simple_alert_box',
  ),
  Project(
    title: 'flutter_image_cropper',
    description: 'Flutter widget for image cropping.',
    technologies: ['Dart', 'Flutter'],
    githubUrl: 'https://github.com/DakshDB/flutter_image_cropper',
    stars: 1,
  ),
  Project(
    title: 'remove_background',
    description: 'Dart package for removing image backgrounds.',
    technologies: ['Dart', 'Flutter', 'Image Processing'],
    githubUrl: 'https://github.com/DakshDB/remove_background',
    stars: 4,
  ),
];
