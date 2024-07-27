import '../models/Car_model.dart';

class CarRepository {
  List<CarModel> _dummyCars = [
    CarModel(
      id: '1',
      name: 'Car A',
      image: 'https://hips.hearstapps.com/hmg-prod/images/bmw-vision-neue-klasse-concept28-64e39f53b0cc3.jpg?crop=0.541xw:0.495xh;0.276xw,0.389xh&resize=980:*',
      rating: 4.5,
      price: 25000,
      location: 'New York',
    ),
    CarModel(
      id: '2',
      name: 'Car B',
      image: 'https://hips.hearstapps.com/hmg-prod/images/bmw-vision-neue-klasse-concept28-64e39f53b0cc3.jpg?crop=0.541xw:0.495xh;0.276xw,0.389xh&resize=980:*',
      rating: 4.0,
      price: 20000,
      location: 'Los Angeles',
    ),
    CarModel(
      id: '3',
      name: 'Car C',
      image: 'https://hips.hearstapps.com/hmg-prod/images/bmw-vision-neue-klasse-concept28-64e39f53b0cc3.jpg?crop=0.541xw:0.495xh;0.276xw,0.389xh&resize=980:*',
      rating: 4.8,
      price: 30000,
      location: 'Chicago',
    ),
  ];

  List<CarModel> getDummyCars() {
    return _dummyCars;
  }

  void addCar(CarModel car) {
    _dummyCars.add(car);
  }

  void editCar(CarModel updatedCar) {
    final index = _dummyCars.indexWhere((car) => car.id == updatedCar.id);
    if (index != -1) {
      _dummyCars[index] = updatedCar;
    }
  }
  void deleteCar(String id) {
    _dummyCars.removeWhere((car) => car.id == id);
  }

}
