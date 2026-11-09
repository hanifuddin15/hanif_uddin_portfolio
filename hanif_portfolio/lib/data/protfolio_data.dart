import 'package:flutter/material.dart';
import '../core/constants/app_assets.dart';
import '../core/constants/app_links.dart';
import 'models/experience_model.dart';
import 'models/package_model.dart';
import 'models/project_model.dart';
import 'models/skill_model.dart';

class PortfolioData {
  static const String name = 'Hanif Uddin';
  static const String title = 'Senior Flutter Developer & Team Lead';
  static const String email = 'hanifuddin.dev@gmail.com';
  static const String phone = '+8801963978074';
  static const String location = '2no road, Chad Uddan, Dhaka, Bangladesh';
  static const String github = AppLinks.github;
  static const String linkedin = AppLinks.linkedin;
  static const String whatsapp = AppLinks.whatsapp;
  static const String resumeUrl = AppLinks.resume;

  static const List<ProjectModel> projects = [
    ProjectModel(
      title: 'Cripton Pro (Cripton ERP)',
      tagLine: 'Cloud-Based Enterprise Resource Planning & HRIS Ecosystem',
      description:
          'Spearheaded the end-to-end architecture and multi-platform deployment of an enterprise suite integrating biometric attendance, vehicle fleet management (VMS), and multi-tier approval workflows.',
      category: 'Enterprise ERP',
      impactMetric: '10K+ Active Workforce',
      imageUrl: AppAssets.erp,
      gradientColors: [Color(0xFF0D47A1), Color(0xFF00E5FF)],
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
      appStoreUrl: AppLinks.criptonErpAppStore,
      playStoreUrl: AppLinks.criptonErpPlayStore,
    ),
    ProjectModel(
      title: 'Quantum Possibilities',
      tagLine: 'High-Scale Social Network & Crypto Ecosystem',
      description:
          'Architected a social media platform supporting millions of users with live video streaming, reels feed engine, peer interactions, and built-in crypto payments.',
      category: 'Social & Crypto',
      impactMetric: '100K+ Engagements',
      imageUrl: AppAssets.qp,
      gradientColors: [Color(0xFF6200EA), Color(0xFFE040FB)],
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
      appStoreUrl: AppLinks.qpAppStore,
      playStoreUrl: AppLinks.qpPlayStore,
    ),
    ProjectModel(
      title: 'QP Messenger',
      tagLine: 'Ultra Low-Latency WebRTC Chat & Calling App',
      description:
          'Engineered a scalable messaging platform delivering real-time group conversations, file streaming, voice and video conferencing.',
      category: 'WebRTC & Media',
      impactMetric: '<100ms Voice/Video Latency',
      imageUrl: AppAssets.messenger,
      gradientColors: [Color(0xFF00B0FF), Color(0xFF00E676)],
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
      appStoreUrl: AppLinks.qpMessengerAppStore,
      playStoreUrl: AppLinks.qpMessengerPlayStore,
    ),
    ProjectModel(
      title: 'SqueezePix',
      tagLine: 'Batch Image Compression, Optimization & Format Converter',
      description:
          'High-efficiency mobile utility for multithreaded image compression, aspect ratio resizing, and lossless WebP/JPEG conversion with isolate background execution.',
      category: 'Utility & Tools',
      impactMetric: 'Up to 90% Size Reduction',
      imageUrl: AppAssets.squeezePix,
      gradientColors: [Color(0xFF6A11CB), Color(0xFF2575FC)],
      techStack: [
        'Flutter',
        'Dart Isolates',
        'Method Channels',
        'Riverpod',
        'Clean Architecture',
        'Scoped Storage'
      ],
      highlights: [
        'Multithreaded background processing using Dart Isolates for zero UI jank',
        'Lossless and lossy compression engine with real-time before/after preview',
        'Batch gallery exporter supporting WebP, PNG, and JPEG formatting',
      ],
      playStoreUrl: AppLinks.squeezePixPlayStore,
    ),
    ProjectModel(
      title: 'Kambaii Health Provider',
      tagLine:
          'HIPAA-Compliant Clinical Telehealth & Provider Scheduling Suite',
      description:
          'Healthcare provider application designed for licensed clinicians to manage patient schedules, conduct secure telemedicine consultations, and synchronize encrypted medical charts.',
      category: 'Healthcare & Telehealth',
      impactMetric: 'HIPAA Compliant Provider Suite',
      imageUrl: AppAssets.kambaiiHealth,
      gradientColors: [Color(0xFF0072FF), Color(0xFF00C6FF)],
      techStack: [
        'Flutter',
        'BLoC',
        'WebRTC',
        'Firebase',
        'SQLite',
        'REST API'
      ],
      highlights: [
        'Encrypted peer-to-peer telemedicine consultations with live vitals telemetry',
        'Automated doctor shift management, e-prescription generation, and patient queues',
        'Resilient offline patient record caching with encrypted local SQLite persistence',
      ],
      playStoreUrl: AppLinks.kambaiiHealthPlayStore,
    ),
    ProjectModel(
      title: 'Pakiza LMS (Education Suite)',
      tagLine: 'Institutional Learning Management & Interactive Video Platform',
      description:
          'Scalable educational platform supporting live classes, video course delivery with adaptive bitrate streaming, interactive quiz modules, and offline lesson downloads.',
      category: 'EdTech & LMS',
      impactMetric: '15K+ Active Learners',
      imageUrl: AppAssets.lms,
      gradientColors: [Color(0xFFFF512F), Color(0xFFDD2476)],
      techStack: [
        'Flutter',
        'Clean Architecture',
        'BLoC',
        'HLS / RTMP',
        'REST API',
        'SQLite',
        'FCM'
      ],
      highlights: [
        'Adaptive HLS video streaming lecture player with playback speed and resume features',
        'Interactive quiz engine with timer controls, randomized question banks, and instant grading',
        'Background lecture download manager enabling full offline coursework study',
      ],
    ),
    ProjectModel(
      title: 'Nusa (Multi-Vendor Marketplace)',
      tagLine: 'High-Volume E-Commerce, Lifestyle & Multi-Vendor Hub',
      description:
          'Cross-platform retail marketplace connecting verified merchants and consumers with real-time delivery tracking, multi-gateway payments, and localized catalogs.',
      category: 'E-Commerce & Retail',
      impactMetric: 'Multi-Vendor Ecosystem',
      imageUrl: AppAssets.nusa,
      gradientColors: [Color(0xFF11998E), Color(0xFF38EF7D)],
      techStack: [
        'Flutter',
        'GetX',
        'REST API',
        'Payment Gateways',
        'Google Maps SDK',
        'FCM'
      ],
      highlights: [
        'Merchant storefront architecture with dynamic categorization and real-time inventory',
        'Live order dispatch tracking integrated with Google Maps SDK and courier updates',
        'Seamless multi-gateway payment checkout with automated refund webhooks',
      ],
      playStoreUrl: AppLinks.nusaPlayStore,
    ),
    ProjectModel(
      title: 'MemeVerse',
      tagLine: 'AI-Powered Community & Content Generation Platform',
      description:
          'Social platform integrating generative AI models to curate dynamic meme captioning, template generation, and algorithmic feed delivery.',
      category: 'AI & Social',
      impactMetric: 'Generative AI Integrated',
      imageUrl: AppAssets.memeVerse,
      gradientColors: [Color(0xFFFF3D00), Color(0xFFFFD600)],
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
      category: 'Community & Alumni',
      impactMetric: '5K+ Alumni Connected',
      imageUrl: AppAssets.austtaa,
      gradientColors: [Color(0xFF2E7D32), Color(0xFF00E676)],
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
      appStoreUrl: AppLinks.austtaaAppStore,
      playStoreUrl: AppLinks.austtaaPlayStore,
    ),
    ProjectModel(
      title: 'ShopySwiss E-Commerce',
      tagLine: 'High-Converting Multi-Platform Retail Application',
      description:
          'Full-featured consumer shopping app with cart state management, checkout flows, live tracking, and localized content delivery.',
      category: 'E-Commerce & Retail',
      impactMetric: '4.9★ App Store Rating',
      imageUrl: AppAssets.shopySwiss,
      gradientColors: [Color(0xFFD50000), Color(0xFFFF5252)],
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
      appStoreUrl: AppLinks.shopySwissAppStore,
      playStoreUrl: AppLinks.shopySwissPlayStore,
    ),
  ];

  static const List<SkillModel> skillsList = [
    SkillModel(
      name: 'Flutter & Dart Framework',
      category: 'Mobile & Architecture',
      proficiency: 0.98,
      experience: '4+ Years',
      level: 'Lead / Master',
      tags: ['Cross-Platform', 'Null Safety', 'Animations', 'RenderObjects'],
      description:
          'Deep expertise in Flutter rendering pipeline, custom painters, platform channels, performance profiling, and memory leak elimination.',
    ),
    SkillModel(
      name: 'Clean Architecture & SOLID',
      category: 'Mobile & Architecture',
      proficiency: 0.96,
      experience: '3+ Years',
      level: 'Lead Architect',
      tags: ['Clean Code', 'UseCases', 'Dependency Injection', 'Repository'],
      description:
          'Production-tested architecture separating presentation, domain, and data layers for multi-developer sprint scalability.',
    ),
    SkillModel(
      name: 'BLoC Pattern & Riverpod',
      category: 'Mobile & Architecture',
      proficiency: 0.95,
      experience: '3+ Years',
      level: 'Production Expert',
      tags: ['Cubit', 'StateNotifier', 'Reactive Streams', 'Testable State'],
      description:
          'Predictable, reactive state orchestration with immutable state flows and comprehensive unit test coverage.',
    ),
    SkillModel(
      name: 'WebRTC Audio & Video Calling',
      category: 'Real-time & Media',
      proficiency: 0.92,
      experience: '2+ Years',
      level: 'Advanced Specialist',
      tags: ['P2P Calling', 'Mesh/SFU', 'STUN/TURN', 'CallKeep Native'],
      description:
          'Engineered sub-100ms ultra low-latency P2P calling, SDP handshake negotiation, and iOS CallKit / Android ConnectionService.',
    ),
    SkillModel(
      name: 'Socket.IO & Real-Time Sync',
      category: 'Real-time & Media',
      proficiency: 0.94,
      experience: '2.5+ Years',
      level: 'Production Expert',
      tags: ['Live Chat', 'Presence', 'Typing Indicators', 'Auto Reconnect'],
      description:
          'Real-time bi-directional event streaming with resilient reconnection loops, message queuing, and offline delivery.',
    ),
    SkillModel(
      name: 'RTMP Live Video Streaming',
      category: 'Real-time & Media',
      proficiency: 0.88,
      experience: '1.5+ Years',
      level: 'Specialist',
      tags: ['Live Broadcast', 'Reels Feed', 'Video Caching', 'Bitrate Adapt'],
      description:
          'Live stream broadcasting engine and TikTok-style smooth reels player with prefetching and adaptive resolution.',
    ),
    SkillModel(
      name: 'REST APIs & GraphQL',
      category: 'Backend & Cloud',
      proficiency: 0.95,
      experience: '4+ Years',
      level: 'Production Expert',
      tags: ['Dio Interceptors', 'Token Refresh', 'Caching', 'Error Handling'],
      description:
          'Robust network layer architecture with automatic JWT token refresh, idempotent retry mechanisms, and cache-first strategies.',
    ),
    SkillModel(
      name: 'Firebase & Supabase Ecosystem',
      category: 'Backend & Cloud',
      proficiency: 0.92,
      experience: '3+ Years',
      level: 'Expert',
      tags: ['FCM Push', 'Firestore', 'Auth', 'Edge Functions', 'PostgreSQL'],
      description:
          'Cloud-native backend integration with push notification pipelines, real-time Firestore listeners, and Supabase SQL data.',
    ),
    SkillModel(
      name: 'Local DB (SQLite, Hive, Isar)',
      category: 'Backend & Cloud',
      proficiency: 0.93,
      experience: '3+ Years',
      level: 'Expert',
      tags: ['Offline-First', 'Migrations', 'Encryption', 'Cache Invalidation'],
      description:
          'Seamless offline synchronization engines, relational schema migrations, and high-performance NoSQL local caching.',
    ),
    SkillModel(
      name: 'CI/CD & App Store Deployment',
      category: 'DevOps & Tooling',
      proficiency: 0.90,
      experience: '2.5+ Years',
      level: 'Expert',
      tags: ['GitHub Actions', 'Fastlane', 'TestFlight', 'Play Console'],
      description:
          'Automated multi-flavor build pipelines, automated code signing, TestFlight distribution, and zero-downtime store rollouts.',
    ),
    SkillModel(
      name: 'Native Channels (Swift & Kotlin)',
      category: 'DevOps & Tooling',
      proficiency: 0.86,
      experience: '2+ Years',
      level: 'Advanced',
      tags: ['MethodChannel', 'EventChannel', 'Hardware APIs', 'Biometrics'],
      description:
          'Low-level platform integration for biometric sensors, background services, custom notifications, and audio routing.',
    ),
    SkillModel(
      name: 'Git, FVM & Team Leadership',
      category: 'DevOps & Tooling',
      proficiency: 0.95,
      experience: '4+ Years',
      level: 'Lead / Mentor',
      tags: ['GitFlow', 'Code Reviews', 'Sprint Planning', 'FVM Versioning'],
      description:
          'Team lead running agile sprints, conducting strict pull request architectural reviews, and enforcing clean coding standards.',
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
      url: AppLinks.superSearchDelegatePackage,
    ),
    PackageModel(
      name: 'universal_dropdown',
      description:
          'Generic, high-performance dropdown widget supporting single/multi selection, debounced search, and custom items.',
      downloads: '500+ Downloads',
      url: AppLinks.universalDropdownPackage,
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
