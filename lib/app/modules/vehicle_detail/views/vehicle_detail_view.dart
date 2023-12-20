import 'package:animate_do/animate_do.dart';
import 'package:cvcar_mobile/app/font/description.dart';
import 'package:cvcar_mobile/app/font/title.dart';
import 'package:cvcar_mobile/app/global/custom_button.dart';
import 'package:cvcar_mobile/app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../controllers/vehicle_detail_controller.dart';

class VehicleDetailView extends GetView<VehicleDetailController> {
  const VehicleDetailView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Color(CVCarColors.primaryColor),
            title: FadeInLeft(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                    ),
                  ),
                  Image.asset(
                    'assets/logo/isotipo_color.png',
                    width: 40.h,
                  ),
                ],
              ),
            )),
        body: ListView(
          padding: const EdgeInsets.all(25.0),
          children: [
            VehicleDetail(controller: controller),
            SizedBox(
              height: 20.h,
            ),
            SizedBox(
              height: 20.h,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                  color: Color(CVCarColors.secondaryColor),
                  width: 1.5,
                ),
                color: Color(CVCarColors.primaryColor),
              ),
              child: CustomButton(
                label: "Eliminar vehículo",
                color: Color(CVCarColors.backgroundColor),
                action: () {},
              ),
            ),
            SizedBox(
              height: 30.h,
            ),
          ],
        ));
  }
}

// class LicenseDetail extends StatelessWidget {
//   const LicenseDetail({
//     Key? key,
//     required this.controller,
//   }) : super(key: key);

//   final VehicleDetailController controller;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Column(
//         children: [
//           Row(
//             children: [
//               Image.asset(
//                 "assets/categories/impuestos.png",
//                 width: 30.h,
//               ),
//               SizedBox(
//                 width: 10.w,
//               ),
//               Label(label: "Detalles de la licencia", sizeFont: 16.h),
//             ],
//           ),
//           SizedBox(
//             height: 10.h,
//           ),
//           Container(
//             padding: EdgeInsets.all(10.h),
//             width: double.infinity,
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(10),
//               color: Color(CVCarColors.primaryColor),
//             ),
//             child: Column(children: [
//               TileInfo(
//                 label: "Placa",
//                 description: "entry.value",
//               ),
//             ]),
//           ),
//         ],
//       ),
//     );
//   }
// }

class TileInfo extends StatelessWidget {
  const TileInfo({
    Key? key,
    required this.label,
    this.description,
  }) : super(key: key);
  final String label;
  final String? description;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4.0.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Description(
            label: label,
            sizeFont: 11.h,
            color: Color(CVCarColors.greyLight),
            // color: Colors.white,
          ),
          Label(
            label: description != "" ? description ?? "" : "No registra",
            sizeFont: 11.h,
            // color: Colors.white,
          ),
        ],
      ),
    );
  }
}

class VehicleDetail extends StatelessWidget {
  const VehicleDetail({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final VehicleDetailController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              Image.asset(
                "assets/categories/detallesdevehiculo.png",
                width: 30.h,
              ),
              SizedBox(
                width: 10.w,
              ),
              Label(label: "Detalles del vehículo", sizeFont: 16.h),
            ],
          ),
          SizedBox(
            height: 10.h,
          ),
          Container(
            padding: EdgeInsets.all(10.h),
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Color(CVCarColors.primaryColor),
            ),
            child: Obx(
              () => Column(children: [
                TileInfo(
                  label: "Placa",
                  description: controller
                      .authController
                      .vehiclesData
                      .value?[controller.authController.vehicleSelected.value]
                      .plate,
                ),
                TileInfo(
                  label: "Clase",
                  description: controller
                      .authController
                      .vehiclesData
                      .value?[controller.authController.vehicleSelected.value]
                      .vehicleClass
                      ?.name,
                ),
                TileInfo(
                  label: "Tipo de servicio",
                  description: controller
                      .authController
                      .vehiclesData
                      .value?[controller.authController.vehicleSelected.value]
                      .typeService
                      ?.name,
                ),
                TileInfo(
                  label: "Marca",
                  description: controller
                      .authController
                      .vehiclesData
                      .value?[controller.authController.vehicleSelected.value]
                      .brand
                      ?.name,
                ),
                TileInfo(
                  label: "Linea",
                  description: controller
                      .authController
                      .vehiclesData
                      .value?[controller.authController.vehicleSelected.value]
                      .vehicleLine
                      ?.name,
                ),
                TileInfo(
                  label: "Color",
                  description: controller
                      .authController
                      .vehiclesData
                      .value?[controller.authController.vehicleSelected.value]
                      .color
                      ?.name,
                ),
                TileInfo(
                  label: "Modelo",
                  description: controller
                      .authController
                      .vehiclesData
                      .value?[controller.authController.vehicleSelected.value]
                      .modelYear
                      .toString(),
                ),
                TileInfo(
                  label: "Cilindraje",
                  description: controller
                      .authController
                      .vehiclesData
                      .value?[controller.authController.vehicleSelected.value]
                      .cylinderCapacity
                      .toString(),
                ),
                TileInfo(
                  label: "Pasajeros",
                  description: controller
                      .authController
                      .vehiclesData
                      .value?[controller.authController.vehicleSelected.value]
                      .vehicleLine
                      ?.passengerCapacitySeated
                      .toString(),
                ),
                TileInfo(
                  label: "Carga",
                  description: controller
                      .authController
                      .vehiclesData
                      .value?[controller.authController.vehicleSelected.value]
                      .vehicleLine
                      ?.loadCapacity
                      .toString(),
                ),
                TileInfo(
                  label: "No. Motor",
                  description: controller
                      .authController
                      .vehiclesData
                      .value?[controller.authController.vehicleSelected.value]
                      .nroRecordingEngine,
                ),
                TileInfo(
                  label: "No. Chasis",
                  description: controller
                      .authController
                      .vehiclesData
                      .value?[controller.authController.vehicleSelected.value]
                      .chassisNumber,
                ),
                TileInfo(
                  label: "Fecha de matricula",
                  description: controller
                      .authController
                      .vehiclesData
                      .value?[controller.authController.vehicleSelected.value]
                      .dateInitialEnrollment
                      .toString()
                      .substring(0, 10),
                ),
                TileInfo(
                  label: "S. de transito",
                  description: controller
                      .authController
                      .vehiclesData
                      .value?[controller.authController.vehicleSelected.value]
                      .authorityTransit
                      ?.name
                      .substring(
                          0,
                          (controller
                                          .authController
                                          .vehiclesData
                                          .value?[controller.authController
                                              .vehicleSelected.value]
                                          .authorityTransit
                                          ?.name
                                          .length ??
                                      0) >
                                  23
                              ? 23
                              : (controller
                                      .authController
                                      .vehiclesData
                                      .value?[controller
                                          .authController.vehicleSelected.value]
                                      .authorityTransit
                                      ?.name
                                      .length ??
                                  0)),
                ),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
