class Awards {
  int _cards;
  int _medals;
  int _medalsBronze;
  int _medalsSilver;
  int _medalsGold;

  Awards(
      {int cards,
      int medals,
      int medalsBronze,
      int medalsSilver,
      int medalsGold}) {
    this._cards = cards;
    this._medals = medals;
    this._medalsBronze = medalsBronze;
    this._medalsSilver = medalsSilver;
    this._medalsGold = medalsGold;
  }

  int get cards => _cards;

  set cards(int cards) => _cards = cards;

  int get medals => _medals;

  set medals(int medals) => _medals = medals;

  int get medalsBronze => _medalsBronze;

  set medalsBronze(int medalsBronze) => _medalsBronze = medalsBronze;

  int get medalsSilver => _medalsSilver;

  set medalsSilver(int medalsSilver) => _medalsSilver = medalsSilver;

  int get medalsGold => _medalsGold;

  set medalsGold(int medalsGold) => _medalsGold = medalsGold;

  Awards.fromJson(Map<String, dynamic> json) {
    _cards = json['cards'];
    _medals = json['medals'];
    _medalsBronze = json['medalsBronze'];
    _medalsSilver = json['medalsSilver'];
    _medalsGold = json['medalsGold'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cards'] = this._cards;
    data['medals'] = this._medals;
    data['medalsBronze'] = this._medalsBronze;
    data['medalsSilver'] = this._medalsSilver;
    data['medalsGold'] = this._medalsGold;
    return data;
  }
}
