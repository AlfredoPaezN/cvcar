import 'package:animate_do/animate_do.dart';
import 'package:cvcar_mobile/app/font/description.dart';
import 'package:cvcar_mobile/app/font/title.dart';
import 'package:cvcar_mobile/app/global/custom_divider.dart';
import 'package:cvcar_mobile/app/global/custom_indicator.dart';
import 'package:cvcar_mobile/app/global/expandable_item.dart';
import 'package:cvcar_mobile/app/modules/reservations/views/reservations_view.dart';
import 'package:cvcar_mobile/app/modules/vehicle_detail/views/vehicle_detail_view.dart';
import 'package:cvcar_mobile/app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../controllers/vehicle_cv_controller.dart';

class VehicleCvView extends GetView<VehicleCvController> {
  const VehicleCvView({Key? key}) : super(key: key);
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
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: ListView(
          children: [
            Row(
              children: [
                Image.asset(
                  "assets/categories/CVdelvehiculodetalles.png",
                  width: 30.h,
                ),
                SizedBox(
                  width: 10.w,
                ),
                Label(label: "CV del vehículo", sizeFont: 16.h),
              ],
            ),
            SizedBox(
              height: 15.h,
            ),
            Row(
              children: [
                Obx(
                  () => SizedBox(
                      height: 20.h,
                      width: 20.h,
                      child: Checkbox(
                          activeColor: Color(CVCarColors.primaryColor),
                          value: controller.isExpanded.value,
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                          onChanged: (value) {
                            controller.isExpanded.value = value!;
                            controller.cardIndexOpennedList.clear();
                          })),
                ),
                SizedBox(
                  width: 10.w,
                ),
                Description(
                  label: "Desplegar todas las pestañas",
                  sizeFont: 13.h,
                  color: Colors.white,
                ),
              ],
            ),
            SizedBox(
              height: 15.h,
            ),
            Obx(
              () => controller.authController.vehiclesData.value != null
                  ? ExpandableItem(
                      edit: true,
                      title: "SOAT",
                      indicator: CustomIndicator(
                        status:
                            controller.dashboardController.getSoatStatusText(),
                        statusString: controller.setStringStatus(
                            controller.dashboardController.getSoatStatusText()),
                      ),
                      isExpanded: controller.isExpanded.value ||
                          controller.cardIndexOpennedList.contains(0),
                      expandedContent: Column(children: [
                        Padding(
                            padding: EdgeInsets.symmetric(vertical: 4.0.h),
                            child: Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: const Color(CVCarColors.blueInfo),
                              ),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.info_rounded,
                                    color: Colors.white,
                                    size: 20.h,
                                  ),
                                  SizedBox(
                                    width: 10.w,
                                  ),
                                  Description(
                                    color: Colors.white,
                                    label:
                                        "Faltan ${controller.calculateMonthsDifference(DateTime.now(), controller.authController.vehiclesData.value![controller.authController.vehicleSelected.value].soats![0].endDate!)} meses para revisión.",
                                    sizeFont: 11.h,
                                  )
                                ],
                              ),
                            )),
                        TileInfo(
                          label: "Número de póliza",
                          description: controller
                              .authController
                              .vehiclesData
                              .value?[controller
                                  .authController.vehicleSelected.value]
                              .soats?[0]
                              .numberPolicy,
                        ),
                        TileInfo(
                            label: "Fecha de expedición",
                            description: controller
                                        .authController
                                        .vehiclesData
                                        .value?[controller.authController
                                            .vehicleSelected.value]
                                        .soats?[0]
                                        .dateExpedit !=
                                    null
                                ? controller.dateFormat.format(controller
                                    .authController
                                    .vehiclesData
                                    .value![controller
                                        .authController.vehicleSelected.value]
                                    .soats![0]
                                    .dateExpedit!)
                                : ""),
                        TileInfo(
                          label: "Fecha de renovación",
                          description: controller
                                      .authController
                                      .vehiclesData
                                      .value?[controller
                                          .authController.vehicleSelected.value]
                                      .soats?[0]
                                      .updatedAt !=
                                  null
                              ? controller.dateFormat.format(controller
                                  .authController
                                  .vehiclesData
                                  .value![controller
                                      .authController.vehicleSelected.value]
                                  .soats![0]
                                  .endDate!)
                              : "",
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 4.0.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Description(
                                label: "Estado",
                                sizeFont: 12.h,
                                color: Color(CVCarColors.greyLight),
                                // color: Colors.white,
                              ),
                              CustomIndicator(
                                  status: controller.dashboardController
                                      .getSoatStatusText(),
                                  statusString: controller.setStringStatus(
                                      controller.dashboardController
                                          .getSoatStatusText()))
                            ],
                          ),
                        )
                      ]),
                      onTap: () {
                        controller.handleExpand(0);
                      },
                    )
                  : SizedBox(),
            ),
            SizedBox(
              height: 15.h,
            ),
            Obx(
              () => controller.authController.vehiclesData.value != null
                  ? ExpandableItem(
                      edit: true,
                      title: "Tecnomecánica",
                      indicator: CustomIndicator(
                        status:
                            controller.dashboardController.getTecnoStatusText(),
                        statusString: controller.setStringStatus(controller
                            .dashboardController
                            .getTecnoStatusText()),
                      ),
                      isExpanded: controller.isExpanded.value ||
                          controller.cardIndexOpennedList.contains(1),
                      expandedContent: Column(children: [
                        Padding(
                            padding: EdgeInsets.symmetric(vertical: 4.0.h),
                            child: Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: const Color(CVCarColors.blueInfo),
                              ),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.info_rounded,
                                    color: Colors.white,
                                    size: 20.h,
                                  ),
                                  SizedBox(
                                    width: 10.w,
                                  ),
                                  Description(
                                    color: Colors.white,
                                    label:
                                        "Faltan ${controller.calculateMonthsDifference(DateTime.now(), controller.authController.vehiclesData.value![controller.authController.vehicleSelected.value].tecnomechanics![0]!.dateExpiry!)} meses para revisión.",
                                    sizeFont: 11.h,
                                  )
                                ],
                              ),
                            )),
                        TileInfo(
                          label: "Centro de diagnostico",
                          description: controller
                              .authController
                              .vehiclesData
                              .value?[controller
                                  .authController.vehicleSelected.value]
                              .tecnomechanics?[0]
                              ?.agency
                              ?.name
                              ?.substring(0, 10),
                        ),
                        TileInfo(
                          label: "Número de certificado",
                          description: controller
                              .authController
                              .vehiclesData
                              .value?[controller
                                  .authController.vehicleSelected.value]
                              .tecnomechanics?[0]
                              ?.certificateNumber,
                        ),
                        TileInfo(
                          label: "Fecha de expedición",
                          description: controller
                                      .authController
                                      .vehiclesData
                                      .value?[controller
                                          .authController.vehicleSelected.value]
                                      .tecnomechanics?[0] !=
                                  null
                              ? controller.dateFormat.format(controller
                                  .authController
                                  .vehiclesData
                                  .value![controller
                                      .authController.vehicleSelected.value]
                                  .tecnomechanics![0]!
                                  .dateExpedit!)
                              : "",
                        ),
                        TileInfo(
                          label: "Fecha de renovación",
                          description: controller
                                      .authController
                                      .vehiclesData
                                      .value?[controller
                                          .authController.vehicleSelected.value]
                                      .tecnomechanics?[0] !=
                                  null
                              ? controller.dateFormat.format(controller
                                  .authController
                                  .vehiclesData
                                  .value![controller
                                      .authController.vehicleSelected.value]
                                  .tecnomechanics![0]!
                                  .dateExpiry!)
                              : "",
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 4.0.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Description(
                                label: "Estado",
                                sizeFont: 12.h,
                                color: Color(CVCarColors.greyLight),
                                // color: Colors.white,
                              ),
                              CustomIndicator(
                                  status: controller.dashboardController
                                      .getTecnoStatusText(),
                                  statusString: controller.setStringStatus(
                                      controller.dashboardController
                                          .getTecnoStatusText()))
                            ],
                          ),
                        )
                      ]),
                      onTap: () {
                        controller.handleExpand(1);
                      },
                    )
                  : SizedBox(),
            ),
            SizedBox(
              height: 15.h,
            ),
            Obx(
              () => controller.authController.vehiclesData.value != null
                  ? ExpandableItem(
                      title: "Kilometraje",
                      isExpanded: controller.isExpanded.value ||
                          controller.cardIndexOpennedList.contains(2),
                      expandedContent: Column(children: [
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 4.0.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Description(
                                label: "Kilometraje",
                                sizeFont: 12.h,
                                color: Color(CVCarColors.greyLight),
                                // color: Colors.white,
                              ),
                              Description(
                                label: "Fechas de resgitro",
                                sizeFont: 12.h,
                                color: Color(CVCarColors.greyLight),
                                // color: Colors.white,
                              ),
                            ],
                          ),
                        ),
                        TileInfoMono(
                          label: "9283 km",
                          description: "12/04/2023",
                        ),
                        TileInfoMono(
                          label: "9124 km",
                          description: "06/04/2023",
                        ),
                        TileInfoMono(
                          label: "9081 km",
                          description: "12/04/2022",
                        ),
                      ]),
                      onTap: () {
                        controller.handleExpand(2);
                      },
                    )
                  : SizedBox(),
            ),
            SizedBox(
              height: 15.h,
            ),
            Obx(
              () => controller.authController.vehiclesData.value != null
                  ? ExpandableItem(
                      edit: true,
                      title: "Costo",
                      isExpanded: controller.isExpanded.value ||
                          controller.cardIndexOpennedList.contains(3),
                      expandedContent: Column(children: [
                        TileInfo(
                          label: "Costos diarios",
                          description: "20.000",
                        ),
                        TileInfo(
                          label: "Costos mensuales",
                          description: "600.000",
                        ),
                        TileInfo(
                          label: "Costos anuales",
                          description: "1.200.000",
                        ),
                      ]),
                      onTap: () {
                        controller.handleExpand(3);
                      },
                    )
                  : SizedBox(),
            ),
            SizedBox(
              height: 15.h,
            ),
            Obx(
              () => controller.authController.vehiclesData.value != null
                  ? ExpandableItem(
                      title: "Conbustible",
                      isExpanded: controller.isExpanded.value ||
                          controller.cardIndexOpennedList.contains(4),
                      expandedContent: Column(children: [
                        TileInfo(
                          label: "Establecimiento",
                          description: "Primax",
                        ),
                        TileInfo(
                          label: "Tipo de combustible",
                          description: "Corriente",
                        ),
                        TileInfo(
                          label: "Último registro",
                          description: "12/04/2023",
                        ),
                        TileInfo(
                          label: "Cantidad",
                          description: "9gl",
                        ),
                        TileInfo(
                          label: "Precio",
                          description: "134.600 COP",
                        ),
                        TileInfo(
                          label: "Precio por gl",
                          description: "10.500 COP",
                        ),
                      ]),
                      onTap: () {
                        controller.handleExpand(4);
                      },
                    )
                  : SizedBox(),
            ),
            SizedBox(
              height: 15.h,
            ),
            Obx(
              () => ExpandableItem(
                title: "Lavados",
                isExpanded: controller.isExpanded.value ||
                    controller.cardIndexOpennedList.contains(5),
                expandedContent: Column(children: [
                  TileInfo(
                    label: "Establecimiento",
                    description: "Carsh wash",
                  ),
                  TileInfo(
                    label: "Tipo de servicio",
                    description: "Lavado",
                  ),
                  TileInfo(
                    label: "Último registro",
                    description: "12/04/2023",
                  ),
                  TileInfo(
                    label: "Precio",
                    description: "134.600 COP",
                  ),
                ]),
                onTap: () {
                  controller.handleExpand(5);
                },
              ),
            ),
            SizedBox(
              height: 15.h,
            ),
            Obx(
              () => controller.authController.vehiclesData.value != null
                  ? ExpandableItem(
                      title: "Bateria",
                      edit: true,
                      isExpanded: controller.isExpanded.value ||
                          controller.cardIndexOpennedList.contains(6),
                      expandedContent: Column(children: [
                        TileInfo(
                          label: "Establecimiento",
                          description: "Baterias SAS",
                        ),
                        TileInfo(
                          label: "Marca",
                          description: "Bosh",
                        ),
                        TileInfo(
                          label: "Tipo de bateria",
                          description: "Celda húmedas",
                        ),
                        TileInfo(
                          label: "Meses de garantía",
                          description: "6 meses",
                        ),
                        TileInfo(
                          label: "Fecha de compra",
                          description: "25/10/2023",
                        ),
                        TileInfo(
                          label: "Último",
                          description: "983km",
                        ),
                        TileInfo(
                          label: "vencimiento garantia",
                          description: "25/04/2024",
                        ),
                        TileInfo(
                          label: "Precio",
                          description: "1.000.000",
                        ),
                        TileInfo(
                          label: "Libre de mantenimiento",
                          description: "Si",
                        ),
                      ]),
                      onTap: () {
                        controller.handleExpand(6);
                      },
                    )
                  : SizedBox(),
            ),
            SizedBox(
              height: 15.h,
            ),
            Obx(
              () => controller.authController.vehiclesData.value != null
                  ? ExpandableItem(
                      title: "Cambio de aceite",
                      edit: true,
                      isExpanded: controller.isExpanded.value ||
                          controller.cardIndexOpennedList.contains(7),
                      expandedContent: Column(children: [
                        TileInfo(
                          label: "Establecimiento",
                          description: "Aceite SAS",
                        ),
                        TileInfo(
                          label: "Marca",
                          description: "Mobil",
                        ),
                        TileInfo(
                          label: "Tipo",
                          description: "15W-40",
                        ),
                        TileInfo(
                          label: "Cantidad",
                          description: "4.5 LT",
                        ),
                        TileInfo(
                          label: "Fecha de cambio",
                          description: "07/10/2023",
                        ),
                        TileInfo(
                          label: "Fecha de proximo",
                          description: "xxxxxx",
                        ),
                        TileInfo(
                          label: "Km actual",
                          description: "98765km",
                        ),
                        TileInfo(
                          label: "Km para cambio",
                          description: "134765km",
                        ),
                        TileInfo(
                          label: "Costo",
                          description: "134.678 COP",
                        ),
                        CustomDivider(),
                        TileInfo(
                          label: "Cambio filtro de aceite",
                          description: "Si",
                        ),
                        TileInfo(
                          label: "Cambio filtro de aire de motor",
                          description: "Si",
                        ),
                        TileInfo(
                          label: "Cambio filtro de cabina",
                          description: "Si",
                        ),
                        TileInfo(
                          label: "Cambio filtro de combustible",
                          description: "Si",
                        ),
                      ]),
                      onTap: () {
                        controller.handleExpand(7);
                      },
                    )
                  : SizedBox(),
            ),
            SizedBox(
              height: 15.h,
            ),
            Obx(
              () => controller.authController.vehiclesData.value != null
                  ? ExpandableItem(
                      title: "Mantenimiento general",
                      isExpanded: controller.isExpanded.value ||
                          controller.cardIndexOpennedList.contains(8),
                      expandedContent: Column(children: [
                        TileInfo(
                          label: "Establecimiento",
                          description: "Mantenimientos SAS",
                        ),
                        TileInfo(
                          label: "Tipo",
                          description: "Correctivo",
                        ),
                        TileInfo(
                          label: "Fecha",
                          description: "12/04/2023",
                        ),
                        TileInfo(
                          label: "Precio",
                          description: "134.600 COP",
                        ),
                        TileInfo(
                          label: "Garantia",
                          description: "6 meses",
                        ),
                        CustomDivider(),
                        TileInfo(
                          label: "Descripción",
                          description: " ",
                        ),
                        Description(
                          label:
                              "Se arreglaron rayones de la puerta trasera y cambio de las dos llantas delanteras",
                          color: Colors.white,
                        )
                      ]),
                      onTap: () {
                        controller.handleExpand(8);
                      },
                    )
                  : SizedBox(),
            ),
            SizedBox(
              height: 15.h,
            ),
          ],
        ),
      ),
    );
  }
}

class ExpandedCard extends StatelessWidget {
  const ExpandedCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(3),
        color: const Color(CVCarColors.primaryColor),
      ),
      child: Column(children: [
        Container(
          padding: EdgeInsets.all(14),
          height: 40.h,
          child: Row(
            children: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Label(
                      label: "50% en lavado básico de carro",
                      fontcolor: Colors.white,
                      sizeFont: 12.sp,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Container(
          height: 1.h,
          width: double.infinity,
          color: Color(CVCarColors.grey).withOpacity(0.3),
        ),
        const Padding(
          padding: const EdgeInsets.all(14.0),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DataFormat(
                        imagePath: "assets/informative/usuario.png",
                        label: "Auto spa detailing"),
                    DataFormat(
                        imagePath: "assets/informative/location-sharp.png",
                        label: "Cra 56 # 47 9"),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DataFormat(
                        imagePath: "assets/informative/calendar-fill.png",
                        label: "30/10/23"),
                    DataFormat(
                        imagePath: "assets/informative/clock-fill.png",
                        label: "8:00 AM -10:00 AM"),
                  ],
                ),
              ),
            ],
          ),
        ),
        Container(
            height: 25.h,
            width: double.infinity,
            color: Color(CVCarColors.grey).withOpacity(0.3),
            child: Center(
              child: Description(
                label: "Cancelar reserva",
                color: Colors.white,
                sizeFont: 9.sp,
              ),
            ))
      ]),
    );
  }
}

class ShrinkCard extends StatelessWidget {
  const ShrinkCard({
    Key? key,
    required this.title,
    required this.edit,
    this.indicator,
  }) : super(key: key);

  final String title;
  final bool edit;
  final Widget? indicator;

  @override
  Widget build(BuildContext context) {
    return FadeInUp(
      child: Padding(
        padding: EdgeInsets.only(bottom: 15.h),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Color(CVCarColors.primaryColor),
          ),
          padding: EdgeInsets.all(14),
          height: 40.h,
          child: Row(
            children: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Label(
                      label: title,
                      fontcolor: Colors.white,
                      sizeFont: 15.sp,
                    ),
                    Expanded(child: SizedBox()),
                    indicator ??
                        Container(
                          width: 20.h,
                          height: 20.h,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            // borderRadius: BorderRadius.circular(4),
                            color: Color(CVCarColors.greyLight),
                          ),
                          child: Center(
                            child: edit
                                ? const Icon(
                                    Icons.edit,
                                    size: 15,
                                    color: Colors.white,
                                  )
                                : const Icon(
                                    Icons.add,
                                    size: 20,
                                    color: Colors.white,
                                  ),
                          ),
                        ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TileInfoMono extends StatelessWidget {
  const TileInfoMono({
    Key? key,
    required this.label,
    this.description,
    this.isBold = false,
  }) : super(key: key);
  final String label;
  final String? description;
  final bool isBold;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4.0.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Label(
            label: label,
            sizeFont: 12.h,
            fontcolor: Colors.white,
            // color: Colors.white,
          ),
          Label(
            label: description ?? "",
            sizeFont: 12.h,
            fontcolor: Colors.white,
            // color: Colors.white,
          ),
        ],
      ),
    );
  }
}
