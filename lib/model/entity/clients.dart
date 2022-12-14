import 'package:cloud_firestore/cloud_firestore.dart';

class ClientEntity {
  late String? clientId;
  // personal information
  late String? user;
  late String? clientAvatar;
  late String? clientName;
  late String? clientPhone;
  late String? clientEmail;

// card 1
  late String? clientAge;
  late String? clientHeight;
  late String? clientWeight;
  late String? blouseSize;
  late String? pantSize;
  late String? skirtSize;
  late String? braSize;
  late String? pantySize;
  late String? shoeSize;

////card 2
  late String? contCuel;
  late String? anchHomb;
  late String? anchCuel;
  late String? anchEspa;
  late String? contBust;
  late String? contTora;
  late String? contCint;
  late String? largTalEsp;
  late String? largTalDel;

// card 3
  late String? altuBust;
  late String? sepaBust;
  late String? largTotBra;
  late String? largBraCod;
  late String? contBraz;
  late String? contCade;
  late String? altuCade;
  late String? contMedCade;
  late String? largTiro;

  // card 4
  late String? largTotPie;
  late String? contPier;
  late String? largRodi;
  late String? observ;

  ClientEntity(
      {this.clientId,
      this.clientAvatar,
      this.clientName,
      this.clientPhone,
      this.clientEmail,
      this.clientAge,
      this.clientHeight,
      this.clientWeight,
      this.blouseSize,
      this.pantSize,
      this.skirtSize,
      this.braSize,
      this.pantySize,
      this.shoeSize,
      this.contCuel,
      this.anchHomb,
      this.anchCuel,
      this.anchEspa,
      this.contBust,
      this.contTora,
      this.contCint,
      this.largTalEsp,
      this.largTalDel,
      this.altuBust,
      this.sepaBust,
      this.largTotBra,
      this.largBraCod,
      this.contBraz,
      this.contCade,
      this.altuCade,
      this.contMedCade,
      this.largTiro,
      this.largTotPie,
      this.contPier,
      this.largRodi,
      this.observ});

  factory ClientEntity.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options) {
    var data = snapshot.data();

    return ClientEntity(
        clientId: snapshot.id,
        clientAvatar: data?["clientAvatar"],
        clientName: data?["clientName"],
        clientPhone: data?["clientPhone"],
        clientEmail: data?["clientEmail"],

// card 1
        clientAge: data?["clientAge"],
        clientHeight: data?["clientHeight"],
        clientWeight: data?["clientWeight"],
        blouseSize: data?["blouseSize"],
        pantSize: data?["pantSize"],
        skirtSize: data?["skirtSize"],
        braSize: data?["braSize"],
        pantySize: data?["pantySize"],
        shoeSize: data?["shoeSize"],

////card 2
        contCuel: data?["contCuel"],
        anchHomb: data?["anchHomb"],
        anchCuel: data?["anchCuel"],
        anchEspa: data?["anchEspa"],
        contBust: data?["contBust"],
        contTora: data?["contTora"],
        contCint: data?["contCint"],
        largTalEsp: data?["largTalEsp"],
        largTalDel: data?["largTalDel"],

// card 3
        altuBust: data?["altuBust"],
        sepaBust: data?["sepaBust"],
        largTotBra: data?["largTotBra"],
        largBraCod: data?["largBraCod"],
        contBraz: data?["contBraz"],
        contCade: data?["contCade"],
        altuCade: data?["altuCade"],
        contMedCade: data?["contMedCade"],
        largTiro: data?["largTiro"],

        // card 4
        largTotPie: data?["largTotPie"],
        contPier: data?["contPier"],
        largRodi: data?["largRodi"],
        observ: data?["observ"]);
  }

  Map<String, dynamic> toFirestore() {
    return {
      if (user != null && user!.isNotEmpty) "user": user,
      if (clientAvatar != null && clientAvatar!.isNotEmpty)
        "clientAvatar": clientAvatar,
      if (clientName != null && clientName!.isNotEmpty)
        "clientName": clientName,
      if (clientPhone != null && clientPhone!.isNotEmpty)
        "clientPhone": clientPhone,
      if (clientEmail != null && clientEmail!.isNotEmpty)
        "clientEmail": clientEmail,

// card 1
      if (clientAge != null && clientAge!.isNotEmpty)
        "clientAge": clientAge
      else
        "clientAge": "-",
      if (clientHeight != null && clientHeight!.isNotEmpty)
        "clientHeight": clientHeight
      else
        "clientHeight": "-",
      if (clientWeight != null && clientWeight!.isNotEmpty)
        "clientWeight": clientWeight
      else
        "clientWeight": "-",
      if (blouseSize != null && blouseSize!.isNotEmpty)
        "blouseSize": blouseSize
      else
        "blouseSize": "-",
      if (pantSize != null && pantSize!.isNotEmpty)
        "pantSize": pantSize
      else
        "pantSize": "-",
      if (skirtSize != null && skirtSize!.isNotEmpty)
        "skirtSize": skirtSize
      else
        "skirtSize": "-",
      if (braSize != null && braSize!.isNotEmpty)
        "braSize": braSize
      else
        "braSize": "-",
      if (pantySize != null && pantySize!.isNotEmpty)
        "pantySize": pantySize
      else
        "pantySize": "-",
      if (shoeSize != null && shoeSize!.isNotEmpty)
        "shoeSize": shoeSize
      else
        "shoeSize": "-",

////card 2
      if (contCuel != null && contCuel!.isNotEmpty)
        "contCuel": contCuel
      else
        "contCuel": "-",
      if (anchHomb != null && anchHomb!.isNotEmpty)
        "anchHomb": anchHomb
      else
        "anchHomb": "-",
      if (anchCuel != null && anchCuel!.isNotEmpty)
        "anchCuel": anchCuel
      else
        "anchCuel": "-",
      if (anchEspa != null && anchEspa!.isNotEmpty)
        "anchEspa": anchEspa
      else
        "anchEspa": "-",
      if (contBust != null && contBust!.isNotEmpty)
        "contBust": contBust
      else
        "contBust": "-",
      if (contTora != null && contTora!.isNotEmpty)
        "contTora": contTora
      else
        "contTora": "-",
      if (contCint != null && contCint!.isNotEmpty)
        "contCint": contCint
      else
        "contCint": "-",
      if (largTalEsp != null && largTalEsp!.isNotEmpty)
        "largTalEsp": largTalEsp
      else
        "largTalEsp": "-",
      if (largTalDel != null && largTalDel!.isNotEmpty)
        "largTalDel": largTalDel
      else
        "largTalDel": "-",

// card 3
      if (altuBust != null && altuBust!.isNotEmpty)
        "altuBust": altuBust
      else
        "altuBust": "-",
      if (sepaBust != null && sepaBust!.isNotEmpty)
        "sepaBust": sepaBust
      else
        "sepaBust": "-",
      if (largTotBra != null && largTotBra!.isNotEmpty)
        "largTotBra": largTotBra
      else
        "largTotBra": "-",
      if (largBraCod != null && largBraCod!.isNotEmpty)
        "largBraCod": largBraCod
      else
        "largBraCod": "-",
      if (contBraz != null && contBraz!.isNotEmpty)
        "contBraz": contBraz
      else
        "contBraz": "-",
      if (contCade != null && contCade!.isNotEmpty)
        "contCade": contCade
      else
        "contCade": "-",
      if (altuCade != null && altuCade!.isNotEmpty)
        "altuCade": altuCade
      else
        "altuCade": "-",
      if (contMedCade != null && contMedCade!.isNotEmpty)
        "contMedCade": contMedCade
      else
        "contMedCade": "-",
      if (largTiro != null && largTiro!.isNotEmpty)
        "largTiro": largTiro
      else
        "largTiro": "-",

      // card 4
      if (largTotPie != null && largTotPie!.isNotEmpty)
        "largTotPie": largTotPie
      else
        "largTotPie": "-",
      if (contPier != null && contPier!.isNotEmpty)
        "contPier": contPier
      else
        "contPier": "-",
      if (largRodi != null && largRodi!.isNotEmpty)
        "largRodi": largRodi
      else
        "largRodi": "-",
      if (observ != null && observ!.isNotEmpty)
        "observ": observ
      else
        "observ": "-",
    };
  }

  @override
  String toString() {
    return "Nombre: $clientName, Telefono: $clientPhone, Email: $clientEmail\n\nEdad: $clientAge, Estatura: $clientHeight, Peso: $clientWeight\nTalla blusa: $blouseSize, Talla pantalon: $pantSize, Talla falda: $skirtSize\nTalla brassiere: $braSize, Talla panty : $pantySize, Talla calzado: $shoeSize\n\ncontcue: $contCuel, anch homb: $anchHomb, anch cue: $anchCuel\nanch esp $anchEspa, cont bust: $contBust, cont torax$contTora\nCont cint: $contCint, Larg Talle Espa: $largTalEsp, Largo talt del: $largTalDel\n\nAltura Busto: $altuBust, Separ busto: $sepaBust, Largo ttl braz: $largTotBra\nLargo braz codo: $largBraCod, Contorno brazo: $contBraz, Contorno cadera: $contCade\nAltura cadera: $altuCade, Contorno 1/2 cadera: $contMedCade, Largo tiro: $largTiro\n\nLargo ttl Pierna: $largTotPie, Contorno piern: $contPier, Largo rodill: $largRodi\nObservaciones: $observ";
  }
}
