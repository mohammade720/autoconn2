import 'dart:io';
import 'package:autoconn2/partitem/part_item_model.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:open_file/open_file.dart';
import 'package:flutter/material.dart';

class AddQuoteScreen extends StatefulWidget {
  final PartItem partItem;

  const AddQuoteScreen({super.key, required this.partItem});

  @override
  State<AddQuoteScreen> createState() => _AddQuoteScreenState();
}

class _AddQuoteScreenState extends State<AddQuoteScreen> {
  List<PlatformFile> selectedFiles = [];

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
              buildDetailCard(context, widget.partItem, selectedFiles),
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

  Widget buildDetailCard(BuildContext context, PartItem partItem,
      List<PlatformFile> selectedFiles) {
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
                        child: buildTextField('Rate',
                            prefixIcon: Symbols.asterisk)),
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
              const SizedBox(height: 24),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: buildMediaAttachments(context, selectedFiles),
              ),
              const SizedBox(height: 16),
            ],
          ),
        );
      }).toList(),
    );
  }

  // Widget buildMediaAttachments(
  //     BuildContext context, List<PlatformFile> selectedFiles) {
  //   return DottedBorder(
  //     color: const Color(0xFFA1A1A1),
  //     borderType: BorderType.RRect,
  //     dashPattern: const [6, 3],
  //     radius: const Radius.circular(4),
  //     strokeWidth: 1,
  //     child: Container(
  //       height: 142, //selectedFiles.length * 64,
  //       child: Column(
  //         children: [
  //           const SizedBox(height: 16),
  //           Padding(
  //             padding: const EdgeInsets.symmetric(horizontal: 16),
  //             child: Row(
  //               children: [
  //                 Text(
  //                   'Attachments',
  //                   style: Theme.of(context).textTheme.bodySmall?.copyWith(
  //                         fontSize: 12,
  //                         fontWeight: FontWeight.bold,
  //                       ),
  //                 ),
  //                 const Spacer(),
  //                 GestureDetector(
  //                   onTap: () => pickFiles(context),
  //                   child: const Icon(Symbols.description, size: 20),
  //                 ),
  //                 const SizedBox(width: 12),
  //                 GestureDetector(
  //                   onTap: () {},
  //                   child: const Icon(Symbols.mic, size: 20),
  //                 ),
  //                 const SizedBox(
  //                   height: 24,
  //                   child: VerticalDivider(
  //                     width: 12,
  //                     thickness: 1.5,
  //                     color: Color(0xFFA1A1A1),
  //                   ),
  //                 ),
  //                 const SizedBox(width: 12),
  //                 GestureDetector(
  //                   onTap: () {},
  //                   child: const Icon(Symbols.video_library, size: 20),
  //                 ),
  //                 const SizedBox(width: 12),
  //                 GestureDetector(
  //                   onTap: () {},
  //                   child: const Icon(Symbols.video_camera_back_add, size: 20),
  //                 ),
  //                 const SizedBox(
  //                   height: 24,
  //                   child: VerticalDivider(
  //                     width: 11,
  //                     thickness: 1.5,
  //                     color: Color(0xFFA1A1A1),
  //                   ),
  //                 ),
  //                 const SizedBox(width: 12),
  //                 GestureDetector(
  //                   onTap: () {},
  //                   child: const Icon(Symbols.photo_library, size: 20),
  //                 ),
  //                 const SizedBox(width: 12),
  //                 GestureDetector(
  //                   onTap: () {},
  //                   child: const Icon(Symbols.photo_camera, size: 20),
  //                 ),
  //               ],
  //             ),
  //           ),
  //           const SizedBox(height: 28),
  //           selectedFiles.isEmpty
  //               ? Padding(
  //                   padding: const EdgeInsets.symmetric(horizontal: 65),
  //                   child: Column(
  //                     children: [
  //                       Text(
  //                         'Photo, Videos, And Documents',
  //                         style: Theme.of(context).textTheme.titleSmall,
  //                       ),
  //                       const SizedBox(height: 2),
  //                       Text(
  //                         'You Can Upload up to 10 files of the following types: Image, Video, Audio, PDF Excel, and Docx. Each file must be 5MB or less',
  //                         style:
  //                             Theme.of(context).textTheme.bodyLarge?.copyWith(
  //                                   fontSize: 10,
  //                                 ),
  //                         textAlign: TextAlign.center,
  //                       ),
  //                     ],
  //                   ),
  //                 )
  //               : Expanded(
  //                   child: GridView.builder(
  //                     itemCount: selectedFiles.length,
  //                     //physics: NeverScrollableScrollPhysics(),
  //                     gridDelegate:
  //                         const SliverGridDelegateWithFixedCrossAxisCount(
  //                       crossAxisCount: 3, // Number of columns in the grid
  //                       crossAxisSpacing: 8,
  //                       mainAxisSpacing: 8,
  //                       childAspectRatio: 1, // Aspect ratio for square items
  //                     ),
  //                     itemBuilder: (context, index) {
  //                       final file = selectedFiles[index];
  //                       return GestureDetector(
  //                         onTap: () => viewFile(file),
  //                         child: Container(
  //                           decoration: BoxDecoration(
  //                             border: Border.all(color: Colors.grey),
  //                           ),
  //                           child: Stack(
  //                             children: [
  //                               if (file.path != null)
  //                                 Image.file(
  //                                   File(file.path!),
  //                                   fit: BoxFit.cover,
  //                                   width: double.infinity,
  //                                   height: double.infinity,
  //                                 )
  //                               else
  //                                 const Icon(
  //                                   Icons.insert_drive_file,
  //                                   size: 50,
  //                                 ),
  //                               Positioned(
  //                                 top: 4,
  //                                 right: 4,
  //                                 child: GestureDetector(
  //                                   onTap: () => removeFile(index),
  //                                   child: Container(
  //                                     decoration: BoxDecoration(
  //                                       color: Colors.grey.withOpacity(0.7),
  //                                       shape: BoxShape.circle,
  //                                     ),
  //                                     child: const Icon(
  //                                       Icons.close,
  //                                       color: Colors.white,
  //                                       size: 20,
  //                                     ),
  //                                   ),
  //                                 ),
  //                               ),
  //                             ],
  //                           ),
  //                         ),
  //                       );
  //                     },
  //                   ),
  //                 )
  //         ],
  //       ),
  //     ),
  //   );
  // }

  Widget buildMediaAttachments(
      BuildContext context, List<PlatformFile> selectedFiles) {
    return DottedBorder(
      color: const Color(0xFFA1A1A1),
      borderType: BorderType.RRect,
      dashPattern: const [6, 3],
      radius: const Radius.circular(4),
      strokeWidth: 1,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // Align the children to start
          children: [
            Row(
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
                  onTap: () => pickFiles(context),
                  child: const Icon(Icons.description, size: 20),
                ),
                const SizedBox(width: 12),
                GestureDetector(
                  onTap: () {},
                  child: const Icon(Icons.mic, size: 20),
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
                  child: const Icon(Icons.video_library, size: 20),
                ),
                const SizedBox(width: 12),
                GestureDetector(
                  onTap: () {},
                  child: const Icon(Icons.video_camera_back, size: 20),
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
                  child: const Icon(Icons.photo_library, size: 20),
                ),
                const SizedBox(width: 12),
                GestureDetector(
                  onTap: () {},
                  child: const Icon(Icons.photo_camera, size: 20),
                ),
              ],
            ),
            const SizedBox(height: 16),
            // Always visible text, even when files are selected
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  Text(
                    'Photo, Videos, And Documents',
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'You can upload up to 10 files of the following types: Image, Video, Audio, PDF, Excel, and Docx. Each file must be 5MB or less.',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontSize: 10,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            if (selectedFiles.isNotEmpty)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Text(
                  'Selected Files',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            const SizedBox(height: 16),
            // Show selected files in a grid if any
            if (selectedFiles.isNotEmpty)
              SizedBox(
                height: 200, // Set the height based on your design needs
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  itemCount: selectedFiles.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                    childAspectRatio: 1,
                  ),
                  itemBuilder: (context, index) {
                    final file = selectedFiles[index];
                    return GestureDetector(
                      onTap: () => viewFile(file),
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                        ),
                        child: Stack(
                          children: [
                            if (file.path != null)
                              Image.file(
                                File(file.path!),
                                fit: BoxFit.cover,
                                width: double.infinity,
                                height: double.infinity,
                              )
                            else
                              const Icon(
                                Icons.insert_drive_file,
                                size: 50,
                              ),
                            Positioned(
                              top: 4,
                              right: 4,
                              child: GestureDetector(
                                onTap: () => removeFile(index),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.red.withOpacity(0.7),
                                    shape: BoxShape.circle,
                                  ),
                                  child: const Icon(
                                    Icons.close,
                                    color: Colors.white,
                                    size: 18,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }

  void removeFile(int index) {
    setState(() {
      selectedFiles.removeAt(index);
    });
  }

  void pickFiles(BuildContext context) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['jpg', 'png', 'mp4', 'mp3', 'pdf'],
        allowMultiple: true);
    if (result != null) {
      setState(() {
        selectedFiles.addAll(result.files);
      });
    }
  }

  void viewFile(PlatformFile file) {
    OpenFile.open(file.path);
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
}
