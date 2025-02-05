import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CarouselAds extends StatefulWidget {
  const CarouselAds({super.key});

  @override
  State<CarouselAds> createState() => _CarouselAdsState();
}

class _CarouselAdsState extends State<CarouselAds> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  Timer? _timer;
  List<String> imageUrls = []; // To store fetched image URLs
  bool isLoading = true; // Loading state

  @override
  void initState() {
    super.initState();
    _fetchImageUrls(); // Fetch URLs from Firestore
    _startAutoScroll();
  }

  @override
  void dispose() {
    _timer?.cancel(); // Cancel the timer to prevent memory leaks
    _pageController.dispose(); // Dispose the controller
    super.dispose();
  }

  void _startAutoScroll() {
    _timer = Timer.periodic(const Duration(seconds: 5), (Timer timer) {
      if (_currentPage < (imageUrls.length - 1)) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }

      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 1500),
        curve: Curves.easeInOut,
      );
    });
  }

  Future<void> _fetchImageUrls() async {
    try {
      // Access the Firestore collection
      final querySnapshot =
          await FirebaseFirestore.instance.collection('carouselServices').get();

      // Extract URLs from the documents
      final urls =
          querySnapshot.docs.map((doc) => doc['image_url'] as String).toList();

      setState(() {
        imageUrls = urls;
        isLoading = false;
      });
    } catch (e) {
      // Handle errors
      setState(() {
        isLoading = false;
      });
      debugPrint('Error fetching images: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
          child: Center(
              child: Shimmer.fromColors(
            direction: ShimmerDirection.ltr,
            period: const Duration(milliseconds: 1500),
            baseColor: Theme.of(context).colorScheme.surfaceContainerLowest,
            highlightColor:
                Theme.of(context).colorScheme.surfaceContainerHighest,
            child: const Card(
                elevation: 0,
                child: SizedBox(
                  child: AspectRatio(
                    aspectRatio: 16 / 9,
                  ),
                )),
          )));
    }

    if (imageUrls.isEmpty) {
      return const Center(child: Text('No images available'));
    }

    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
      child: SizedBox(
        child: AspectRatio(
          aspectRatio: 16 / 9,
          child: PageView(
            controller: _pageController,
            onPageChanged: (int page) {
              setState(() {
                _currentPage = page;
              });
            },
            children: imageUrls
                .map((url) => AspectRatio(
                      aspectRatio: 16 / 9,
                      child: Image.network(
                        url,
                        fit: BoxFit.cover,
                      ),
                    ))
                .toList(),
          ),
        ),
      ),
    );
  }
}
