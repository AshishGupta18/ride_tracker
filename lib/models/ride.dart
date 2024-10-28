import 'package:equatable/equatable.dart';

class Ride extends Equatable {
  final int id;
  final String startLoc;
  final String endLoc;
  final String image;
  final bool bookmarked;

  Ride({
    required this.id,
    required this.startLoc,
    required this.endLoc,
    required this.image,
    required this.bookmarked,
  });

  factory Ride.fromJson(Map<String, dynamic> json) {
    return Ride(
      id: json['id'],
      startLoc: json['start_loc'],
      endLoc: json['end_loc'],
      image: json['image'],
      bookmarked: json['bookmarked'],
    );
  }

  Ride copyWith({bool? bookmarked}) {
    return Ride(
      id: id,
      startLoc: startLoc,
      endLoc: endLoc,
      image: image,
      bookmarked: bookmarked ?? this.bookmarked,
    );
  }

  @override
  List<Object?> get props => [id, startLoc, endLoc, image, bookmarked];
}