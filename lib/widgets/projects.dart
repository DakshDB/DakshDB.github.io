import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio/constants/projects_data.dart';
import 'package:portfolio/constants/theme.dart';
import 'package:portfolio/utilities/launch_url.dart';
import 'package:portfolio/utilities/responsive.dart';
import 'package:portfolio/widgets/section_wrapper.dart';

class Projects extends StatelessWidget {
  const Projects({super.key});

  @override
  Widget build(BuildContext context) {
    return SectionWrapper(
      sectionNumber: '03.',
      sectionTitle: 'SELECTED WORK',
      child: LayoutBuilder(
        builder: (context, constraints) {
          final isMobile = Responsive.isMobile(context);

          return Container(
            decoration: const BoxDecoration(
              border: Border(
                top: BorderSide(width: 1, color: AppColors.border),
                left: BorderSide(width: 1, color: AppColors.border),
              ),
            ),
            child: Column(
              children: _buildGridRows(projects, isMobile),
            ),
          );
        },
      ),
    );
  }

  List<Widget> _buildGridRows(List<Project> allProjects, bool isMobile) {
    List<Widget> rows = [];
    int i = 0;

    Widget buildRow(List<Widget> children) {
      return IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: children,
        ),
      );
    }

    Widget buildCell(Project project, int index, {bool isFeatured = false}) {
      final indexStr = (index + 1).toString().padLeft(2, '0');
      return Expanded(
        child: _ProjectGridItem(project: project, indexStr: indexStr, isFeatured: isFeatured),
      );
    }

    Widget buildEmptyCell() {
      return Expanded(
        child: Container(
          decoration: const BoxDecoration(
            border: Border(
              right: BorderSide(width: 1, color: AppColors.border),
              bottom: BorderSide(width: 1, color: AppColors.border),
            ),
          ),
        ),
      );
    }

    while (i < allProjects.length) {
      if (isMobile) {
        rows.add(buildRow([buildCell(allProjects[i], i)]));
        i++;
      } else {
        // Pattern: Full Row, then Half/Half Row
        rows.add(buildRow([buildCell(allProjects[i], i, isFeatured: true)]));
        i++;

        // Next row: 2 Half Width Projects if available
        if (i < allProjects.length) {
          final p2 = allProjects[i];
          if (i + 1 < allProjects.length) {
            final p3 = allProjects[i + 1];
            rows.add(buildRow([buildCell(p2, i), buildCell(p3, i + 1)]));
            i += 2;
          } else {
            rows.add(buildRow([buildCell(p2, i), buildEmptyCell()]));
            i += 1;
          }
        }
      }
    }
    return rows;
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Brutalist Grid Cell Item
// ─────────────────────────────────────────────────────────────────────────────

class _ProjectGridItem extends StatefulWidget {
  final Project project;
  final String indexStr;
  final bool isFeatured;
  const _ProjectGridItem({required this.project, required this.indexStr, this.isFeatured = false});

  @override
  State<_ProjectGridItem> createState() => _ProjectGridItemState();
}

class _ProjectGridItemState extends State<_ProjectGridItem> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);

    // Scaling the title font size to be massive but fit the column
    final double titleFontSize = isMobile ? 32 : (widget.isFeatured ? 64 : 40);
    final double indexFontSize = isMobile ? 48 : (widget.isFeatured ? 100 : 72);

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: (widget.project.liveUrl != null || widget.project.githubUrl != null)
          ? SystemMouseCursors.click
          : SystemMouseCursors.basic,
      child: GestureDetector(
        onTap: () {
          final url = widget.project.liveUrl ?? widget.project.githubUrl;
          if (url != null) launchURL(url);
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          decoration: BoxDecoration(
            color: _isHovered ? AppColors.accent.withValues(alpha: 0.05) : Colors.transparent,
            border: Border(
              right: BorderSide(width: 1, color: AppColors.border),
              bottom: BorderSide(width: 1, color: AppColors.border),
            ),
          ),
          padding: EdgeInsets.all(isMobile ? 24 : 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ── Giant Steel Blue Index ──
              Text(
                widget.indexStr,
                style: AppTextStyles.mono.copyWith(
                  fontSize: indexFontSize,
                  fontWeight: FontWeight.w900,
                  color: AppColors.accent,
                  height: 1.0,
                  letterSpacing: -2.0,
                ),
              ),
              
              const SizedBox(height: 32),

              // ── Bold Title ──
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                   Expanded(
                     child: Text(
                      widget.project.title.toUpperCase(),
                      style: TextStyle(
                        fontFamily: AppTextStyles.h1.fontFamily,
                        fontSize: titleFontSize,
                        fontWeight: FontWeight.w900,
                        letterSpacing: -1.0,
                        height: 1.1,
                        color: AppColors.textPrimary,
                      ),
                                       ),
                   ),
                  Row(
                    children: [
                       if (widget.project.githubUrl != null)
                          _IconLink(
                            icon: const FaIcon(FontAwesomeIcons.github, size: 20),
                            url: widget.project.githubUrl!,
                            isHovered: _isHovered,
                          ),
                        if (widget.project.liveUrl != null) ...[
                          if (widget.project.githubUrl != null)
                            const SizedBox(width: 16),
                          _IconLink(
                            icon: const Icon(Icons.arrow_outward, size: 24),
                            url: widget.project.liveUrl!,
                            isHovered: _isHovered,
                          ),
                        ],
                    ],
                  )
                ],
              ),
              
              const Spacer(),
              const SizedBox(height: 32),

              // ── Monospaced Description ──
              Text(
                widget.project.description.toUpperCase(),
                style: AppTextStyles.mono.copyWith(
                  fontSize: 12,
                  color: AppColors.textSecondary,
                  height: 1.6,
                ),
                maxLines: 4,
                overflow: TargetPlatform.iOS == Theme.of(context).platform 
                    ? TextOverflow.ellipsis 
                    : TextOverflow.fade,
              ),

              const SizedBox(height: 24),

              // ── Tech Tags (Brutalist blocks) ──
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: widget.project.technologies.map((tech) => Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.border),
                  ),
                  child: Text(
                    tech.toUpperCase(),
                    style: AppTextStyles.mono.copyWith(
                      fontSize: 10,
                      color: AppColors.textTertiary,
                    ),
                  ),
                )).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Icon link with hover
// ─────────────────────────────────────────────────────────────────────────────

class _IconLink extends StatefulWidget {
  final Widget icon;
  final String url;
  final bool isHovered;
  const _IconLink({required this.icon, required this.url, this.isHovered = false});

  @override
  State<_IconLink> createState() => _IconLinkState();
}

class _IconLinkState extends State<_IconLink> {
  bool _isLocalHovered = false;

  @override
  Widget build(BuildContext context) {
    final baseColor = widget.isHovered ? AppColors.textPrimary : AppColors.textTertiary;
    
    return MouseRegion(
      onEnter: (_) => setState(() => _isLocalHovered = true),
      onExit: (_) => setState(() => _isLocalHovered = false),
      child: GestureDetector(
        onTap: () => launchURL(widget.url),
        child: Padding(
          padding: const EdgeInsets.all(4),
          child: IconTheme(
            data: IconThemeData(
              color: _isLocalHovered ? AppColors.accent : baseColor,
            ),
            child: widget.icon,
          ),
        ),
      ),
    );
  }
}

