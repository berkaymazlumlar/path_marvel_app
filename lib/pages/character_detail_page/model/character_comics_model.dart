// To parse this JSON data, do
//
//     final characterComics = characterComicsFromJson(jsonString?);

import 'dart:convert';

CharacterComics characterComicsFromJson(String? str) =>
    CharacterComics.fromJson(json.decode(str!));

String? characterComicsToJson(CharacterComics data) =>
    json.encode(data.toJson());

class CharacterComics {
  CharacterComics({
    this.code,
    this.status,
    this.copyright,
    this.attributionText,
    this.attributionHtml,
    this.etag,
    this.data,
  });

  final int? code;
  final String? status;
  final String? copyright;
  final String? attributionText;
  final String? attributionHtml;
  final String? etag;
  final Data? data;

  factory CharacterComics.fromJson(Map<String?, dynamic> json) =>
      CharacterComics(
        code: json["code"] == null ? null : json["code"],
        status: json["status"] == null ? null : json["status"],
        copyright: json["copyright"] == null ? null : json["copyright"],
        attributionText:
            json["attributionText"] == null ? null : json["attributionText"],
        attributionHtml:
            json["attributionHTML"] == null ? null : json["attributionHTML"],
        etag: json["etag"] == null ? null : json["etag"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String?, dynamic> toJson() => {
        "code": code == null ? null : code,
        "status": status == null ? null : status,
        "copyright": copyright == null ? null : copyright,
        "attributionText": attributionText == null ? null : attributionText,
        "attributionHTML": attributionHtml == null ? null : attributionHtml,
        "etag": etag == null ? null : etag,
        "data": data == null ? null : data!.toJson(),
      };
}

class Data {
  Data({
    this.offset,
    this.limit,
    this.total,
    this.count,
    this.results,
  });

  final int? offset;
  final int? limit;
  final int? total;
  final int? count;
  final List<Result>? results;

  factory Data.fromJson(Map<String?, dynamic> json) => Data(
        offset: json["offset"] == null ? null : json["offset"],
        limit: json["limit"] == null ? null : json["limit"],
        total: json["total"] == null ? null : json["total"],
        count: json["count"] == null ? null : json["count"],
        results: json["results"] == null
            ? null
            : List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
      );

  Map<String?, dynamic> toJson() => {
        "offset": offset == null ? null : offset,
        "limit": limit == null ? null : limit,
        "total": total == null ? null : total,
        "count": count == null ? null : count,
        "results": results == null
            ? null
            : List<dynamic>.from(results!.map((x) => x.toJson())),
      };
}

class Result {
  Result({
    this.id,
    this.digitalId,
    this.title,
    this.issueNumber,
    this.variantDescription,
    this.description,
    this.modified,
    this.isbn,
    this.upc,
    this.diamondCode,
    this.ean,
    this.issn,
    this.format,
    this.pageCount,
    this.textObjects,
    this.resourceUri,
    this.urls,
    this.series,
    this.variants,
    this.collections,
    this.collectedIssues,
    this.dates,
    this.prices,
    this.thumbnail,
    this.images,
    this.creators,
    this.characters,
    this.stories,
    this.events,
  });

  final int? id;
  final int? digitalId;
  final String? title;
  final int? issueNumber;
  final String? variantDescription;
  final String? description;
  final String? modified;
  final String? isbn;
  final String? upc;
  final String? diamondCode;
  final String? ean;
  final String? issn;
  final String? format;
  final int? pageCount;
  final List<TextObject>? textObjects;
  final String? resourceUri;
  final List<Url>? urls;
  final Series? series;
  final List<Series>? variants;
  final List<dynamic>? collections;
  final List<dynamic>? collectedIssues;
  final List<Date>? dates;
  final List<Price>? prices;
  final Thumbnail? thumbnail;
  final List<Thumbnail>? images;
  final Creators? creators;
  final Characters? characters;
  final Stories? stories;
  final Characters? events;

  factory Result.fromJson(Map<String?, dynamic> json) => Result(
        id: json["id"] == null ? null : json["id"],
        digitalId: json["digitalId"] == null ? null : json["digitalId"],
        title: json["title"] == null ? null : json["title"],
        issueNumber: json["issueNumber"] == null ? null : json["issueNumber"],
        variantDescription: json["variantDescription"] == null
            ? null
            : json["variantDescription"],
        description: json["description"] == null ? null : json["description"],
        modified: json["modified"] == null ? null : json["modified"],
        isbn: json["isbn"] == null ? null : json["isbn"],
        upc: json["upc"] == null ? null : json["upc"],
        diamondCode: json["diamondCode"] == null ? null : json["diamondCode"],
        ean: json["ean"] == null ? null : json["ean"],
        issn: json["issn"] == null ? null : json["issn"],
        format: json["format"] == null ? null : json["format"],
        pageCount: json["pageCount"] == null ? null : json["pageCount"],
        textObjects: json["textObjects"] == null
            ? null
            : List<TextObject>.from(
                json["textObjects"].map((x) => TextObject.fromJson(x))),
        resourceUri: json["resourceURI"] == null ? null : json["resourceURI"],
        urls: json["urls"] == null
            ? null
            : List<Url>.from(json["urls"].map((x) => Url.fromJson(x))),
        series: json["series"] == null ? null : Series.fromJson(json["series"]),
        variants: json["variants"] == null
            ? null
            : List<Series>.from(
                json["variants"].map((x) => Series.fromJson(x))),
        collections: json["collections"] == null
            ? null
            : List<dynamic>.from(json["collections"].map((x) => x)),
        collectedIssues: json["collectedIssues"] == null
            ? null
            : List<dynamic>.from(json["collectedIssues"].map((x) => x)),
        dates: json["dates"] == null
            ? null
            : List<Date>.from(json["dates"].map((x) => Date.fromJson(x))),
        prices: json["prices"] == null
            ? null
            : List<Price>.from(json["prices"].map((x) => Price.fromJson(x))),
        thumbnail: json["thumbnail"] == null
            ? null
            : Thumbnail.fromJson(json["thumbnail"]),
        images: json["images"] == null
            ? null
            : List<Thumbnail>.from(
                json["images"].map((x) => Thumbnail.fromJson(x))),
        creators: json["creators"] == null
            ? null
            : Creators.fromJson(json["creators"]),
        characters: json["characters"] == null
            ? null
            : Characters.fromJson(json["characters"]),
        stories:
            json["stories"] == null ? null : Stories.fromJson(json["stories"]),
        events:
            json["events"] == null ? null : Characters.fromJson(json["events"]),
      );

  Map<String?, dynamic> toJson() => {
        "id": id == null ? null : id,
        "digitalId": digitalId == null ? null : digitalId,
        "title": title == null ? null : title,
        "issueNumber": issueNumber == null ? null : issueNumber,
        "variantDescription":
            variantDescription == null ? null : variantDescription,
        "description": description == null ? null : description,
        "modified": modified == null ? null : modified,
        "isbn": isbn == null ? null : isbn,
        "upc": upc == null ? null : upc,
        "diamondCode": diamondCode == null ? null : diamondCode,
        "ean": ean == null ? null : ean,
        "issn": issn == null ? null : issn,
        "format": format == null ? null : format,
        "pageCount": pageCount == null ? null : pageCount,
        "textObjects": textObjects == null
            ? null
            : List<dynamic>.from(textObjects!.map((x) => x.toJson())),
        "resourceURI": resourceUri == null ? null : resourceUri,
        "urls": urls == null
            ? null
            : List<dynamic>.from(urls!.map((x) => x.toJson())),
        "series": series == null ? null : series!.toJson(),
        "variants": variants == null
            ? null
            : List<dynamic>.from(variants!.map((x) => x.toJson())),
        "collections": collections == null
            ? null
            : List<dynamic>.from(collections!.map((x) => x)),
        "collectedIssues": collectedIssues == null
            ? null
            : List<dynamic>.from(collectedIssues!.map((x) => x)),
        "dates": dates == null
            ? null
            : List<dynamic>.from(dates!.map((x) => x.toJson())),
        "prices": prices == null
            ? null
            : List<dynamic>.from(prices!.map((x) => x.toJson())),
        "thumbnail": thumbnail == null ? null : thumbnail!.toJson(),
        "images": images == null
            ? null
            : List<dynamic>.from(images!.map((x) => x.toJson())),
        "creators": creators == null ? null : creators!.toJson(),
        "characters": characters == null ? null : characters!.toJson(),
        "stories": stories == null ? null : stories!.toJson(),
        "events": events == null ? null : events!.toJson(),
      };
}

class Characters {
  Characters({
    this.available,
    this.collectionUri,
    this.items,
    this.returned,
  });

  final int? available;
  final String? collectionUri;
  final List<Series>? items;
  final int? returned;

  factory Characters.fromJson(Map<String?, dynamic> json) => Characters(
        available: json["available"] == null ? null : json["available"],
        collectionUri:
            json["collectionURI"] == null ? null : json["collectionURI"],
        items: json["items"] == null
            ? null
            : List<Series>.from(json["items"].map((x) => Series.fromJson(x))),
        returned: json["returned"] == null ? null : json["returned"],
      );

  Map<String?, dynamic> toJson() => {
        "available": available == null ? null : available,
        "collectionURI": collectionUri == null ? null : collectionUri,
        "items": items == null
            ? null
            : List<dynamic>.from(items!.map((x) => x.toJson())),
        "returned": returned == null ? null : returned,
      };
}

class Series {
  Series({
    this.resourceUri,
    this.name,
  });

  final String? resourceUri;
  final String? name;

  factory Series.fromJson(Map<String?, dynamic> json) => Series(
        resourceUri: json["resourceURI"] == null ? null : json["resourceURI"],
        name: json["name"] == null ? null : json["name"],
      );

  Map<String?, dynamic> toJson() => {
        "resourceURI": resourceUri == null ? null : resourceUri,
        "name": name == null ? null : name,
      };
}

class Creators {
  Creators({
    this.available,
    this.collectionUri,
    this.items,
    this.returned,
  });

  final int? available;
  final String? collectionUri;
  final List<CreatorsItem>? items;
  final int? returned;

  factory Creators.fromJson(Map<String?, dynamic> json) => Creators(
        available: json["available"] == null ? null : json["available"],
        collectionUri:
            json["collectionURI"] == null ? null : json["collectionURI"],
        items: json["items"] == null
            ? null
            : List<CreatorsItem>.from(
                json["items"].map((x) => CreatorsItem.fromJson(x))),
        returned: json["returned"] == null ? null : json["returned"],
      );

  Map<String?, dynamic> toJson() => {
        "available": available == null ? null : available,
        "collectionURI": collectionUri == null ? null : collectionUri,
        "items": items == null
            ? null
            : List<dynamic>.from(items!.map((x) => x.toJson())),
        "returned": returned == null ? null : returned,
      };
}

class CreatorsItem {
  CreatorsItem({
    this.resourceUri,
    this.name,
    this.role,
  });

  final String? resourceUri;
  final String? name;
  final String? role;

  factory CreatorsItem.fromJson(Map<String?, dynamic> json) => CreatorsItem(
        resourceUri: json["resourceURI"] == null ? null : json["resourceURI"],
        name: json["name"] == null ? null : json["name"],
        role: json["role"] == null ? null : json["role"],
      );

  Map<String?, dynamic> toJson() => {
        "resourceURI": resourceUri == null ? null : resourceUri,
        "name": name == null ? null : name,
        "role": role == null ? null : role,
      };
}

class Date {
  Date({
    this.type,
    this.date,
  });

  final String? type;
  final String? date;

  factory Date.fromJson(Map<String?, dynamic> json) => Date(
        type: json["type"] == null ? null : json["type"],
        date: json["date"] == null ? null : json["date"],
      );

  Map<String?, dynamic> toJson() => {
        "type": type == null ? null : type,
        "date": date == null ? null : date,
      };
}

class Thumbnail {
  Thumbnail({
    this.path,
    this.extension,
  });

  final String? path;
  final String? extension;

  factory Thumbnail.fromJson(Map<String?, dynamic> json) => Thumbnail(
        path: json["path"] == null ? null : json["path"],
        extension: json["extension"] == null ? null : json["extension"],
      );

  Map<String?, dynamic> toJson() => {
        "path": path == null ? null : path,
        "extension": extension == null ? null : extension,
      };
}

class Price {
  Price({
    this.type,
    this.price,
  });

  final String? type;
  final double? price;

  factory Price.fromJson(Map<String?, dynamic> json) => Price(
        type: json["type"] == null ? null : json["type"],
        price: json["price"] == null ? null : json["price"].toDouble(),
      );

  Map<String?, dynamic> toJson() => {
        "type": type == null ? null : type,
        "price": price == null ? null : price,
      };
}

class Stories {
  Stories({
    this.available,
    this.collectionUri,
    this.items,
    this.returned,
  });

  final int? available;
  final String? collectionUri;
  final List<StoriesItem>? items;
  final int? returned;

  factory Stories.fromJson(Map<String?, dynamic> json) => Stories(
        available: json["available"] == null ? null : json["available"],
        collectionUri:
            json["collectionURI"] == null ? null : json["collectionURI"],
        items: json["items"] == null
            ? null
            : List<StoriesItem>.from(
                json["items"].map((x) => StoriesItem.fromJson(x))),
        returned: json["returned"] == null ? null : json["returned"],
      );

  Map<String?, dynamic> toJson() => {
        "available": available == null ? null : available,
        "collectionURI": collectionUri == null ? null : collectionUri,
        "items": items == null
            ? null
            : List<dynamic>.from(items!.map((x) => x.toJson())),
        "returned": returned == null ? null : returned,
      };
}

class StoriesItem {
  StoriesItem({
    this.resourceUri,
    this.name,
    this.type,
  });

  final String? resourceUri;
  final String? name;
  final String? type;

  factory StoriesItem.fromJson(Map<String?, dynamic> json) => StoriesItem(
        resourceUri: json["resourceURI"] == null ? null : json["resourceURI"],
        name: json["name"] == null ? null : json["name"],
        type: json["type"] == null ? null : json["type"],
      );

  Map<String?, dynamic> toJson() => {
        "resourceURI": resourceUri == null ? null : resourceUri,
        "name": name == null ? null : name,
        "type": type == null ? null : type,
      };
}

class TextObject {
  TextObject({
    this.type,
    this.language,
    this.text,
  });

  final String? type;
  final String? language;
  final String? text;

  factory TextObject.fromJson(Map<String?, dynamic> json) => TextObject(
        type: json["type"] == null ? null : json["type"],
        language: json["language"] == null ? null : json["language"],
        text: json["text"] == null ? null : json["text"],
      );

  Map<String?, dynamic> toJson() => {
        "type": type == null ? null : type,
        "language": language == null ? null : language,
        "text": text == null ? null : text,
      };
}

class Url {
  Url({
    this.type,
    this.url,
  });

  final String? type;
  final String? url;

  factory Url.fromJson(Map<String?, dynamic> json) => Url(
        type: json["type"] == null ? null : json["type"],
        url: json["url"] == null ? null : json["url"],
      );

  Map<String?, dynamic> toJson() => {
        "type": type == null ? null : type,
        "url": url == null ? null : url,
      };
}
