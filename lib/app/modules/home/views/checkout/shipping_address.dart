import 'dart:async';


import 'package:aimart_dev/app/modules/home/widgets/buttons/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


import '../../../../data/constants/constants.dart';
import '../../controllers/page_controller.dart';
import '../../widgets/textfields/custom_textFormField.dart';

class ShippingAddress extends StatefulWidget {
  ShippingAddress({Key? key}) : super(key: key);

  @override
  State<ShippingAddress> createState() => _ShippingAddressState();
}

class _ShippingAddressState extends State<ShippingAddress> {
  final _fullName = TextEditingController();
  final _phone = TextEditingController();
  final _city = TextEditingController();
  final _region = TextEditingController();
  final _postalCode = TextEditingController();
  final _country = TextEditingController();
  PagesController pc = Get.find<PagesController>();
  String address = 'search';

  @override
  void initState() {
    markers.addAll(_list);
    super.initState();
    loadinitialLocation();
  }

  loadinitialLocation() {
     _getUserCurrentLocation().then((value) async {
                        markers.add(
                            Marker(
                                markerId: const MarkerId('2'),
                                position: LatLng(value.latitude ,value.longitude),
                                infoWindow: const  InfoWindow(
                                    title: 'Current Location'
                                )
                            )
                        );
                        final GoogleMapController controller = await _controller.future;

                        CameraPosition _kGooglePlex =  CameraPosition(
                          target: LatLng(value.latitude ,value.longitude),
                          zoom: 14,
                        );
                        controller.animateCamera(CameraUpdate.newCameraPosition(_kGooglePlex));
                        List<Placemark> placemarks = await placemarkFromCoordinates(value.latitude, value.longitude);
                         Placemark place = placemarks[0];
                         address = '${place.street}, ${place.subLocality}, ${place.locality}, ${place.postalCode}, ${place.country}';
                        print(address);
                        setState(() {

                        });
                      });
  }

  Future<Position> _getUserCurrentLocation() async {
    await Geolocator.requestPermission()
        .then((value) {})
        .onError((error, stackTrace) {
      print(error.toString());
    });

    return await Geolocator.getCurrentPosition();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(padding: EdgeInsets.symmetric(horizontal: 28.w), children: [
      SizedBox(height: 32.h),
      Text("Shipping Address",
          style: CustomTextStyles.kBold20
              .copyWith(color: CustomColors.kDarkBblue)),
      SizedBox(height: 24.h),
      Text('Full Name',
          style: CustomTextStyles.kBold14
              .copyWith(color: CustomColors.kDarkBblue)),
      SizedBox(height: 10.h),
      CustomTextFormField(
          controller: _fullName,
          isPasswordField: false,
          hintText: 'Full Name',
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.name,
          validator: (val) {}),
      SizedBox(height: 20.h),
      Text('Phone Number',
          style: CustomTextStyles.kBold14
              .copyWith(color: CustomColors.kDarkBblue)),
      SizedBox(height: 10.h),
      CustomTextFormField(
          controller: _phone,
          isPasswordField: false,
          hintText: '0123456789',
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.number,
          validator: (val) {}),
      SizedBox(height: 20.h),
      Text('City',
          style: CustomTextStyles.kBold14
              .copyWith(color: CustomColors.kDarkBblue)),
      SizedBox(height: 10.h),
      CustomTextFormField(
          controller: _city,
          isPasswordField: false,
          hintText: 'City Name',
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.name,
          validator: (val) {}),
      SizedBox(height: 20.h),
      Text('Region',
          style: CustomTextStyles.kBold14
              .copyWith(color: CustomColors.kDarkBblue)),
      SizedBox(height: 10.h),
      CustomTextFormField(
          controller: _region,
          isPasswordField: false,
          hintText: 'Region Name',
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.name,
          validator: (val) {}),
      SizedBox(height: 20.h),
      Text('Postal Code',
          style: CustomTextStyles.kBold14
              .copyWith(color: CustomColors.kDarkBblue)),
      SizedBox(height: 10.h),
      CustomTextFormField(
          controller: _postalCode,
          isPasswordField: false,
          hintText: 'Enter your postal code',
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.number,
          validator: (val) {}),
      SizedBox(height: 20.h),
      Text('Country',
          style: CustomTextStyles.kBold14
              .copyWith(color: CustomColors.kDarkBblue)),
      SizedBox(height: 10.h),
      CustomTextFormField(
          controller: _country,
          isPasswordField: false,
          hintText: 'Enter your country',
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.name,
          validator: (val) {}),
      SizedBox(height: 20.h),
      Text('Location Details',
          style: CustomTextStyles.kBold14
              .copyWith(color: CustomColors.kDarkBblue)),
      SizedBox(height: 10.h),
      Container(
          height: 153.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: GoogleMap(
            initialCameraPosition: position,
            mapType: MapType.normal,
            myLocationEnabled: true,
            myLocationButtonEnabled: false,
            zoomControlsEnabled: true,
            zoomGesturesEnabled: true,
            markers: Set.of(markers),
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            },
          )),
      SizedBox(height: 30.h),
      PrimaryButton(
          onPressed: () {
            0.3
                .seconds
                .delay()
                .then((value) async => await pc.animateInitialPageToNext());
          },
          child: Text(
            "Confirm and Continue",
            style: CustomTextStyles.kBold16,
          ))
    ]);
  }

  CameraPosition position =
      const CameraPosition(target: LatLng(30.181459, 71.492157), zoom: 10.15);

  Completer<GoogleMapController> _controller = Completer();
  List<Marker> markers = [];
  final List<Marker> _list = const [
    Marker(
      markerId: MarkerId('1'),
      position: LatLng(30.181459, 71.492157),
      infoWindow: InfoWindow(title: 'My Position'),
    )
  ];
}
