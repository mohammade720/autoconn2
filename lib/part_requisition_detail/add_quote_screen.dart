import 'package:autoconn2/partitem/part_item_model.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:flutter/material.dart';

class AddQuoteScreen extends StatefulWidget {
  final PartItem partItem;

  const AddQuoteScreen({super.key, required this.partItem});

  @override
  State<AddQuoteScreen> createState() => _AddQuoteScreenState();
}

class _AddQuoteScreenState extends State<AddQuoteScreen> {
  final FlutterSoundRecorder _audioRecorder = FlutterSoundRecorder();
  bool _isRecording = false;

  void initState() {
    super.initState();
    _initRecorder();
}

Future<void> _initRecorder() async {
    await _audioRecorder.openRecorder();
}

Future<void> _requestMicrophonePermission() async {
    var status = await Permission.microphone.status;
    if (status.isDenied) {
      await Permission.microphone.request();
    }
}

Future<void> _startRecording() async {
    await _requestMicrophonePermission();

    if (await Permission.microphone.isGranted) {
      await _audioRecorder.startRecorder(
        toFile: 'audio_record.aac', // file save recording
      );
      setState(() {
        _isRecording = true;
      });
    }
}

Future<void> _stopRecording() async {
    await _audioRecorder.stopRecorder();
    setState(() {
      _isRecording = false;
    });
}

void dispose() {
    _audioRecorder.closeRecorder();
    super.dispose();
}

  List<PlatformFile> selectedFiles = [];
  Future<void> _pickFiles() async {
    final result = await FilePicker.platform.pickFiles(
      allowMultiple: true,
      allowedExtensions: ['jpg', 'pdf', 'doc', 'mp4', 'mp3'],
      type: FileType.custom,
    );

    if (result != null) {
      setState(() {
        selectedFiles = result.files;
      });
      print("Files uploaded successfully: ${result.files.map((file) => file.name).join(', ')}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Add Quote',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 4),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.partItem.name,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                Text(
                  'Req. QTY',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${widget.partItem.partId}',
                  style: Theme.of(context).textTheme.labelSmall?.copyWith(
                        fontSize: 10,
                      ),
                ),
                Text(
                  '${widget.partItem.quantity} UNT',
                  style: Theme.of(context).textTheme.labelSmall?.copyWith(
                        fontSize: 10,
                      ),
                ),
              ],
            ),
          ],
        ),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            children: [
              const SizedBox(height: 24),
              buildDetailCard(context, widget.partItem,selectedFiles, _pickFiles),
              const SizedBox(height: 36),
              SizedBox(
                width: MediaQuery.of(context).size.width - 32,
                height: 36,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFEAB308),
                  ),
                  child: Text(
                    'Submit',
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          color: Colors.white,
                          fontSize: 14,
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

Widget buildDetailCard(BuildContext context, PartItem partItem,List<PlatformFile> selectedFiles, Future<void> Function() onPickFiles) {
  return Column(
    children: partItem.buyingChoice.map((choice) {
      return Card(
        elevation: 1,
        color: Colors.white,
        child: Column(
          children: [
            const SizedBox(height: 14),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Text(
                    choice,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const Spacer(),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'Remove',
                      style: Theme.of(context).textTheme.labelSmall?.copyWith(
                            fontSize: 8,
                            color: Theme.of(context).colorScheme.error,
                          ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  const SizedBox(height: 22),
                  Expanded(
                      child:
                          buildTextField('Rate', prefixIcon: Symbols.asterisk)),
                  const SizedBox(width: 16),
                  Expanded(
                      child: buildTextField('Quantity',
                          prefixIcon: Symbols.asterisk)),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Expanded(child: buildTextField('Warranty Number')),
                  const SizedBox(width: 16),
                  Expanded(child: buildTextField('Days')),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: buildTextField('Delivery Date',
                  prefixIcon: Symbols.calendar_month),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: buildTextField('Notes'),
            ),
            SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: buildMediaAttachments(context, selectedFiles, onPickFiles),
            ),
            const SizedBox(height: 16),
          ],
        ),
      );
    }).toList(),
  );
}

Widget buildMediaAttachments(BuildContext context, List<PlatformFile> selectedFiles,Future<void> Function() onAddFile) {
  return DottedBorder(
    color: const Color(0xFFA1A1A1),
    borderType: BorderType.RRect,
    dashPattern: const [6, 3],
    radius: const Radius.circular(4),
    strokeWidth: 1,
    child: Container(
      height: 142,
      color: const Color(0xFFF9F9F9),
      child: Column(
        children: [
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Text(
                  'Attachments',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: onAddFile,
                  child: const Icon(Symbols.description, size: 20),
                ),
                const SizedBox(width: 12),
                GestureDetector(
                  onTap: _isRecording ? _stopRecording : _startRecording,
                  child: const Icon(  _isRecording ? Icons.mic_off : Symbols.mic, size: 20, color: _isRecording ? Colors.red : Colors.black),
                ),
                const SizedBox(
                  height: 24,
                  child: VerticalDivider(
                    width: 12,
                    thickness: 1.5,
                    color: Color(0xFFA1A1A1),
                  ),
                ),
                const SizedBox(width: 12),
                GestureDetector(
                  onTap: () {},
                  child: const Icon(Symbols.video_library, size: 20),
                ),
                const SizedBox(width: 12),
                GestureDetector(
                  onTap: () {},
                  child: const Icon(Symbols.video_camera_back_add, size: 20),
                ),
                const SizedBox(
                  height: 24,
                  child: VerticalDivider(
                    width: 11,
                    thickness: 1.5,
                    color: Color(0xFFA1A1A1),
                  ),
                ),
                const SizedBox(width: 12),
                GestureDetector(
                  onTap: () {},
                  child: const Icon(Symbols.photo_library, size: 20),
                ),
                const SizedBox(width: 12),
                GestureDetector(
                  onTap: () {},
                  child: const Icon(Symbols.photo_camera, size: 20),
                ),
              ],
            ),
          ),
          const SizedBox(height: 28),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 65),
            child: Column(
              children: [
                Text(
                  'Photo, Videos, And Documents',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                const SizedBox(height: 2),
                Text(
                  'You Can Upload up to 10 files of the following types: Image, Video, Audio, PDF Excel, and Docx. Each file must be 5MB or less',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontSize: 10,
                      ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

Widget buildTextField(String label, {IconData? prefixIcon}) {
  return SizedBox(
    height: 36,
    child: TextFormField(
      decoration: InputDecoration(
        labelText: label,
        fillColor: const Color(0xFFF9F9F9),
        filled: true,
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xFF172157),
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xFF172157),
            width: 0.5,
          ),
        ),
        prefixIcon: prefixIcon != null
            ? Icon(
                prefixIcon,
                size: 20,
              )
            : null,
      ),
    ),
  );
}

