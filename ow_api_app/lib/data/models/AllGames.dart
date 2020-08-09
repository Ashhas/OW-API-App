class AllGames {
  int _played;
  int _won;

  Games({int played, int won}) {
    this._played = played;
    this._won = won;
  }

  int get played => _played;

  set played(int played) => _played = played;

  int get won => _won;

  set won(int won) => _won = won;

  AllGames.fromJson(Map<String, dynamic> json) {
    _played = json['played'];
    _won = json['won'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['played'] = this._played;
    data['won'] = this._won;
    return data;
  }
}
