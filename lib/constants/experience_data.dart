class Experience {
  final String company;
  final String role;
  final String duration;
  final String description;
  final List<String> highlights;
  final List<String> technologies;
  final String? companyUrl;

  const Experience({
    required this.company,
    required this.role,
    required this.duration,
    required this.description,
    this.highlights = const [],
    this.technologies = const [],
    this.companyUrl,
  });
}

const List<Experience> experiences = [
  Experience(
    company: 'NRev AI',
    role: 'Software Engineer',
    duration: 'Jul 2023 — Present',
    description:
        'Building AI-powered GTM workflow automation platform for RevOps teams and GTM leaders at B2B SaaS companies.',
    highlights: [
      'Building autonomous AI agents for go-to-market automation',
      'Developing no-code workflow engine replacing multiple point tools',
      'Working on AI-native features with GTM data models',
    ],
    technologies: ['Go', 'AI/ML', 'Microservices'],
    companyUrl: 'https://nrev.ai',
  ),
  Experience(
    company: 'Bobble AI',
    role: 'Software Engineer',
    duration: 'Dec 2021 — Jul 2023',
    description:
        'Worked on AI-powered keyboard application serving 100M+ users with expression tools and smart compose features.',
    highlights: [
      'Awarded "Best Performer" (Oct 2022 — Mar 2023)',
      'Contributed to platform serving 100M+ users',
      'Worked on AI image processing and language modeling features',
    ],
    technologies: ['Dart', 'Flutter', 'AI'],
    companyUrl: 'https://bobble.ai',
  ),
  Experience(
    company: 'Avo Automation',
    role: 'Product Developer',
    duration: 'Jan 2021 — Dec 2021',
    description:
        'Built enterprise no-code test automation platform supporting 200+ enterprise technologies.',
    highlights: [
      'Developed AI-powered test automation features',
      'Worked on no-code platform for end-to-end automated testing',
      'Promoted from intern to full-time product developer',
    ],
    technologies: ['Web', 'Automation', 'Enterprise'],
    companyUrl: 'https://avoautomation.com',
  ),
  Experience(
    company: 'SLK',
    role: 'Summer Intern',
    duration: 'May 2020 — Jul 2020',
    description:
        'IT and digital transformation company providing analytics and AI services.',
    highlights: [
      'Developed the update server for the Desktop Application',
    ],
    technologies: ['Node.js', 'Desktop'],
    companyUrl: 'https://slksoftware.com',
  ),
  Experience(
    company: 'Qin1',
    role: 'Robotics Intern',
    duration: 'May 2019 — Dec 2019',
    description: 'Robotics internship focused on perception and automation.',
    highlights: [
      'Worked on robotics projects in Noida',
    ],
    technologies: ['Robotics', 'Python'],
  ),
];
