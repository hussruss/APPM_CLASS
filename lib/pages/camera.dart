import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';

class CameraScreen extends StatelessWidget {
  const CameraScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.pink, Colors.purple],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FloatingActionButton(
                tooltip: 'Tomar foto',
                backgroundColor: Colors.black,
                onPressed: () async {
                  // final picker = ImagePicker();
                  // final XFile? archivoSeleccionado = await picker.pickImage(
                  //     source: ImageSource.camera, imageQuality: 100);
                  // if (archivoSeleccionado == null) {
                  //   ScaffoldMessenger.of(context).showSnackBar(
                  //       const SnackBar(content: Text('No se ha la imagen')));
                  //   return;
                  // }
                  // print(
                  //     'La imagen fue capturada con éxito en ${archivoSeleccionado.path}.');
                },
                child:
                    const Icon(Icons.camera_alt, size: 40, color: Colors.white),
              ),
              const SizedBox(height: 10),
              const Text(
                'Foto',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
              FloatingActionButton(
                tooltip: 'Seleccionar foto',
                backgroundColor: Colors.black,
                onPressed: () async {
                  // final picker = ImagePicker();
                  // final XFile? archivoSeleccionado = await picker.pickImage(
                  //     source: ImageSource.gallery, imageQuality: 100);
                  // if (archivoSeleccionado == null) {
                  //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  //       content: Text('No se seleccionó ninguna imagen')));
                  //   return;
                  // }
                  // print(
                  //     'La imagen fue capturada con éxito en ${archivoSeleccionado.path}.');
                },
                child: const Icon(Icons.photo_library,
                    size: 40, color: Colors.white),
              ),
              const SizedBox(height: 10),
              const Text(
                'Galería',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
