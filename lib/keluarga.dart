import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: KeluargaPage(),
    );
  }
}

class KeluargaPage extends StatefulWidget {
  @override
  _KeluargaPageState createState() => _KeluargaPageState();
}

class _KeluargaPageState extends State<KeluargaPage> {
  String? selectedKeluarga;

  // Deklarasi controller
  TextEditingController _namaController = TextEditingController();
  TextEditingController _hubunganController = TextEditingController();
  TextEditingController _teleponController = TextEditingController();
  TextEditingController _alamatController = TextEditingController();

  // Variabel untuk validasi
  bool _validateNama = false;
  bool _validateHubungan = false;
  bool _validateTelepon = false;
  bool _validateAlamat = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(228, 255, 255, 255),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.black,
          onPressed: () {
            // Aksi saat tombol ditekan
          },
        ),
        title: Text(
          'Keluarga',
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 26,
            fontWeight: FontWeight.bold,
            color: Color(0xFF00A9FF),
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: EdgeInsets.all(20.0),
                padding: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  color: Color.fromRGBO(160, 233, 255, 30),
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Tambah Keluarga',
                      style: TextStyle(color: Colors.black),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Container(
                margin: EdgeInsets.all(20.0),
                padding: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  color: Color.fromRGBO(179, 230, 255, 100),
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Column(
                  children: [
                    TextFormField(
                      controller: _namaController,
                      decoration: InputDecoration(
                        labelText: 'Nama',
                        errorText: _validateNama ? 'Nama harus diisi' : null,
                      ),
                      onChanged: (value) {
                        setState(() {
                          _validateNama = value.isEmpty;
                        });
                      },
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      controller: _hubunganController,
                      decoration: InputDecoration(
                        labelText: 'Hubungan Keluarga',
                        errorText: _validateHubungan ? 'Hubungan keluarga harus diisi' : null,
                      ),
                      onChanged: (value) {
                        setState(() {
                          _validateHubungan = value.isEmpty;
                        });
                      },
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      controller: _teleponController,
                      decoration: InputDecoration(
                        labelText: 'Nomor Telepon',
                        errorText: _validateTelepon ? 'Nomor telepon harus diisi' : null,
                      ),
                      onChanged: (value) {
                        setState(() {
                          _validateTelepon = value.isEmpty;
                        });
                      },
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      controller: _alamatController,
                      decoration: InputDecoration(
                        labelText: 'Alamat',
                        errorText: _validateAlamat ? 'Alamat harus diisi' : null,
                      ),
                      onChanged: (value) {
                        setState(() {
                          _validateAlamat = value.isEmpty;
                        });
                      },
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          // Validasi setiap field saat tombol simpan ditekan
                          _validateNama = _namaController.text.isEmpty;
                          _validateHubungan = _hubunganController.text.isEmpty;
                          _validateTelepon = _teleponController.text.isEmpty;
                          _validateAlamat = _alamatController.text.isEmpty;
                        });

                        // Jika tidak ada pesan error, tampilkan popup "Data berhasil ditambahkan"
                        if (!_validateNama &&
                            !_validateHubungan &&
                            !_validateTelepon &&
                            !_validateAlamat) {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text("Sukses"),
                                content: Text("Data berhasil ditambahkan."),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text("OK"),
                                  ),
                                ],
                              );
                            },
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromRGBO(160, 233, 255, 30),
                      ),
                      child: Text(
                        'Simpan',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.all(20.0),
                padding: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  color: Color.fromRGBO(160, 233, 255, 30),
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Column(
                  children: [
                    DropdownButton<String>(
                      hint: Text(
                        'Daftar Keluarga Pasien',
                        style: TextStyle(color: Colors.black),
                      ),
                      value: selectedKeluarga,
                      icon: Icon(Icons.arrow_drop_down),
                      iconSize: 36,
                      isExpanded: true,
                      underline: SizedBox(),
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedKeluarga = newValue;
                        });
                      },
                      items: <String>[
                        'Keluarga 1',
                        'Keluarga 2',
                        'Keluarga 3'
                      ].map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                    if (selectedKeluarga != null) ...[
                      SizedBox(height: 20),
                      Text(
                        'Data Keluarga Pasien:',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10),
                      if (selectedKeluarga == 'Keluarga 1') ...[
                        ListView(
                          shrinkWrap: true,
                          children: [
                            Text(
                              'Desi NingTyas',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'IBU PASIEN',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              '081261927199',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'Jl. Indah Jaya No.18 Bandung',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ] else if (selectedKeluarga == 'Keluarga 2') ...[
                        ListView(
                          shrinkWrap: true,
                          children: [
                            Text(
                              'Putri Septiani',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'KAKAK PEREMPUAN PASIEN',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              '081782190023',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'Jl. Indah Jaya No.18 Bandung',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ] else if (selectedKeluarga == 'Keluarga 3') ...[
                        ListView(
                          shrinkWrap: true,
                          children: [
                            Text(
                              'Desi NingTyas',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'IBU PASIEN',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              '081261927199',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'Jl. Indah Jaya No.18 Bandung',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ],
                    ],
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
