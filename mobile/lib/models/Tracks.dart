class Tracks {
  String? id;
  String? name;
  String? images;
  int? durationMs;
  int? popularity;
  String? releaseDate;
  String? mp3;
  bool? status;
  String? albumId;
  String? createdAt;
  String? updatedAt;
  Album? album;

  Tracks(
      {this.id,
      this.name,
      this.images,
      this.durationMs,
      this.popularity,
      this.releaseDate,
      this.mp3,
      this.status,
      this.albumId,
      this.createdAt,
      this.updatedAt,
      this.album});

  Tracks.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    images = json['images'];
    durationMs = json['duration_ms'];
    popularity = json['popularity'];
    releaseDate = json['release_date'];
    mp3 = json['mp3'];
    status = json['status'];
    albumId = json['album_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    album = json['album'] != null ? new Album.fromJson(json['album']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['images'] = this.images;
    data['duration_ms'] = this.durationMs;
    data['popularity'] = this.popularity;
    data['release_date'] = this.releaseDate;
    data['mp3'] = this.mp3;
    data['status'] = this.status;
    data['album_id'] = this.albumId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.album != null) {
      data['album'] = this.album!.toJson();
    }
    return data;
  }
}

class Album {
  String? id;
  String? name;
  String? images;
  int? followers;
  int? popularity;
  String? type;
  int? totalTracks;
  String? releaseDate;
  bool? status;
  String? artistId;
  String? createdAt;
  String? updatedAt;
  Artist? artist;

  Album(
      {this.id,
      this.name,
      this.images,
      this.followers,
      this.popularity,
      this.type,
      this.totalTracks,
      this.releaseDate,
      this.status,
      this.artistId,
      this.createdAt,
      this.updatedAt,
      this.artist});

  Album.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    images = json['images'];
    followers = json['followers'];
    popularity = json['popularity'];
    type = json['type'];
    totalTracks = json['total_tracks'];
    releaseDate = json['release_date'];
    status = json['status'];
    artistId = json['artist_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    artist =
        json['artist'] != null ? new Artist.fromJson(json['artist']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['images'] = this.images;
    data['followers'] = this.followers;
    data['popularity'] = this.popularity;
    data['type'] = this.type;
    data['total_tracks'] = this.totalTracks;
    data['release_date'] = this.releaseDate;
    data['status'] = this.status;
    data['artist_id'] = this.artistId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.artist != null) {
      data['artist'] = this.artist!.toJson();
    }
    return data;
  }
}

class Artist {
  String? id;
  String? name;
  String? images;
  int? followers;
  int? popularity;
  bool? status;
  String? userId;
  String? createdAt;
  String? updatedAt;

  Artist(
      {this.id,
      this.name,
      this.images,
      this.followers,
      this.popularity,
      this.status,
      this.userId,
      this.createdAt,
      this.updatedAt});

  Artist.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    images = json['images'];
    followers = json['followers'];
    popularity = json['popularity'];
    status = json['status'];
    userId = json['user_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['images'] = this.images;
    data['followers'] = this.followers;
    data['popularity'] = this.popularity;
    data['status'] = this.status;
    data['user_id'] = this.userId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}