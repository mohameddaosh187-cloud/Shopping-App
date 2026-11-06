import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

/// Product card styled to match the product item shown in the Figma home screen.
class ProductItemWidget extends StatelessWidget {
  const ProductItemWidget({
    super.key,
    this.imagePath = 'assets/images/product_tshirt.png',
    this.title = 'T-shirt oversize',
    this.rating = 4.5,
    this.price = 199,
    this.oldPrice = 250,
    this.onTap,
    this.onFavoriteTap,
  });

  final String imagePath;
  final String title;
  final double rating;
  final num price;
  final num? oldPrice;
  final VoidCallback? onTap;
  final VoidCallback? onFavoriteTap;

  @override
  Widget build(BuildContext context) {
    final imageUri = Uri.tryParse(imagePath);
    final isNetworkImage =
        imageUri != null &&
        (imageUri.scheme == 'http' || imageUri.scheme == 'https');

    return SizedBox(
      width: 164,
      child: InkWell(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: 164,
              height: 238,
              child: Stack(
                children: [
                  const ColoredBox(color: Color(0xFFFCFCFC)),
                  Center(
                    child: isNetworkImage
                        ? Image.network(
                            imagePath,
                            width: 164,
                            height: 164,
                            fit: BoxFit.contain,
                            errorBuilder: (context, error, stackTrace) =>
                                const Icon(
                                  Icons.image_not_supported_outlined,
                                  size: 40,
                                  color: Colors.grey,
                                ),
                          )
                        : Image.asset(
                            imagePath,
                            width: 164,
                            height: 164,
                            fit: BoxFit.contain,
                            errorBuilder: (context, error, stackTrace) =>
                                const Icon(
                                  Icons.image_not_supported_outlined,
                                  size: 40,
                                  color: Colors.grey,
                                ),
                          ),
                  ),
                  Positioned(
                    top: 0,
                    right: 0,
                    child: Material(
                      color: const Color(0xFFF7F7F7),
                      shape: const CircleBorder(),
                      child: InkWell(
                        customBorder: const CircleBorder(),
                        onTap: onFavoriteTap,
                        child: const SizedBox(
                          width: 32,
                          height: 32,
                          child: Icon(
                            Icons.favorite_border,
                            size: 20,
                            color: Color(0xFF222222),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: Text(
                    title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontSize: 14, color: Colors.black),
                  ),
                ),
                const SizedBox(width: 8),
                const Icon(Icons.star, size: 15, color: AppColors.orangeLight),
                const SizedBox(width: 2),
                Text(
                  rating.toStringAsFixed(1),
                  style: const TextStyle(fontSize: 12, color: Color(0xFF111111)),
                ),
              ],
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                Text.rich(
                  TextSpan(
                    style: const TextStyle(color: Colors.black),
                    children: [
                      const TextSpan(
                        text: 'EGP ',
                        style: TextStyle(fontSize: 14),
                      ),
                      TextSpan(
                        text: '$price',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
                if (oldPrice != null) ...[
                  const SizedBox(width: 4),
                  Text(
                    'EGP $oldPrice',
                    style: const TextStyle(
                      color: Color(0x8CFFA801),
                      fontSize: 10,
                      decoration: TextDecoration.lineThrough,
                    ),
                  ),
                ],
              ],
            ),
          ],
        ),
      ),
    );
  }
}
