import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/ride_bloc.dart';

class RideHistoryScreen extends StatelessWidget {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Suggested Routes'),
      ),
      body: BlocBuilder<RideBloc, RideState>(
        builder: (context, state) {
          if (state is RideLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is RideError) {
            return Center(child: Text('Error: ${state.message}'));
          } else if (state is RideLoaded) {
            return NotificationListener<ScrollNotification>(
              onNotification: (ScrollNotification scrollInfo) {
                if (scrollInfo.metrics.pixels >= scrollInfo.metrics.maxScrollExtent) {
                  // Load more data if needed
                  context.read<RideBloc>().add(FetchRides()); // Adjust this line to trigger more data fetching
                }
                return true;
              },
              child: ListView.builder(
                controller: _scrollController,
                itemCount: state.rides.length,
                itemBuilder: (context, index) {
                  final ride = state.rides[index];
                  return Card(
                    child: Column(
                      children: [
                        Image.network(ride.image),
                        ListTile(
                          title: Text(ride.startLoc),
                          subtitle: Text(ride.endLoc),
                          trailing: IconButton(
                            icon: Icon(
                              ride.bookmarked ? Icons.favorite : Icons.favorite_border,
                              color: ride.bookmarked ? Colors.red : null,
                            ),
                            onPressed: () {
                              context.read<RideBloc>().add(
                                ToggleBookmark(
                                  routeId: ride.id,
                                  isBookmarked: ride.bookmarked,
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            );
          }
          return Container();
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _scrollController.animateTo(
            0,
            duration: Duration(milliseconds: 300),
            curve: Curves.easeIn,
          );
        },
        child: Icon(Icons.arrow_upward),
      ),
    );
  }
}