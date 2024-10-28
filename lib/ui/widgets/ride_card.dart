//Widget for individual Ride card
// lib/ui/widgets/ride_card.dart
import 'package:flutter/material.dart';

class RideCard extends StatelessWidget {
  final String imageUrl;
  final String startLocation;
  final String endLocation;
  final bool isBookmarked;
  final Function(bool) onBookmarkToggle;

  const RideCard({
    Key? key,
    required this.imageUrl,
    required this.startLocation,
    required this.endLocation,
    required this.isBookmarked,
    required this.onBookmarkToggle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            imageUrl,
            height: 150,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Icon(Icons.location_on, color: Colors.blue),
                SizedBox(width: 4.0),
                Text(startLocation),
                Spacer(),
                IconButton(
                  icon: Icon(
                    isBookmarked ? Icons.favorite : Icons.favorite_border,
                    color: isBookmarked ? Colors.red : Colors.grey,
                  ),
                  onPressed: () => onBookmarkToggle(!isBookmarked),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, bottom: 8.0),
            child: Row(
              children: [
                Icon(Icons.flag, color: Colors.green),
                SizedBox(width: 4.0),
                Text(endLocation),
              ],
            ),
          ),
        ],
      ),
    );
  }
}