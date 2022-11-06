import 'package:flutter/material.dart';

class ClientEntity {
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

ClientEntity({this.user, this.clientAvatar, this.clientName, this.clientPhone, this.clientEmail, this.clientAge, this.clientHeight, this.clientWeight, this.blouseSize, this.pantSize, this.skirtSize, this.braSize, this.pantySize, this.shoeSize, this.contCuel, this.anchHomb, this.anchCuel, this.anchEspa, this.contBust, this.contTora, this.contCint, this.largTalEsp, this.largTalDel, this.altuBust, this.sepaBust, this.largTotBra, this.largBraCod, this.contBraz, this.contCade, this.altuCade, this.contMedCade, this.largTiro, this.largTotPie, this.contPier, this.largRodi, this.observ});

  @override
  String toString() {
    return "Nombre: $clientName, Telefono: $clientPhone, Email: $clientEmail\n\nEdad: $clientAge, Estatura: $clientHeight, Peso: $clientWeight\nTalla blusa: $blouseSize, Talla pantalon: $pantSize, Talla falda: $skirtSize\nTalla brassiere: $braSize, Talla panty : $pantySize, Talla calzado: $shoeSize\n\ncontcue: $contCuel, anch homb: $anchHomb, anch cue: $anchCuel\nanch esp $anchEspa, cont bust: $contBust, cont torax$contTora\nCont cint: $contCint, Larg Talle Espa: $largTalEsp, Largo talt del: $largTalDel\n\nAltura Busto: $altuBust, Separ busto: $sepaBust, Largo ttl braz: $largTotBra\nLargo braz codo: $largBraCod, Contorno brazo: $contBraz, Contorno cadera: $contCade\nAltura cadera: $altuCade, Contorno 1/2 cadera: $contMedCade, Largo tiro: $largTiro\n\nLargo ttl Pierna: $largTotPie, Contorno piern: $contPier, Largo rodill: $largRodi\nObservaciones: $observ";
  }
}
