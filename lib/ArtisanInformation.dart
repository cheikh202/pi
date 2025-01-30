import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:permission_handler/permission_handler.dart';

class ArtisanInformationPage extends StatefulWidget {
  @override
  _ArtisanInformationPageState createState() => _ArtisanInformationPageState();
}

class _ArtisanInformationPageState extends State<ArtisanInformationPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController nniController = TextEditingController();
  bool isLoading = false;
  File? photo;
  File? idCardImage;
  List<Map<String, dynamic>> services = [];
  List<Map<String, dynamic>> serviceAreas = [];
  List<int> selectedServices = [];
  List<int> selectedServiceAreas = [];

  @override
  void initState() {
    super.initState();
    fetchServices();
    fetchServiceAreas();
  }

  Future<void> fetchServices() async {
    final url = Uri.parse('http://10.0.2.2:8000/api/Service/');
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          services = List<Map<String, dynamic>>.from(data);
        });
      } else {
        showSnackbar("Erreur lors de la récupération des services.");
      }
    } catch (e) {
      showSnackbar("Erreur réseau: $e");
    }
  }

  Future<void> fetchServiceAreas() async {
    final url = Uri.parse('http://10.0.2.2:8000/api/Area/');
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          serviceAreas = List<Map<String, dynamic>>.from(data);
        });
      } else {
        showSnackbar("Erreur lors de la récupération des zones de service.");
      }
    } catch (e) {
      showSnackbar("Erreur réseau: $e");
    }
  }

  void showSnackbar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  }

  Future<void> pickImageFromGallery() async {
    final permissionStatus = await Permission.photos.request();

    if (permissionStatus.isGranted) {
      final picker = ImagePicker();
      final pickedFile = await picker.pickImage(source: ImageSource.gallery);

      if (pickedFile != null) {
        setState(() {
          idCardImage = File(pickedFile.path);
        });
      } else {
        print("Aucune image sélectionnée.");
      }
    } else {
      print("Permission refusée.");
      showSnackbar("Permission d'accès à la galerie refusée.");
    }
  }

  Future<void> pickImage(ImageSource source, bool isPhoto) async {
    final permissionStatus = source == ImageSource.camera
        ? await Permission.camera.request()
        : await Permission.photos.request();

    if (permissionStatus.isGranted) {
      final picker = ImagePicker();
      final pickedFile = await picker.pickImage(source: source);

      if (pickedFile != null) {
        setState(() {
          if (isPhoto) {
            photo = File(pickedFile.path);
          } else {
            idCardImage = File(pickedFile.path);
          }
        });
      } else {
        print("Aucune image sélectionnée.");
      }
    } else {
      print("Permission refusée.");
    }
  }

  Future<void> showImagePickerDialog(bool isPhoto) async {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        return Wrap(
          children: [
            ListTile(
              leading: const Icon(Icons.camera_alt, color: Colors.green),
              title: const Text("Prendre une photo"),
              onTap: () {
                Navigator.of(context).pop();
                pickImage(ImageSource.camera, isPhoto);
              },
            ),
            ListTile(
              leading: const Icon(Icons.photo_library, color: Colors.green),
              title: const Text("Choisir depuis la galerie"),
              onTap: () {
                Navigator.of(context).pop();
                pickImageFromGallery(); // Appeler la fonction ici
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> saveArtisanInformation() async {
    if (!_formKey.currentState!.validate()) return;

    final prefs = await SharedPreferences.getInstance();
    final userId = prefs.getInt('user_id') ?? 0;

    if (userId == 0) {
      showSnackbar("Utilisateur non trouvé dans le stockage local.");
      return;
    }

    if (photo == null || idCardImage == null) {
      showSnackbar("Veuillez ajouter une photo et une carte d'identité.");
      return;
    }

    setState(() {
      isLoading = true;
    });

    final url = Uri.parse("http://10.0.2.2:8000/api/Artisan/");
    final request = http.MultipartRequest('POST', url);

    // Add fields
    request.fields['user'] = userId.toString();
    request.fields['NNI'] = nniController.text.trim();
    for (var service in selectedServices) {
      request.fields['services'] = service.toString();
    }

    // Add service areas as separate fields
    for (var area in selectedServiceAreas) {
      request.fields['service_areas'] = area.toString();
    }

    // Add files
    request.files.add(await http.MultipartFile.fromPath('photo', photo!.path));
    request.files.add(await http.MultipartFile.fromPath('id_card_image', idCardImage!.path));

    try {
      final response = await request.send();
      final responseBody = await response.stream.bytesToString();

      if (response.statusCode == 201) {
        showSnackbar("Informations enregistrées avec succès.");
        Navigator.pushReplacementNamed(context, '/login');
      } else {
        final errorMessage = json.decode(responseBody)['message'] ?? "Erreur inconnue.";
        showSnackbar("Erreur: $errorMessage");
      }
    } catch (e) {
      showSnackbar("Erreur réseau: $e");
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Informations Artisan",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                MultiSelectDialogField(
                  items: services
                      .map((service) => MultiSelectItem(service['id_s'], service['service_name']))
                      .toList(),
                  title: const Text("Services"),
                  buttonText: const Text("Sélectionner des services"),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.green, width: 2),
                  ),
                  onConfirm: (values) {
                    setState(() {
                      selectedServices = values.cast<int>();
                    });
                  },
                ),
                const SizedBox(height: 20),
                MultiSelectDialogField(
                  items: serviceAreas
                      .map((area) => MultiSelectItem(area['id_area'], area['area_name']))
                      .toList(),
                  title: const Text("Zones de Service"),
                  buttonText: const Text("Sélectionner des zones"),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.green, width: 2),
                  ),
                  onConfirm: (values) {
                    setState(() {
                      selectedServiceAreas = values.cast<int>();
                    });
                  },
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: nniController,
                  decoration: InputDecoration(
                    labelText: "NNI",
                    filled: true,
                    fillColor: Colors.grey[200],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.green, width: 2),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Le NNI est obligatoire";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () => showImagePickerDialog(true),
                  child: const Text("Ajouter une photo principale"),
                ),
                if (photo != null) ...[
                  const SizedBox(height: 10),
                  Image.file(photo!, height: 100, width: 100),
                ],
                const SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () => showImagePickerDialog(false),
                  child: const Text("Ajouter une photo de la carte d'identité"),
                ),
                if (idCardImage != null) ...[
                  const SizedBox(height: 10),
                  Image.file(idCardImage!, height: 100, width: 100),
                ],
                const SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: isLoading ? null : saveArtisanInformation,
                  child: isLoading
                      ? const CircularProgressIndicator(color: Colors.white)
                      : const Text("Enregistrer"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
