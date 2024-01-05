import 'package:cvcar_mobile/app/api/api.dart';
import 'package:cvcar_mobile/app/api/api_routes.dart';
import 'package:cvcar_mobile/app/models/vehicle.dart';
import 'package:cvcar_mobile/app/utils/handle_error.dart';
import 'package:get/get.dart';

class VehicleService extends GetxController {
  ApiClient apiClient;
  VehicleService({required this.apiClient});

  Future<Response> createVehicle(Map body) async {
    try {
      Response response = await apiClient.postData(
          "${ApiRoutes.PROD_BASE_URL}${ApiRoutes.REGISTER_VEHICLE}", body);
      print("response.body: ${response.body}");
      return response;
    } catch (e, s) {
      handleError(e, s);
      rethrow;
    }
  }

  Future<List<Vehicle>>? getVehicle(idDriving) async {
    try {
      Response response = await apiClient.getData(
          "${ApiRoutes.PROD_BASE_URL}${ApiRoutes.REGISTER_VEHICLE}?idDriving=$idDriving");
      print("response.body: ${response.body}");

      List<dynamic> vehicleAvailable = response.body ?? [];
      return vehicleAvailable
          .map((vehicle) => Vehicle.fromJson(vehicle))
          .toList();
    } catch (e, s) {
      handleError(e, s);
      rethrow;
    }
  }
}
