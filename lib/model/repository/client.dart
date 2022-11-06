import 'dart:html';

import '../entity/clients.dart';

class ClientRepository {
  final _clients = <String, ClientEntity>{};

  ClientRepository() {
    _clients["maria@mail.com"] = ClientEntity(
      user: "leonnarddo@gmail.com",
      clientAvatar: "assets/cliente01.jpg",
      clientName: "Maria Castro",
      clientPhone: "3213456789",
      clientEmail: "maria@mail.com",
//card1
      clientAge: "23",
      clientHeight: "1.62",
      clientWeight: "60",
      blouseSize: "m",
      pantSize: "m",
      skirtSize: "m",
      braSize: "34A",
      pantySize: "s-m",
      shoeSize: "36",
//card2
      contCuel: "34",
      anchHomb: "11.5",
      anchCuel: "20",
      anchEspa: "33",
      contBust: "83",
      contTora: "77.5",
      contCint: "66",
      largTalEsp: "40",
      largTalDel: "42",
//card3
      altuBust: "23",
      sepaBust: "17",
      largTotBra: "57",
      largBraCod: "32",
      contBraz: "22",
      contCade: "90",
      altuCade: "19.5",
      contMedCade: "70",
      largTiro: "22.5",
//card4
      largTotPie: "98",
      contPier: "",
      largRodi: "57",
      observ: "Alérgica al encaje",
    );
    _clients["Cristina@mail.com"] = ClientEntity(
      user: "leonnarddo@gmail.com",
      clientAvatar: "assets/cliente02.jpg",
      clientName: "Cristina Montero",
      clientPhone: "3213456789",
      clientEmail: "maria@mail.com",
//card1
      clientAge: "35",
      clientHeight: "1.56",
      clientWeight: "62",
      blouseSize: "S",
      pantSize: "m",
      skirtSize: "m",
      braSize: "32A",
      pantySize: "s-m",
      shoeSize: "36",
//card2
      contCuel: "34",
      anchHomb: "11.5",
      anchCuel: "20",
      anchEspa: "33",
      contBust: "80",
      contTora: "74",
      contCint: "66",
      largTalEsp: "40",
      largTalDel: "42",
//card3
      altuBust: "23",
      sepaBust: "17",
      largTotBra: "57",
      largBraCod: "32",
      contBraz: "22",
      contCade: "90",
      altuCade: "19.5",
      contMedCade: "70",
      largTiro: "22.5",
//card4
      largTotPie: "98",
      contPier: "",
      largRodi: "57",
      observ: "prefiere la ropa floja",
    );
    _clients["sofia@mail.com"] = ClientEntity(
      user: "leonnarddo@gmail.com",
      clientAvatar: "assets/cliente03.jpg",
      clientName: "Sofia Pulido",
      clientPhone: "3213456789",
      clientEmail: "maria@mail.com",
//card1
      clientAge: "19",
      clientHeight: "1.65",
      clientWeight: "60",
      blouseSize: "m",
      pantSize: "m",
      skirtSize: "m",
      braSize: "34A",
      pantySize: "s-m",
      shoeSize: "36",
//card2
      contCuel: "34",
      anchHomb: "11.5",
      anchCuel: "20",
      anchEspa: "33",
      contBust: "83",
      contTora: "77.5",
      contCint: "66",
      largTalEsp: "40",
      largTalDel: "42",
//card3
      altuBust: "23",
      sepaBust: "17",
      largTotBra: "57",
      largBraCod: "32",
      contBraz: "22",
      contCade: "90",
      altuCade: "19.5",
      contMedCade: "70",
      largTiro: "22.5",
//card4
      largTotPie: "98",
      contPier: "",
      largRodi: "57",
      observ: "Alérgica al encaje",
    );
  }
}
