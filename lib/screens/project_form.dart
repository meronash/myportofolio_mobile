
import 'package:material_ui/material_ui.dart';
import 'package:myportofolio_mobile/widgets/left_drawer.dart';
import 'package:myportofolio_mobile/models/project.dart';
import 'package:myportofolio_mobile/services/api_client.dart';
import 'package:myportofolio_mobile/services/auth_state.dart';
import 'package:myportofolio_mobile/widgets/auth_guard.dart';
import 'package:provider/provider.dart';

class ProjectFormPage extends StatefulWidget {
  const ProjectFormPage({super.key});

  @override
  State<ProjectFormPage> createState() => _ProjectFormPageState();
}

class _ProjectFormPageState extends State<ProjectFormPage> {
  final _formKey = GlobalKey<FormState>();

  String _projectName = "";
  String _description = "";
  String _technologies = "";
  String _projectLink = "";
  String _projectImageUrl = "";

  bool _isSubmitting = false;

  String? _validateUrl(String? value, {bool required = false}) {
    final link = value?.trim() ?? "";

    if (link.isEmpty) {
      return required ? "URL tidak boleh kosong!" : null;
    }

    final uri = Uri.tryParse(link);

    if (uri == null ||
        !uri.hasScheme ||
        !['http', 'https'].contains(uri.scheme) ||
        uri.host.isEmpty) {
      return "Masukkan URL valid (http:// atau https://)!";
    }

    return null;
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() {
      _isSubmitting = true;
    });

    try {
      // Pastikan pengguna sudah login.
      final allowed = await ensureLoggedIn(context);

      if (!mounted || !allowed) return;

      // Ambil token autentikasi.
      final token = context.read<AuthState>().token;

      if (token == null) {
        throw Exception("Token autentikasi tidak ditemukan.");
      }

      // Buat objek Project dari data form.
      final newProject = Project(
        title: _projectName.trim(),
        description: _description.trim(),
        techStack: _technologies.trim(),
        projectUrl: _projectLink.trim(),
        projectImageUrl: _projectImageUrl.trim(),
      );

      // Kirim data proyek ke Django API.
      await context.read<ApiClient>().createProject(
        newProject,
        token: token,
      );

      if (!mounted) return;

      // Tampilkan pesan jika proyek berhasil dibuat.
      await showDialog(
        context: context,
        builder: (dialogContext) {
          return AlertDialog(
            title: const Text("Berhasil!"),
            content: const Text(
              "Proyek berhasil ditambahkan.",
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(dialogContext);
                },
                child: const Text("OK"),
              ),
            ],
          );
        },
      );

      if (!mounted) return;

      // Kembali ke halaman sebelumnya.
      Navigator.pop(context);
    } on ApiException catch (e) {
      if (!mounted) return;

      if (e.statusCode == 401) {
        await context.read<AuthState>().logout();

        if (!mounted) return;
      }

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            "Gagal menambahkan proyek. Status: ${e.statusCode}",
          ),
        ),
      );
    } catch (e) {
      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Terjadi kesalahan: $e"),
        ),
      );
    } finally {
      if (mounted) {
        setState(() {
          _isSubmitting = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('Add Project Form'),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
      ),
      drawer: const LeftDrawer(),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // === Project Name ===
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Nama Proyek",
                    labelText: "Nama Proyek",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (value) {
                    _projectName = value;
                  },
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return "Nama proyek tidak boleh kosong!";
                    }
                    return null;
                  },
                ),
              ),

              // === Description ===
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  maxLines: 5,
                  decoration: InputDecoration(
                    hintText: "Deskripsi Proyek",
                    labelText: "Deskripsi Proyek",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (value) {
                    _description = value;
                  },
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return "Deskripsi proyek tidak boleh kosong!";
                    }
                    return null;
                  },
                ),
              ),

              // === Technologies ===
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Contoh: Flutter, Django, Figma",
                    labelText: "Teknologi yang Digunakan",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (value) {
                    _technologies = value;
                  },
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return "Teknologi tidak boleh kosong!";
                    }
                    return null;
                  },
                ),
              ),

              // === Project Link ===
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "https://example.com",
                    labelText: "Tautan Proyek",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (value) {
                    _projectLink = value;
                  },
                  validator: (value) {
                    return _validateUrl(value);
                  },
                ),
              ),

              // === Project Image URL ===
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "https://example.com/image.png",
                    labelText: "URL Gambar Proyek (Opsional)",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (value) {
                    _projectImageUrl = value;
                  },
                  validator: (value) {
                    return _validateUrl(value);
                  },
                ),
              ),

              // === Save Button ===
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          WidgetStateProperty.all(Colors.indigo),
                    ),
                    onPressed: _isSubmitting ? null : _submit,
                    child: _isSubmitting
                        ? const CircularProgressIndicator(
                            color: Colors.white,
                          )
                        : const Text(
                            "Save",
                            style: TextStyle(color: Colors.white),
                          ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}