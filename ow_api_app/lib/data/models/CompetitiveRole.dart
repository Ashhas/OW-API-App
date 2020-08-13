class CompetitiveRole {
  int _level;
  String _rankIcon;
  String _roleIcon;

  CompetitiveRole({int level, String rankIcon, String roleIcon}) {
    this._level = level;
    this._rankIcon = rankIcon;
    this._roleIcon = roleIcon;
  }

  int get level => _level;

  set level(int level) => _level = level;

  String get rankIcon => _rankIcon;

  set rankIcon(String rankIcon) => _rankIcon = rankIcon;

  String get roleIcon => _roleIcon;

  set roleIcon(String roleIcon) => _roleIcon = roleIcon;

  CompetitiveRole.fromJson(Map<String, dynamic> json) {
    _level = json['level'];
    _rankIcon = json['rankIcon'];
    _roleIcon = json['roleIcon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['level'] = this._level;
    data['rankIcon'] = this._rankIcon;
    data['roleIcon'] = this._roleIcon;
    return data;
  }
}
