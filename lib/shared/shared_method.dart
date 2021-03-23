part of 'shared.dart';

Future<File> getImage() async {
   final pickedFile =
        await ImagePicker().getImage(source: ImageSource.gallery);
    return File(pickedFile.path);
}

Future<String> uploadImage(File image) async {
  String nameFile = basename(image.path);

  Reference ref = FirebaseStorage.instance.ref().child(nameFile);
  UploadTask task = ref.putFile(image);
  TaskSnapshot snapshot = await task;
  
  return await snapshot.ref.getDownloadURL();
}

Widget generateDashedDivider(double width) {
    int n = width ~/ 5;
    return Row(
      children: List.generate(
          n,
          (index) => (index % 2 == 0)
              ? Container(
                  height: 2,
                  width: width / n,
                  color: Color(0xFFE4E4E4),
                )
              : SizedBox(
                  width: width / n,
                )),
    );
  }