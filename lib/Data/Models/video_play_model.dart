// ignore_for_file: non_constant_identifier_names

class VideoPlayModel {
  final int movieId;
  final String title;
  final int imdbRating;
  final String trailerURL;
  final String runTime;
  final String ageRestriction;
  final String certification;
  final String releaseDate;
  final int director;
  final int productionHouse;
  final String cast;
  final String genre;
  final String language;
  final String shortDescription;
  final String longDescription;
  final String? imageLogo;
  final String imageUrl;
  final bool isDeleted;
  final bool isActive;
  final int createdBy;
  final String createdOn;
  final String ageRestriction_name;
  final String director_Name;
  final String certificaitonName;
  final String productionHouseName;
  final List<DirectorList> directorList;
  final List<CastList> castList;
  final List<GenreList> genreList;
  final List<LanguageList> languageList;
  final List<AgeList>? ageList;
  final List<CertificationList>? certificationList;
  final String director_Photo;
  final String director_Info;
  final String production_Photo;
  final List<CastListInfo> castList_info;

  VideoPlayModel({
    required this.movieId,
    required this.title,
    required this.imdbRating,
    required this.trailerURL,
    required this.runTime,
    required this.ageRestriction,
    required this.certification,
    required this.releaseDate,
    required this.director,
    required this.productionHouse,
    required this.cast,
    required this.genre,
    required this.language,
    required this.shortDescription,
    required this.longDescription,
    this.imageLogo,
    required this.imageUrl,
    required this.isDeleted,
    required this.isActive,
    required this.createdBy,
    required this.createdOn,
    required this.ageRestriction_name,
    required this.director_Name,
    required this.certificaitonName,
    required this.productionHouseName,
    required this.directorList,
    required this.castList,
    required this.genreList,
    required this.languageList,
    this.ageList,
    this.certificationList,
    required this.director_Photo,
    required this.director_Info,
    required this.production_Photo,
    required this.castList_info,
  });

  factory VideoPlayModel.fromJson(Map<String, dynamic> json) {
    return VideoPlayModel(
      movieId: json['movieId'],
      title: json['title'],
      imdbRating: json['imdbRating'],
      trailerURL: json['trailerURL'],
      runTime: json['runTime'],
      ageRestriction: json['ageRestriction'],
      certification: json['certification'],
      releaseDate: json['releaseDate'],
      director: json['director'],
      productionHouse: json['productionHouse'],
      cast: json['cast'],
      genre: json['genre'],
      language: json['language'],
      shortDescription: json['shortDescription'],
      longDescription: json['longDescription'],
      imageLogo: json['imageLogo'] ?? '',
      imageUrl: json['imageUrl'],
      isDeleted: json['isDeleted'],
      isActive: json['isActive'],
      createdBy: json['createdBy'],
      createdOn: json['createdOn'],
      ageRestriction_name: json['ageRestriction_name'],
      director_Name: json['director_Name'],
      certificaitonName: json['certificaitonName'],
      productionHouseName: json['productionHouseName'],
      directorList: (json['directorList'] as List<dynamic>)
          .map((x) => DirectorList.fromJson(x))
          .toList(),
      castList: (json['castList'] as List<dynamic>)
          .map((x) => CastList.fromJson(x))
          .toList(),
      genreList: (json['genreList'] as List<dynamic>)
          .map((x) => GenreList.fromJson(x))
          .toList(),
      languageList: (json['languageList'] as List<dynamic>)
          .map((x) => LanguageList.fromJson(x))
          .toList(),
      ageList: (json['ageList'] != null)
          ? (json['ageList'] as List<dynamic>)
              .map((x) => AgeList.fromJson(x))
              .toList()
          : null,
      certificationList: (json['certificationList'] != null)
          ? (json['certificationList'] as List<dynamic>)
              .map((x) => CertificationList.fromJson(x))
              .toList()
          : null,
      director_Photo: json['director_Photo'],
      director_Info: json['director_Info'],
      production_Photo: json['production_Photo'],
      castList_info: (json['castList_info'] as List<dynamic>)
          .map((x) => CastListInfo.fromJson(x))
          .toList(),
    );
  }
}

class DirectorList {
  final int id;
  final String name;

  DirectorList({
    required this.id,
    required this.name,
  });

  factory DirectorList.fromJson(Map<String, dynamic> json) {
    return DirectorList(
      id: json['id'],
      name: json['name'],
    );
  }
}

class CastList {
  final int id;
  final String name;

  CastList({
    required this.id,
    required this.name,
  });

  factory CastList.fromJson(Map<String, dynamic> json) {
    return CastList(
      id: json['id'],
      name: json['name'],
    );
  }
}

class GenreList {
  final int id;
  final String name;

  GenreList({
    required this.id,
    required this.name,
  });

  factory GenreList.fromJson(Map<String, dynamic> json) {
    return GenreList(
      id: json['id'],
      name: json['name'],
    );
  }
}

class LanguageList {
  final int id;
  final String name;

  LanguageList({
    required this.id,
    required this.name,
  });

  factory LanguageList.fromJson(Map<String, dynamic> json) {
    return LanguageList(
      id: json['id'],
      name: json['name'],
    );
  }
}

class AgeList {
  final int id;
  final String name;

  AgeList({
    required this.id,
    required this.name,
  });

  factory AgeList.fromJson(Map<String, dynamic> json) {
    return AgeList(
      id: json['id'],
      name: json['name'],
    );
  }
}

class CertificationList {
  final int id;
  final String name;

  CertificationList({
    required this.id,
    required this.name,
  });

  factory CertificationList.fromJson(Map<String, dynamic> json) {
    return CertificationList(
      id: json['id'],
      name: json['name'],
    );
  }
}

class CastListInfo {
  final int id;
  final String name;
  final String photo;
  final String personalInfo;

  CastListInfo({
    required this.id,
    required this.name,
    required this.photo,
    required this.personalInfo,
  });

  factory CastListInfo.fromJson(Map<String, dynamic> json) {
    return CastListInfo(
      id: json['id'],
      name: json['name'],
      photo: json['photo'],
      personalInfo: json['personalInfo'],
    );
  }
}
