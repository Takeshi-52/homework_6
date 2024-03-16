class Presidents {
  final int? ordinal;
  final String? name;
  final String? yearInOffice;
  final String? vice;
  final String? photo;

  Presidents({
    required this.ordinal,
    required this.name,
    required this.yearInOffice,
    required this.vice,
    required this.photo,
  });

  factory Presidents.fromJson(Map<String, dynamic> json) {
    return Presidents(
      ordinal: json['ordinal'] ?? 0,
      name: json['name'] ?? '',
      yearInOffice: json['yearsInOffice'] ?? '',
      vice: json['vicePresidents'] != null
          ? json['vicePresidents'].join(', ')
          : '',
      photo: json['photo'] ?? '',
    );
  }
}
