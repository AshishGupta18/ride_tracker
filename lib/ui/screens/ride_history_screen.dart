//Main screen for showing Ride history

// lib/ui/screens/ride_history_screen.dart
import 'package:flutter/material.dart';
import '../widgets/ride_card.dart';
import '../widgets/scroll_to_top_button.dart';

class RideHistoryScreen extends StatefulWidget {
  @override
  _RideHistoryScreenState createState() => _RideHistoryScreenState();
}

class _RideHistoryScreenState extends State<RideHistoryScreen> {
  final ScrollController _scrollController = ScrollController();
  bool _showScrollToTopButton = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.offset > 300) {
        setState(() => _showScrollToTopButton = true);
      } else {
        setState(() => _showScrollToTopButton = false);
      }
    });
  }

  void _scrollToTop() {
    _scrollController.animateTo(
      0,
      duration: Duration(seconds: 1),
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Suggested Routes"),
      ),
      body: ListView.builder(
        controller: _scrollController,
        itemCount: 8,  // This will be dynamic once we integrate BLoC and API
        itemBuilder: (context, index) {
          return RideCard(
            // Replace with actual data once available
            imageUrl: 'https://via.placeholder.com/300',
            startLocation: 'Start Location $index',
            endLocation: 'End Location $index',
            isBookmarked: false,
            onBookmarkToggle: (isBookmarked) {
              // Handle toggle action
            },
          );
        },
      ),
      floatingActionButton: _showScrollToTopButton
          ? ScrollToTopButton(onPressed: _scrollToTop)
          : null,
    );
  }
}