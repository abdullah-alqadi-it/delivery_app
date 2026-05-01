// import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import '../../../core/shared/primary_button.dart';
//
// class EditAccountPage extends StatefulWidget {
//   const EditAccountPage({super.key});
//
//   @override
//   State<EditAccountPage> createState() => _EditAccountPageState();
// }
//
// class _EditAccountPageState extends State<EditAccountPage> {
//   // ── Controllers ──────────────────────────────
//   final _nameController = TextEditingController(text: 'عبدالله عبدالاله');
//   final _phoneController = TextEditingController(text: '775939490');
//   final _addressController = TextEditingController(text: 'جوار مستشفى الصداقة');
//   final _optionalController = TextEditingController();
//
//   // ── Map state ────────────────────────────────
//   GoogleMapController? _mapController;
//   LatLng _pickedLocation = LatLng(14.5416, 44.3844);
//
//   final Set<Marker> _markers = {};
//
//   @override
//   void initState() {
//     super.initState();
//     _setMarker(_pickedLocation);
//   }
//
//   @override
//   void dispose() {
//     _nameController.dispose();
//     _phoneController.dispose();
//     _addressController.dispose();
//     _optionalController.dispose();
//     _mapController?.dispose();
//     super.dispose();
//   }
//
//   // ── Helpers ──────────────────────────────────
//   void _setMarker(LatLng position) {
//     setState(() {
//       _pickedLocation = position;
//       _markers
//         ..clear()
//         ..add(
//           Marker(
//             markerId: const MarkerId('delivery'),
//             position: position,
//             draggable: true,
//             onDragEnd: _setMarker,
//             infoWindow: const InfoWindow(title: 'موقع التوصيل'),
//           ),
//         );
//     });
//   }
//
//   void _onMapTap(LatLng position) => _setMarker(position);
//
//   void _onSave() {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         content: Text(
//           'تم الحفظ | الموقع: '
//           '${_pickedLocation.latitude.toStringAsFixed(4)}, '
//           '${_pickedLocation.longitude.toStringAsFixed(4)}',
//         ),
//         backgroundColor: Color(0xFFE8993A),
//       ),
//     );
//   }
//
//   // ── Build ─────────────────────────────────────
//   @override
//   Widget build(BuildContext context) {
//     return Directionality(
//       textDirection: TextDirection.rtl,
//       child: Scaffold(
//         backgroundColor: Colors.black,
//         appBar: AppBar(
//           title: Text(
//             'تعديل الحساب',
//             style: const TextStyle(
//               fontSize: 20,
//               fontWeight: FontWeight.bold,
//               color: Colors.white,
//             ),
//           ),
//           centerTitle: true,
//         ),
//         body: Stack(
//           children: [
//             SingleChildScrollView(
//               padding: const EdgeInsets.fromLTRB(16, 16, 16, 100),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   // ── Form Fields ──────────────
//                   _InputField(
//                     controller: _nameController,
//                     icon: Icons.person,
//                     hint: 'الاسم الكامل',
//                   ),
//                   const SizedBox(height: 12),
//                   _InputField(
//                     controller: _phoneController,
//                     icon: Icons.phone,
//                     hint: 'رقم الهاتف',
//                     keyboardType: TextInputType.phone,
//                   ),
//                   const SizedBox(height: 12),
//                   _InputField(
//                     controller: _addressController,
//                     icon: Icons.location_on,
//                     hint: 'العنوان',
//                   ),
//                   const SizedBox(height: 12),
//                   _InputField(
//                     controller: _optionalController,
//                     icon: Icons.phone_forwarded,
//                     hint: 'رقم التواصل (اختياري)',
//                     keyboardType: TextInputType.phone,
//                   ),
//                   const SizedBox(height: 20),
//
//                   // ── Map Section ──────────────
//                   Container(
//                     decoration: BoxDecoration(
//                       color: Color(0xFF757575),
//                       borderRadius: BorderRadius.circular(16),
//                       border: Border.all(color: Colors.white10),
//                     ),
//                     padding: const EdgeInsets.all(16),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.stretch,
//                       children: [
//                         const Text(
//                           'تحديد الموقع على الخريطة',
//                           textAlign: TextAlign.right,
//                           style: TextStyle(
//                             fontSize: 16,
//                             fontWeight: FontWeight.bold,
//                             color: Colors.white,
//                           ),
//                         ),
//                         const SizedBox(height: 6),
//                         const Text(
//                           'اضغط على الخريطة لتحديد موقع التوصيل الدقيق، '
//                           'أو اسحب الدبوس لتعديل الموقع.',
//                           textAlign: TextAlign.right,
//                           style: TextStyle(
//                             fontSize: 13,
//                             color: Colors.white,
//                             height: 1.5,
//                           ),
//                         ),
//                         const SizedBox(height: 14),
//
//                         // ── Google Map ───────────
//                         ClipRRect(
//                           borderRadius: BorderRadius.circular(12),
//                           child: SizedBox(
//                             height: 240,
//                             child: GoogleMap(
//                               initialCameraPosition: CameraPosition(
//                                 target: _pickedLocation,
//                                 zoom: 15,
//                               ),
//                               markers: _markers,
//                               onTap: _onMapTap,
//                               onMapCreated: (c) => _mapController = c,
//                               mapType: MapType.normal,
//                               myLocationButtonEnabled: true,
//                               myLocationEnabled: true,
//                               zoomControlsEnabled: false,
//                             ),
//                           ),
//                         ),
//
//                         const SizedBox(height: 10),
//
//                         // Coordinates hint
//                         Text(
//                           'خط العرض: ${_pickedLocation.latitude.toStringAsFixed(5)}  |  '
//                           'خط الطول: ${_pickedLocation.longitude.toStringAsFixed(5)}',
//                           textAlign: TextAlign.center,
//                           style: const TextStyle(
//                             fontSize: 11,
//                             color: Colors.white,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//
//             // ── Save Button ──────────────────
//             Positioned(
//               left: 16,
//               right: 16,
//               bottom: 16,
//               child: PrimaryButton(label: 'حفظ', onTap: _onSave),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// // ─────────────────────────────────────────────
// // Reusable input field
// // ─────────────────────────────────────────────
// class _InputField extends StatelessWidget {
//   final TextEditingController controller;
//   final IconData icon;
//   final String hint;
//   final TextInputType keyboardType;
//
//   const _InputField({
//     required this.controller,
//     required this.icon,
//     required this.hint,
//     this.keyboardType = TextInputType.text,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         color: Color(0xFF757575),
//         borderRadius: BorderRadius.circular(12),
//         border: Border.all(color: Colors.white10),
//       ),
//       child: TextField(
//         controller: controller,
//         keyboardType: keyboardType,
//         textAlign: TextAlign.right,
//         style: const TextStyle(color: Colors.white, fontSize: 15),
//         decoration: InputDecoration(
//           hintText: hint,
//           hintStyle: const TextStyle(color: Colors.white),
//           prefixIcon: Icon(icon, color: Color(0xFF757575), size: 22),
//           border: InputBorder.none,
//           contentPadding: const EdgeInsets.symmetric(
//             horizontal: 16,
//             vertical: 16,
//           ),
//         ),
//       ),
//     );
//   }
// }
