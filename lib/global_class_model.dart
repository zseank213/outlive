class Meta {
  Meta({
    this.code,
    this.status,
    this.messages,
    this.validations,
    this.responseDate,
  });

  int? code;
  String? status;
  List<String>? messages;
  Validations? validations;
  DateTime? responseDate;

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        code: json["code"] == null ? null : json["code"],
        status: json["status"] == null ? null : json["status"],
        validations: json["validations"] == null ? null : Validations.fromJson(json["validations"]),
        messages: json["messages"] == null ? null : List<String>.from(json["messages"].map((x) => x)),
        responseDate: json["response_date"] == null ? null : DateTime.parse(json["response_date"]),
      );

  Map<String, dynamic> toJson() => {
        "code": code == null ? null : code,
        "status": status == null ? null : status,
        "messages": messages == null ? null : List<dynamic>.from(messages!.map((x) => x)),
        "validations": validations == null ? null : validations?.toJson(),
        "response_date": responseDate == null ? null : responseDate?.toIso8601String(),
      };
}

class Validations {
  Validations({
    this.email,
    this.name,
    this.phone,
    this.address,
    this.country,
    this.province,
    this.city,
    this.pic_name,
    this.pic_position,
    this.file_attachment,
    this.amount,
    this.confirmation_file,
  });

  List<String>? email;
  List<String>? name;
  List<String>? phone;
  List<String>? address;
  List<String>? country;
  List<String>? province;
  List<String>? city;
  List<String>? pic_name;
  List<String>? pic_position;
  List<String>? file_attachment;
  List<String>? amount;
  List<String>? confirmation_file;

  factory Validations.fromJson(Map<String, dynamic> json) => Validations(
        email: json["email"] == null ? null : List<String>.from(json["email"].map((x) => x)),
        name: json["name"] == null ? null : List<String>.from(json["name"].map((x) => x)),
        phone: json["phone"] == null ? null : List<String>.from(json["phone"].map((x) => x)),
        address: json["address"] == null ? null : List<String>.from(json["address"].map((x) => x)),
        country: json["country"] == null ? null : List<String>.from(json["country"].map((x) => x)),
        province: json["province"] == null ? null : List<String>.from(json["province"].map((x) => x)),
        city: json["city"] == null ? null : List<String>.from(json["city"].map((x) => x)),
        pic_name: json["pic_name"] == null ? null : List<String>.from(json["pic_name"].map((x) => x)),
        pic_position: json["pic_position"] == null ? null : List<String>.from(json["pic_position"].map((x) => x)),
        file_attachment: json["file_attachment"] == null ? null : List<String>.from(json["file_attachment"].map((x) => x)),
        amount: json["amount"] == null ? null : List<String>.from(json["amount"].map((x) => x)),
        confirmation_file: json["confirmation_file"] == null ? null : List<String>.from(json["confirmation_file"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "email": email == null ? null : List<dynamic>.from(email!.map((x) => x)),
        "name": name == null ? null : List<dynamic>.from(name!.map((x) => x)),
        "phone": phone == null ? null : List<dynamic>.from(phone!.map((x) => x)),
        "address": address == null ? null : List<dynamic>.from(address!.map((x) => x)),
        "country": country == null ? null : List<dynamic>.from(country!.map((x) => x)),
        "province": province == null ? null : List<dynamic>.from(province!.map((x) => x)),
        "city": city == null ? null : List<dynamic>.from(city!.map((x) => x)),
        "pic_name": pic_name == null ? null : List<dynamic>.from(pic_name!.map((x) => x)),
        "pic_position": pic_position == null ? null : List<dynamic>.from(pic_position!.map((x) => x)),
        "file_attachment": file_attachment == null ? null : List<dynamic>.from(file_attachment!.map((x) => x)),
      };
}

class Link {
  Link({
    this.url,
    this.label,
    this.active,
  });

  String? url;
  String? label;
  bool? active;

  factory Link.fromJson(Map<String, dynamic> json) => Link(
        url: json["url"] == null ? null : json["url"],
        label: json["label"] == null ? null : json["label"],
        active: json["active"] == null ? null : json["active"],
      );

  Map<String, dynamic> toJson() => {
        "url": url == null ? null : url,
        "label": label == null ? null : label,
        "active": active == null ? null : active,
      };
}

class Commodity {
  Commodity({
    this.code,
    this.name,
    this.slug,
    this.coverUrl,
    this.excerptDescription,
    this.unit,
    this.amountPerLot,
  });

  String? code;
  String? name;
  String? slug;
  String? coverUrl;
  String? excerptDescription;
  String? unit;
  int? amountPerLot;

  factory Commodity.fromJson(Map<String, dynamic> json) => Commodity(
        code: json["code"] == null ? null : json["code"],
        name: json["name"] == null ? null : json["name"],
        slug: json["slug"] == null ? null : json["slug"],
        coverUrl: json["cover_url"] == null ? null : json["cover_url"],
        excerptDescription: json["excerpt_description"] == null ? null : json["excerpt_description"],
        unit: json["unit"] == null ? null : json["unit"],
        amountPerLot: json["amount_per_lot"] == null ? null : json["amount_per_lot"],
      );

  Map<String, dynamic> toJson() => {
        "code": code == null ? null : code,
        "name": name == null ? null : name,
        "slug": slug == null ? null : slug,
        "cover_url": coverUrl == null ? null : coverUrl,
        "excerpt_description": excerptDescription == null ? null : excerptDescription,
        "unit": unit == null ? null : unit,
        "amount_per_lot": amountPerLot == null ? null : amountPerLot,
      };
}

class Warehouse {
  Warehouse({
    this.slug,
    this.name,
    this.location,
    this.description,
  });

  String? slug;
  String? name;
  String? location;
  String? description;

  factory Warehouse.fromJson(Map<String, dynamic> json) => Warehouse(
        slug: json["slug"] == null ? null : json["slug"],
        name: json["name"] == null ? null : json["name"],
        location: json["location"] == null ? null : json["location"],
        description: json["description"] == null ? null : json["description"],
      );

  Map<String, dynamic> toJson() => {
        "slug": slug == null ? null : slug,
        "name": name == null ? null : name,
        "location": location == null ? null : location,
        "description": description == null ? null : description,
      };
}

class Auction {
  Auction({
    this.uuid,
    this.commodity,
    this.warehouse,
    this.tradingAlgorithm,
    this.priceMovement,
    this.lastPrice,
  });

  String? uuid;
  Commodity? commodity;
  Warehouse? warehouse;
  String? tradingAlgorithm;
  dynamic priceMovement;
  dynamic lastPrice;

  factory Auction.fromJson(Map<String, dynamic> json) => Auction(
        uuid: json["uuid"],
        commodity: json["commodity"] == null ? null : Commodity.fromJson(json["commodity"]),
        warehouse: json["warehouse"] == null ? null : Warehouse.fromJson(json["warehouse"]),
        tradingAlgorithm: json["trading_algorithm"] == null ? null : json["trading_algorithm"],
        priceMovement: json["price_movement"],
        lastPrice: json["last_price"],
      );

  Map<String, dynamic> toJson() => {
        "uuid": uuid == null ? null : uuid,
        "commodity": commodity == null ? null : commodity?.toJson(),
        "warehouse": warehouse == null ? null : warehouse?.toJson(),
        "trading_algorithm": tradingAlgorithm == null ? null : tradingAlgorithm,
        "price_movement": priceMovement == null ? null : priceMovement,
        "last_price": lastPrice == null ? null : lastPrice,
      };
}

class BankAccount {
  BankAccount({
    this.uuid,
    this.bankName,
    this.accountNumber,
    this.accountHolder,
    this.fileAttachmentUrl,
  });

  String? uuid;
  String? bankName;
  String? accountNumber;
  String? accountHolder;
  String? fileAttachmentUrl;

  factory BankAccount.fromJson(Map<String, dynamic> json) => BankAccount(
        uuid: json["uuid"],
        bankName: json["bank_name"],
        accountNumber: json["account_number"],
        accountHolder: json["account_holder"],
        fileAttachmentUrl: json["file_attachment_url"],
      );

  Map<String, dynamic> toJson() => {
        "uuid": uuid,
        "bank_name": bankName,
        "account_number": accountNumber,
        "account_holder": accountHolder,
        "file_attachment_url": fileAttachmentUrl,
      };
}
