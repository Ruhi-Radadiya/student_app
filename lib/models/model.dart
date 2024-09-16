import 'dart:io';

class StudentModel {
  final File image;
  final String name;
  final int std;
  final int grid;

  StudentModel({
    required this.image,
    required this.name,
    required this.std,
    required this.grid,
  });

  // factory QuotesModel.fromMap({required Map data}) {
  //   return QuotesModel(
  //     name: data['name'],
  //     std: data['std'],
  //     grid: data['grid'],
  //   );
  // }
}
