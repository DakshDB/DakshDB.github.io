import 'package:flutter/material.dart';
import 'package:portfolio/constants/theme.dart';
import 'package:portfolio/utilities/responsive.dart';
import 'package:portfolio/widgets/section_wrapper.dart';

class Gallery extends StatelessWidget {
  const Gallery({super.key});

  static const List<String> images = [
    'images/one.jpeg',
    'images/two.jpeg',
    'images/three.jpeg',
  ];

  @override
  Widget build(BuildContext context) {
    final crossAxisCount = Responsive.value(context, mobile: 1, tablet: 2, desktop: 3);

    return SectionWrapper(
      sectionNumber: '04.',
      sectionTitle: 'NIGHT SKY ARCHIVE',
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 0.75,
        ),
        itemCount: images.length,
        itemBuilder: (context, index) => _GalleryImage(
          imagePath: images[index],
        ),
      ),
    );
  }
}

class _GalleryImage extends StatefulWidget {
  final String imagePath;
  const _GalleryImage({required this.imagePath});

  @override
  State<_GalleryImage> createState() => _GalleryImageState();
}

class _GalleryImageState extends State<_GalleryImage> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: () => _showLightbox(context),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          decoration: BoxDecoration(
            border: Border.all(
              color: _isHovered ? AppColors.accent : AppColors.border,
            ),
          ),
          child: Image(
            image: AssetImage(widget.imagePath),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  void _showLightbox(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        backgroundColor: Colors.transparent,
        insetPadding: const EdgeInsets.all(24),
        child: Stack(
          alignment: Alignment.topRight,
          children: [
            Center(
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.accent, width: 1),
                ),
                child: Image(
                  image: AssetImage(widget.imagePath),
                  fit: BoxFit.contain,
                ),
              ),
            ),
            IconButton(
              icon: Icon(Icons.close, color: AppColors.textPrimary, size: 28),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        ),
      ),
    );
  }
}
