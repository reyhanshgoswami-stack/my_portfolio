import 'package:flutter/material.dart';

void main() {
  runApp(const InteractivePortfolioApp());
}

class InteractivePortfolioApp extends StatelessWidget {
  const InteractivePortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Darshna Goswami - Portfolio Hub',
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF0B0F19),
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFF38BDF8),
          secondary: Color(0xFF818CF8),
        ),
        useMaterial3: true,
      ),
      home: const MainPortfolioPage(),
    );
  }
}

class MainPortfolioPage extends StatefulWidget {
  const MainPortfolioPage({super.key});

  @override
  State<MainPortfolioPage> createState() => _MainPortfolioPageState();
}

class _MainPortfolioPageState extends State<MainPortfolioPage> {
  // Enrolled Courses Tracking (In-memory State)
  final Set<String> _enrolledCourses = {};

  // Reusable Interactive Dialog (Har Clickable Item Ke Liye)
  void _showDetailModal({
    required BuildContext context,
    required String title,
    required String category,
    required String description,
    required IconData icon,
    String? extraButtonLabel,
    VoidCallback? onExtraAction,
  }) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: const Color(0xFF131D31),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: Row(
          children: [
            CircleAvatar(
              backgroundColor: const Color(0xFF38BDF8).withOpacity(0.2),
              child: Icon(icon, color: const Color(0xFF38BDF8), size: 22),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    category,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Color(0xFF38BDF8),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Divider(color: Colors.white12),
            const SizedBox(height: 8),
            Text(
              description,
              style: const TextStyle(
                color: Colors.white70,
                fontSize: 13,
                height: 1.5,
              ),
            ),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.black26,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.white10),
              ),
              child: const Row(
                children: [
                  Icon(
                    Icons.check_circle_outline,
                    size: 16,
                    color: Colors.tealAccent,
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      'Live Interactive Endpoint Verified (Status 200 OK)',
                      style: TextStyle(fontSize: 11, color: Colors.grey),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Close', style: TextStyle(color: Colors.grey)),
          ),
          if (extraButtonLabel != null)
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF38BDF8),
                foregroundColor: const Color(0xFF0B0F19),
              ),
              onPressed: () {
                Navigator.pop(ctx);
                if (onExtraAction != null) onExtraAction();
              },
              child: Text(
                extraButtonLabel,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Darshna Goswami | Portfolio',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        backgroundColor: const Color(0xFF0F172A),
        elevation: 0,
        actions: [
          IconButton(
            tooltip: 'View Profile Info',
            icon: const Icon(Icons.info_outline, color: Color(0xFF38BDF8)),
            onPressed: () {
              _showDetailModal(
                context: context,
                title: 'Darshna Goswami',
                category: 'Iqra University • Computer Science',
                description:
                    'Undergraduate Computer Science student at Iqra University specializing in cross-platform development, systems, and database engineering.',
                icon: Icons.school,
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 820),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Profile Avatar (Clickable)
                Center(
                  child: InkWell(
                    borderRadius: BorderRadius.circular(50),
                    onTap: () {
                      _showDetailModal(
                        context: context,
                        title: 'Darshna Goswami',
                        category: 'Iqra University Student',
                        description:
                            'Computer Science undergraduate at Iqra University. Passionate about software architecture, reactive Flutter interfaces, and scalable database systems.',
                        icon: Icons.person,
                      );
                    },
                    child: const CircleAvatar(
                      radius: 46,
                      backgroundColor: Color(0xFF38BDF8),
                      child: Text(
                        'DG',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF0B0F19),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 14),
                const Center(
                  child: Text(
                    'Darshna Goswami',
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 4),
                Center(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFF38BDF8).withOpacity(0.12),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: const Color(0xFF38BDF8).withOpacity(0.3),
                      ),
                    ),
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.school, size: 14, color: Color(0xFF38BDF8)),
                        SizedBox(width: 6),
                        Text(
                          'Iqra University',
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF38BDF8),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                const Center(
                  child: Text(
                    'Software & Full-Stack Developer • Tap on any card to view details',
                    style: TextStyle(fontSize: 13, color: Colors.grey),
                  ),
                ),
                const SizedBox(height: 32),

                // SECTION 1: CLICKABLE SKILLS & TECH
                const Text(
                  'Tech Stack (Tap to explore)',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 12),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    _buildClickableSkill(
                      'Flutter & Dart',
                      'Used for high-performance reactive mobile & desktop apps.',
                    ),
                    _buildClickableSkill(
                      'JavaScript / React',
                      'Modern dynamic components, web routing, and REST consumption.',
                    ),
                    _buildClickableSkill(
                      'Java Backend',
                      'Object-oriented backend design, MVC patterns, and APIs.',
                    ),
                    _buildClickableSkill(
                      'MySQL & Databases',
                      'Schema normalization, stored procedures, joins, and ACID compliance.',
                    ),
                    _buildClickableSkill(
                      'Python',
                      'Automation scripting, system utilities, and data processing.',
                    ),
                    _buildClickableSkill(
                      'Git & GitHub',
                      'Distributed branch version control, commits, and pull requests.',
                    ),
                  ],
                ),
                const SizedBox(height: 36),

                // SECTION 2: CLICKABLE COURSES & EDUCATION
                const Text(
                  'Academic Modules & Courses (Tap to open details)',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 14),

                _buildClickableCourseCard(
                  id: 'c1',
                  title: 'Mobile Application Development (Flutter)',
                  institute: 'Iqra University - CS Faculty',
                  duration: 'Semester Curriculum • Lab Practical',
                  overview:
                      'Cross-platform app development covering state management, asynchronous streams, API integrations, and UI architectures.',
                ),
                _buildClickableCourseCard(
                  id: 'c2',
                  title: 'Relational Database Management Systems (RDBMS)',
                  institute: 'Iqra University - Dept of Computer Science',
                  duration: 'Advanced Database Systems • MySQL',
                  overview:
                      'In-depth coverage of ER models, normalization, index optimization, stored procedures, and triggers.',
                ),
                _buildClickableCourseCard(
                  id: 'c3',
                  title: 'Compiler Construction & Automata Theory',
                  institute: 'Iqra University - Systems Lab',
                  duration: 'Comprehensive Theory + C Parser Lab',
                  overview:
                      'Constructing lexical tokenizers, syntax parse trees, context-free grammars, and three-address intermediate code.',
                ),
                const SizedBox(height: 36),

                // SECTION 3: CLICKABLE PROJECTS
                const Text(
                  'Featured Projects (Tap to launch)',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 14),

                _buildClickableProjectCard(
                  title: 'Dynamic E-Commerce Interface',
                  category: 'Frontend & Web',
                  description:
                      'Interactive shopping cart with item filters, real-time total calculator, and persistent storage.',
                  details:
                      'Built with modular component architecture, responsive mobile layouts, and custom checkout dialogs.',
                ),
                _buildClickableProjectCard(
                  title: 'Incubation Center Management Engine',
                  category: 'Full Stack & Database',
                  description:
                      'Multi-table MySQL system tracking startup cohorts, mentor allocations, and funding logs.',
                  details:
                      'Includes stored procedures for tracking attendance, role-based triggers, and audit log generation.',
                ),
                _buildClickableProjectCard(
                  title: 'Lexical Analyzer & Syntax Tokenizer',
                  category: 'Systems / Compiler',
                  description:
                      'Tokenizes raw code files and builds intermediate language structures.',
                  details:
                      'Implemented in C with symbol tables, error-handling states, and grammar verification trees.',
                ),
                const SizedBox(height: 36),

                // SECTION 4: CLICKABLE CONTACT / ACTIONS
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: const Color(0xFF131D31),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: Colors.white12),
                  ),
                  child: Column(
                    children: [
                      const Text(
                        'Ready to Collaborate?',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 6),
                      const Text(
                        'Connect directly with Darshna Goswami (Iqra University)',
                        style: TextStyle(fontSize: 13, color: Colors.grey),
                      ),
                      const SizedBox(height: 16),
                      Wrap(
                        spacing: 12,
                        runSpacing: 10,
                        alignment: WrapAlignment.center,
                        children: [
                          ElevatedButton.icon(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF38BDF8),
                              foregroundColor: const Color(0xFF0B0F19),
                            ),
                            onPressed: () {
                              _showDetailModal(
                                context: context,
                                title: 'Contact Darshna',
                                category: 'Email Inquiry',
                                description:
                                    'Reach out directly for software engineering internships, technical collaborations, or academic project inquiries.',
                                icon: Icons.email,
                                extraButtonLabel: 'Copy Email',
                                onExtraAction: () {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text(
                                        'Email address copied to clipboard!',
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                            icon: const Icon(Icons.email),
                            label: const Text('Email Darshna'),
                          ),
                          OutlinedButton.icon(
                            style: OutlinedButton.styleFrom(
                              side: const BorderSide(color: Color(0xFF38BDF8)),
                            ),
                            onPressed: () {
                              _showDetailModal(
                                context: context,
                                title: 'Darshna\'s GitHub Hub',
                                category: 'Source Repositories',
                                description:
                                    'Explore live repositories, academic course projects, and open-source contributions.',
                                icon: Icons.code,
                                extraButtonLabel: 'Simulate GitHub Link',
                                onExtraAction: () {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text(
                                        'Redirecting to Darshna\'s GitHub profile...',
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                            icon: const Icon(
                              Icons.terminal,
                              color: Color(0xFF38BDF8),
                            ),
                            label: const Text(
                              'GitHub Profile',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // --- WIDGET BUILDERS ---

  Widget _buildClickableSkill(String name, String desc) {
    return InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: () {
        _showDetailModal(
          context: context,
          title: name,
          category: 'Skill Competency',
          description: desc,
          icon: Icons.military_tech,
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        decoration: BoxDecoration(
          color: const Color(0xFF131D31),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: const Color(0xFF38BDF8).withOpacity(0.4)),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              name,
              style: const TextStyle(
                fontSize: 12,
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(width: 6),
            const Icon(Icons.open_in_new, size: 12, color: Color(0xFF38BDF8)),
          ],
        ),
      ),
    );
  }

  Widget _buildClickableCourseCard({
    required String id,
    required String title,
    required String institute,
    required String duration,
    required String overview,
  }) {
    final bool isEnrolled = _enrolledCourses.contains(id);

    return Card(
      color: const Color(0xFF131D31),
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
        side: const BorderSide(color: Colors.white12),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(14),
        onTap: () {
          _showDetailModal(
            context: context,
            title: title,
            category: institute,
            description: '$overview\n\nDuration: $duration',
            icon: Icons.menu_book,
            extraButtonLabel: isEnrolled
                ? 'Enrolled (View Syllabus)'
                : 'Register / View Syllabus',
            onExtraAction: () {
              setState(() {
                _enrolledCourses.add(id);
              });
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: Colors.teal,
                  content: Text('Course selected: $title'),
                ),
              );
            },
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: isEnrolled
                      ? Colors.teal.withOpacity(0.2)
                      : const Color(0xFF38BDF8).withOpacity(0.12),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(
                  isEnrolled ? Icons.verified : Icons.school_outlined,
                  color: isEnrolled
                      ? Colors.tealAccent
                      : const Color(0xFF38BDF8),
                  size: 24,
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            title,
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 7,
                            vertical: 3,
                          ),
                          decoration: BoxDecoration(
                            color: isEnrolled ? Colors.teal : Colors.white10,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Text(
                            isEnrolled ? 'Enrolled' : 'Tap to View',
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              color: isEnrolled
                                  ? Colors.black
                                  : const Color(0xFF38BDF8),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      institute,
                      style: const TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      duration,
                      style: const TextStyle(
                        fontSize: 11,
                        color: Color(0xFF38BDF8),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildClickableProjectCard({
    required String title,
    required String category,
    required String description,
    required String details,
  }) {
    return Card(
      color: const Color(0xFF131D31),
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
        side: const BorderSide(color: Colors.white12),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(14),
        onTap: () {
          _showDetailModal(
            context: context,
            title: title,
            category: category,
            description: '$description\n\nSystem Specs:\n$details',
            icon: Icons.rocket_launch,
            extraButtonLabel: 'Open Project Source',
            onExtraAction: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Opening source repository for $title...'),
                ),
              );
            },
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const Icon(
                    Icons.arrow_forward_ios,
                    size: 14,
                    color: Color(0xFF38BDF8),
                  ),
                ],
              ),
              const SizedBox(height: 6),
              Text(
                description,
                style: const TextStyle(fontSize: 13, color: Colors.white70),
              ),
              const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                decoration: BoxDecoration(
                  color: const Color(0xFF38BDF8).withOpacity(0.15),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  category,
                  style: const TextStyle(
                    fontSize: 11,
                    color: Color(0xFF38BDF8),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
