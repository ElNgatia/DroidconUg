part of '../sessions_screen.dart';

class RoomSessionsTab extends StatelessWidget {
  final List<Session> sessions;

  const RoomSessionsTab({super.key, required this.sessions});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: sessions.length,
      itemBuilder: (context, index) {
        final session = sessions[index];
        return Card(
          margin: const EdgeInsets.all(8.0),
          child: ListTile(
            title: Text(session.title ?? "No Title"),
            subtitle: Text(session.description ?? "No Description"),
            trailing: Icon(
              session.bookmarked == true
                  ? Icons.bookmark
                  : Icons.bookmark_border,
            ),
            onTap: () {
              // Handle session tap (e.g., navigate to session details page)
            },
          ),
        );
      },
    );
  }
}
