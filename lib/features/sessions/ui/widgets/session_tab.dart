part of '../sessions_screen.dart';

class SessionTab extends StatelessWidget {
  final List<Session> sessions;

  const SessionTab({super.key, required this.sessions});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ListView.builder(
      itemCount: sessions.length,
      itemBuilder: (context, index) {
        final session = sessions[index];
        var startTime = Container(
          width: 75,
          padding: const EdgeInsets.all(Sizes.sm),
          child: Text(
            formatTime(session.startsAt!),
            style: const TextStyle(fontSize: 18),
            textAlign: TextAlign.center,
          ),
        );

        var rightContent = Container(
          width: size.width - 100,
          padding: const EdgeInsets.only(
            top: Sizes.sm,
            right: Sizes.sm,
            bottom: Sizes.sm,
          ),
          child: Column(
            children: [
              Text(
                session.title ?? "No Title",
                maxLines: 2,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                session.description ?? "No Description",
                maxLines: 3,
                style: const TextStyle(fontSize: 12),
              ),
              SizedBox(
                height: 25,
                width: MediaQuery.of(context).size.width - 30,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    TagItem(
                      tagText:
                          '${formatTime(session.startsAt!)} - ${formatTime(session.endsAt!)}',
                    ),
                  ],
                ),
              ),
            ],
          ),
        );

        return Card(
          elevation: 2,
          color: ThemeColors.bgColorBW(context),
          margin: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: [
                  startTime,
                  rightContent,
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
