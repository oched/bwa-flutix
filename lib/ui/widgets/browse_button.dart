part of 'widgets.dart';

class BrowseButton extends StatelessWidget {
  final String genre;

  BrowseButton(this.genre);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 50,
          width: 50,
          margin: EdgeInsets.only(bottom: 4),
          padding: EdgeInsets.all(7),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Color(0xFFEBEFF6),
          ),
          child: Image.asset((genre.contains("Horror"))
              ? "assets/ic_horror.png"
              : (genre.contains("Music"))
                  ? "assets/ic_music.png"
                  : (genre.contains("Action"))
                      ? "assets/ic_action.png"
                      : (genre.contains("Drama"))
                          ? "assets/ic_drama.png"
                          : (genre.contains("War"))
                              ? "assets/ic_war.png"
                              : "assets/ic_crime.png"),
        ),
        Text(
          genre,
          style: blackTextFont.copyWith(fontSize: 12),
        ),
      ],
    );
  }
}
