import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/Car_model.dart';
import '../repositories/car_repositories.dart';

class CarListNotifier extends StateNotifier<List<CarModel>> {
  CarListNotifier(this._repository) : super(_repository.getDummyCars());

  final CarRepository _repository;

  void addCar(CarModel car) {
    _repository.addCar(car);
    state = List.from(state)..add(car); // Update the state
  }

  void editCar(CarModel updatedCar) {
    _repository.editCar(updatedCar);
    state = state.map((car) => car.id == updatedCar.id ? updatedCar : car).toList(); // Update the state
  }

  void deleteCar(String id) {
    _repository.deleteCar(id);
    state = state.where((car) => car.id != id).toList(); // Update the state
  }

}


final carRepositoryProvider = Provider<CarRepository>((ref) {
  return CarRepository();
});

final carListNotifierProvider =
StateNotifierProvider<CarListNotifier, List<CarModel>>((ref) {
  final repository = ref.read(carRepositoryProvider);
  return CarListNotifier(repository);
});
