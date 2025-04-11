class FixtureModel {
    final int id;
    final String homeTeam;
    final String homeName;
    final String homeLogo;
    final String awayTeam;
    final String awayName;
    final String awayLogo;
    final DateTime date;

    FixtureModel({
        required this.id,
        required this.homeTeam,
        required this.homeName,
        required this.homeLogo,
        required this.awayTeam,
        required this.awayName,
        required this.awayLogo,
        required this.date,
    });

    factory FixtureModel.fromJson(Map<String, dynamic> json) => FixtureModel(
        id: json["id"],
        homeTeam: json["home_team"],
        homeName: json["home_name"],
        homeLogo: json["home_logo"],
        awayTeam: json["away_team"],
        awayName: json["away_name"],
        awayLogo: json["away_logo"],
        date: DateTime.parse(json["date"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "home_team": homeTeam,
        "home_name": homeName,
        "home_logo": homeLogo,
        "away_team": awayTeam,
        "away_name": awayName,
        "away_logo": awayLogo,
        "date": date.toIso8601String(),
    };
}
