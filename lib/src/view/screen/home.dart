import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:simple_gallery/src/controller/hom_controller.dart';
import 'package:simple_gallery/src/view/screen/full_screen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  final controller = Get.put<HomeController>(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My gallery"),
      ),
      body: GetBuilder<HomeController>(
        builder: (controller) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: GridView.builder(
              itemCount: controller.imageList.length,
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 150,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10),
              itemBuilder: (BuildContext ctx, index) {
                final String curntPath = controller.imageList[index];
                return InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => FullScreen(path: curntPath),
                      ),
                    );
                  },
                  child: Hero(
                    tag: curntPath,
                    child: Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                            image: FileImage(
                              File(curntPath),
                            ),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(18)),
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.chosePick(ImageSource.camera);
        },
        child: const Icon(Icons.camera_alt),
      ),
    );
  }
}
