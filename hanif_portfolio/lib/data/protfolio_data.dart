import 'models/experience_model.dart';
import 'models/package_model.dart';
import 'models/project_model.dart';

class PortfolioData {
  static const String name = 'Hanif Uddin';
  static const String title = 'Senior Flutter Developer & Team Lead';
  static const String email = 'hanifuddin.dev@gmail.com';
  static const String phone = '+8801963978074';
  static const String location = '2no road, Chad Uddan, Dhaka, Bangladesh';
  static const String github = 'https://github.com/hanifuddin15';

  static const List<ProjectModel> projects = [
    ProjectModel(
      title: 'Cripton Pro (Cripton ERP)',
      tagLine: 'Cloud-Based Enterprise Resource Planning & HRIS Ecosystem',
      description:
          'Spearheaded the end-to-end architecture and multi-platform deployment of an enterprise suite integrating biometric attendance, vehicle fleet management (VMS), and multi-tier approval workflows.',
      techStack: [
        'Flutter',
        'Clean Architecture',
        'BLoC',
        'GetX',
        'REST API',
        'SQLite',
        'FCM'
      ],
      highlights: [
        'Biometric Employee Attendance & automated multi-level SSP workflows',
        'Vehicle Management System (VMS) tracking & product requisition modules',
        'Analytics dashboards & document viewing with zero performance degradation',
      ],
      appStoreUrl: 'https://apps.apple.com/us/app/cripton-erp/id6478108512',
      playStoreUrl:
          'https://play.google.com/store/apps/details?id=com.worknestor.criptonpro',
    ),
    ProjectModel(
      title: 'Quantum Possibilities',
      tagLine: 'High-Scale Social Network & Crypto Ecosystem',
      description:
          'Architected a social media platform supporting millions of users with live video streaming, reels feed engine, peer interactions, and built-in crypto payments.',
      techStack: [
        'Flutter',
        'MVC',
        'GetX',
        'Socket.IO',
        'RTMP',
        'Crypto Wallet',
        'FCM',
        'Deep Links'
      ],
      highlights: [
        'RTMP live streaming engine & short-form video reels playback',
        'Multi-gateway payment checkout (SSLCOMMERZ, Stripe, Crypto)',
        'CI/CD automated release pipeline via GitHub Actions',
      ],
      appStoreUrl: 'https://apps.apple.com/ae/app/qposs/id6753131108',
      playStoreUrl:
          'https://play.google.com/store/apps/details?id=com.quanumpossibilities.qp',
    ),
    ProjectModel(
      title: 'QP Messenger',
      tagLine: 'Ultra Low-Latency WebRTC Chat & Calling App',
      description:
          'Engineered a scalable messaging platform delivering real-time group conversations, file streaming, voice and video conferencing.',
      techStack: [
        'Flutter',
        'GetX',
        'Socket.IO',
        'WebRTC',
        'Method Channel',
        'FCM'
      ],
      highlights: [
        'P2P HD Voice & Video calls via custom WebRTC implementation',
        'Real-time typing indicators, message delivery status, & presence',
        'Native platform channels for background call handling',
      ],
      appStoreUrl: 'https://apps.apple.com/ae/app/qposs-messenger/id6753579477',
      playStoreUrl:
          'https://play.google.com/store/apps/details?id=com.qp.messenger',
    ),
    ProjectModel(
      title: 'MemeVerse',
      tagLine: 'AI-Powered Community & Content Generation Platform',
      description:
          'Social platform integrating generative AI models to curate dynamic meme captioning, template generation, and algorithmic feed delivery.',
      techStack: [
        'Flutter',
        'Clean Architecture',
        'BLoC',
        'Vertex AI',
        'Firebase',
        'Supabase',
        'Genkit'
      ],
      highlights: [
        'Integrated Google Vertex AI for intelligent meme prompt completions',
        'Dual-cloud architecture utilizing Supabase storage and Firebase functions',
        'Algorithmic personalized content delivery stream',
      ],
    ),
    ProjectModel(
      title: 'AUSTTAA (Alumni Network)',
      tagLine: 'Cross-Platform Community & Career Hub',
      description:
          'Community application for textile engineers facilitating networking, hiring boards, events, and real-time private discussions.',
      techStack: [
        'Flutter',
        'GetX',
        'REST API',
        'Firestore',
        'SQLite',
        'AdMob'
      ],
      highlights: [
        'Event management, job portal, and real-time direct messaging',
        'Offline caching and resilient local data sync with SQLite',
      ],
      playStoreUrl: 'https://surl.li/mumvnt',
    ),
    ProjectModel(
      title: 'ShopySwiss E-Commerce',
      tagLine: 'High-Converting Multi-Platform Retail Application',
      description:
          'Full-featured consumer shopping app with cart state management, checkout flows, live tracking, and localized content delivery.',
      techStack: [
        'Flutter',
        'Clean Architecture',
        'BLoC',
        'REST API',
        'Firebase',
        'SQLite'
      ],
      highlights: [
        'Cart state synchronization with local SQLite persistence',
        'Comprehensive order tracking with push notification triggers',
      ],
      playStoreUrl: 'https://surl.lt/csekbf',
    ),
  ];

  static const List<ExperienceModel> experiences = [
    ExperienceModel(
      role: 'Senior Mobile App Developer (Sr Executive) & Team Lead',
      company: 'Pakiza Software Limited',
      period: 'June 2024 – Present',
      bullets: [
        'Lead mobile engineering sprint teams to architect and launch enterprise ERPs (Cripton Pro, VMS, FAKIR ERP, PayGhor, Worknestor, Patrol Guard, CTG WASA).',
        'Designed modular Clean Architecture workflows for automated multi-level SSP approvals, real-time attendance, and vehicle fleet management.',
        'Spearheaded production releases on both Google Play Store and Apple App Store with zero downtime CI/CD automation.',
      ],
      techStack: [
        'Flutter',
        'Dart',
        'Clean Architecture',
        'BLoC',
        'GetX',
        'Socket.IO',
        'WebRTC',
        'GraphQL'
      ],
    ),
    ExperienceModel(
      role: 'Mobile App Developer (Software Engineer)',
      company: 'Dinnova AG Ltd.',
      period: 'Jan 2024 – May 2024',
      bullets: [
        'Engineered cross-platform mobile apps for iOS and Android including Shopy-Swiss (E-Commerce) and Shine (Dating App).',
        'Implemented shopping cart architecture, order status webhooks, and push notification triggers.',
        'Conducted continuous code refactoring, performance profiling, and memory leak mitigation.',
      ],
      techStack: [
        'Flutter',
        'Bloc',
        'Clean Architecture',
        'REST APIs',
        'Firebase'
      ],
    ),
    ExperienceModel(
      role: 'Junior Mobile App Developer',
      company: 'CRID USA Ltd',
      period: 'Sep 2022 – Dec 2023',
      bullets: [
        'Built and deployed Kambaii Health Provider app across iOS and Android.',
        'Engineered healthcare provider scheduling workflows and HIPAA-compliant patient communication tools.',
      ],
      techStack: ['Flutter', 'Bloc', 'Firebase', 'SQLite'],
    ),
  ];

  static const List<PackageModel> packages = [
    PackageModel(
      name: 'super_search_delegate',
      description:
          'A flexible, highly customizable search delegate with dynamic filtering algorithms and custom UI builders.',
      downloads: '400+ Downloads',
      url: 'https://pub.dev/packages/super_search_delegate',
    ),
    PackageModel(
      name: 'universal_dropdown',
      description:
          'Generic, high-performance dropdown widget supporting single/multi selection, debounced search, and custom items.',
      downloads: '500+ Downloads',
      url: 'https://pub.dev/packages/universal_dropdown',
    ),
  ];

  static const Map<String, List<String>> skills = {
    'Languages': ['Dart', 'C', 'Swift', 'C++', 'C#', 'SQL'],
    'Architecture': [
      'Clean Architecture',
      'SOLID Principles',
      'BLoC Pattern',
      'GetX',
      'MVC',
      'MVVM'
    ],
    'Real-time & Media': [
      'WebRTC',
      'Socket.IO',
      'RTMP Streaming',
      'Method Channels',
      'Push Notifications (FCM)'
    ],
    'Backend & Cloud': [
      'REST APIs',
      'GraphQL',
      'Firebase (Auth, Firestore, Cloud Functions)',
      'Supabase',
      'SQLite',
      'Hive'
    ],
    'DevOps & Tools': [
      'CI/CD (GitHub Actions)',
      'FVM',
      'Fastlane',
      'Git',
      'SourceTree',
      'Postman'
    ],
  };
}
