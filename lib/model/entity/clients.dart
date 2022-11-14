import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ClientEntity {
  late String? id;
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
      {this.user,
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
        user: data?["user"],
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
      if (clientAge != null && clientAge!.isNotEmpty) "clientAge": clientAge,
      if (clientHeight != null && clientHeight!.isNotEmpty)
        "clientHeight": clientHeight,
      if (clientWeight != null && clientWeight!.isNotEmpty)
        "clientWeight": clientWeight,
      if (blouseSize != null && blouseSize!.isNotEmpty)
        "blouseSize": blouseSize,
      if (pantSize != null && pantSize!.isNotEmpty) "pantSize": pantSize,
      if (skirtSize != null && skirtSize!.isNotEmpty) "skirtSize": skirtSize,
      if (braSize != null && braSize!.isNotEmpty) "braSize": braSize,
      if (pantySize != null && pantySize!.isNotEmpty) "pantySize": pantySize,
      if (shoeSize != null && shoeSize!.isNotEmpty) "shoeSize": shoeSize,

////card 2
      if (contCuel != null && contCuel!.isNotEmpty) "contCuel": contCuel,
      if (anchHomb != null && anchHomb!.isNotEmpty) "anchHomb": anchHomb,
      if (anchCuel != null && anchCuel!.isNotEmpty) "anchCuel": anchCuel,
      if (anchEspa != null && anchEspa!.isNotEmpty) "anchEspa": anchEspa,
      if (contBust != null && contBust!.isNotEmpty) "contBust": contBust,
      if (contTora != null && contTora!.isNotEmpty) "contTora": contTora,
      if (contCint != null && contCint!.isNotEmpty) "contCint": contCint,
      if (largTalEsp != null && largTalEsp!.isNotEmpty)
        "largTalEsp": largTalEsp,
      if (largTalDel != null && largTalDel!.isNotEmpty)
        "largTalDel": largTalDel,

// card 3
      if (altuBust != null && altuBust!.isNotEmpty) "altuBust": altuBust,
      if (sepaBust != null && sepaBust!.isNotEmpty) "sepaBust": sepaBust,
      if (largTotBra != null && largTotBra!.isNotEmpty)
        "largTotBra": largTotBra,
      if (largBraCod != null && largBraCod!.isNotEmpty)
        "largBraCod": largBraCod,
      if (contBraz != null && contBraz!.isNotEmpty) "contBraz": contBraz,
      if (contCade != null && contCade!.isNotEmpty) "contCade": contCade,
      if (altuCade != null && altuCade!.isNotEmpty) "altuCade": altuCade,
      if (contMedCade != null && contMedCade!.isNotEmpty)
        "contMedCade": contMedCade,
      if (largTiro != null && largTiro!.isNotEmpty) "largTiro": largTiro,

      // card 4
      if (largTotPie != null && largTotPie!.isNotEmpty)
        "largTotPie": largTotPie,
      if (contPier != null && contPier!.isNotEmpty) "contPier": contPier,
      if (largRodi != null && largRodi!.isNotEmpty) "largRodi": largRodi,
      if (observ != null && observ!.isNotEmpty) "observ": observ,
    };
  }

  @override
  String toString() {
    return "Nombre: $clientName, Telefono: $clientPhone, Email: $clientEmail\n\nEdad: $clientAge, Estatura: $clientHeight, Peso: $clientWeight\nTalla blusa: $blouseSize, Talla pantalon: $pantSize, Talla falda: $skirtSize\nTalla brassiere: $braSize, Talla panty : $pantySize, Talla calzado: $shoeSize\n\ncontcue: $contCuel, anch homb: $anchHomb, anch cue: $anchCuel\nanch esp $anchEspa, cont bust: $contBust, cont torax$contTora\nCont cint: $contCint, Larg Talle Espa: $largTalEsp, Largo talt del: $largTalDel\n\nAltura Busto: $altuBust, Separ busto: $sepaBust, Largo ttl braz: $largTotBra\nLargo braz codo: $largBraCod, Contorno brazo: $contBraz, Contorno cadera: $contCade\nAltura cadera: $altuCade, Contorno 1/2 cadera: $contMedCade, Largo tiro: $largTiro\n\nLargo ttl Pierna: $largTotPie, Contorno piern: $contPier, Largo rodill: $largRodi\nObservaciones: $observ";
  }
}
