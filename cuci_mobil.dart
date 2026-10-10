import 'dart:io';

void main(){
bool jalan = true;
List<String> waitinglist = [];
Map posA = {'plat': null};
Map posB = {'plat': null};
Map posC = {'plat': null};

// Tambah Mobil
void tambahlist (){
  stdout.write('plat kendaraan : ');
  String? plat = stdin.readLineSync();

  if (plat == null || plat.trim().isEmpty) return;

  // cek pos kosong berurutan A -> B -> C
  if (posA['plat'] == null){
    posA['plat'] = plat;
  } else if (posB['plat'] == null){
    posB['plat'] = plat;
  } else if (posC['plat'] == null){
    posC['plat'] = plat;
  } else {
    // kalau pos A,B,C penuh semua, masuk ke waiting list
    waitinglist.add(plat);
  }
}

// Lihat waiting list
void showlist(){
  print('===============');
  print('Daftar waiting list');
  print('===============');
  if (waitinglist.isEmpty){
    print('Waiting list kosong');
  } else {
    for (int i = 0; i<waitinglist.length; i++){
      print('${i+1}. ${waitinglist[i]}');
    }
  }
  print('================');
}

// lihat pos
void showpos(){
  print('================');
  print('Antrian Pada Pos');
  print('================');
  print('Pos A : ${posA['plat'] ?? '-'}');
  print('Pos B : ${posB['plat'] ?? '-'}');
  print('Pos C : ${posC['plat'] ?? '-'}');
  print('================');
}

// Selesaikan Pos
void finishpos(){
  stdout.write('Pilih Pos Yang Selesai (A/B/C) : ');
  String? pilihpos = stdin.readLineSync()?.toUpperCase();

  if (pilihpos == 'A'){
    posA['plat'] = null;
    if (waitinglist.isNotEmpty){
      posA['plat'] = waitinglist.removeAt(0); //ambil elemen paling depan
    }
  } else if (pilihpos == 'B'){
    posB['plat'] = null;
    if (waitinglist.isNotEmpty){
      posB['plat'] = waitinglist.removeAt(0);
    }
  } else if (pilihpos == 'C'){
    posC['plat'] = null;
    if (waitinglist.isNotEmpty){
      posC['plat'] = waitinglist.removeAt(0);
    }
  } else {
    print('Pos tidak valid!');
  }
}

// Loop utama menu
while(jalan){
  print('===============');
  print('Wash & Clean');
  print('===============');
  print('1. Tambah Waiting List');
  print('2. Lihat Waiting List ');
  print('3. Lihat Pos');
  print('4. Selesaikan Pos');
  print('5. Keluar Dari Aplikasi');
  print('===============');
  stdout.write('Pilih Menu (1/2/3/4/5) :');
  String? pilihan = stdin.readLineSync();
  
  switch(pilihan) {
    case'1':
    tambahlist();
    break;
    case'2':
    showlist();
    break;
    case'3':
    showpos();
    break;
    case'4':
    finishpos();
    break;
    case'5':
    jalan = false;
    exit(0);
    default:
    print('Pilihan tidak ada, coba lagi.\n');
  }
}
}