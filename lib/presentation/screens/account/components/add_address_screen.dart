import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geocoding/geocoding.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:place_picker_google/place_picker_google.dart';
import 'package:tracking_app/components/utils/constants.dart';

class AddAddressScreen extends StatefulWidget {
  const AddAddressScreen({super.key});

  @override
  State<AddAddressScreen> createState() => _AddAddressScreenState();
}

class _AddAddressScreenState extends State<AddAddressScreen> {
  final TextEditingController _streetController = TextEditingController();
  final TextEditingController _buildingController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _postalCodeController = TextEditingController();

  // Form key for validation
  final _formKey = GlobalKey<FormState>();

  // Map variables
  LatLng? _selectedLocation;

  @override
  void dispose() {
    _streetController.dispose();
    _buildingController.dispose();
    _cityController.dispose();
    _postalCodeController.dispose();
    super.dispose();
  }

  // // Show the place picker
  // void _showPlacePicker() async {
  //   try {
  //     LocationResult? result = await PlacePicker.showWithResult(
  //       context,
  //       _googleMapsApiKey,
  //       initialLocation: _selectedLocation,
  //       displayMapControls: true,
  //     );

  //     // Handle result
  //     setState(() {
  //       _selectedLocation = LatLng(
  //         result.latLng!.latitude,
  //         result.latLng!.longitude,
  //       );
  //     });

  //     // Update form fields based on location
  //     _updateFormFieldsFromLocation(result);
  //   } catch (e) {
  //     ScaffoldMessenger.of(
  //       context,
  //     ).showSnackBar(SnackBar(content: Text('Error selecting location: $e')));
  //   }
  // }

  // // Update form fields with address details from location
  // void _updateFormFieldsFromLocation(LocationResult result) {
  //   // Extract address components from result
  //   if (result.formattedAddress != null) {
  //     // First, set the full street address
  //     _streetController.text = result.formattedAddress!;

  //     // Try to extract city
  //     if (result.city != null && result.city!.isNotEmpty) {
  //       _cityController.text = result.city!;
  //     }

  //     // Try to extract postal code
  //     if (result.zipCode != null && result.zipCode!.isNotEmpty) {
  //       _postalCodeController.text = result.zipCode!;
  //     }

  //     // Building/house number might need to be extracted from the address components
  //     if (result.streetNumber != null) {
  //       for (var component in result.streetNumber!) {
  //         if (component.types.contains('street_number')) {
  //           _buildingController.text = component.longName;
  //           break;
  //         }
  //       }
  //     }
  //   }
  // }

  // // Update map location based on form fields
  // Future<void> _updateLocationFromFormFields() async {
  //   // Create address string from form fields
  //   String addressQuery = [
  //     _streetController.text,
  //     _buildingController.text,
  //     _cityController.text,
  //     _postalCodeController.text,
  //   ].where((element) => element.isNotEmpty).join(', ');

  //   if (addressQuery.isNotEmpty) {
  //     try {
  //       List<Location> locations = await locationFromAddress(addressQuery);
  //       if (locations.isNotEmpty) {
  //         setState(() {
  //           _selectedLocation = LatLng(
  //             locations.first.latitude,
  //             locations.first.longitude,
  //           );
  //         });
  //       }
  //     } catch (e) {
  //       // Silently fail or show a subtle indication that geocoding failed
  //       print('Could not geocode address: $e');
  //     }
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            context.go('/account');
          },
          child: Icon(Icons.arrow_back),
        ),
        title: Text(
          'Add New Address',
          style: TextStyle(fontSize: xl, fontWeight: FontWeight.w800),
        ),
      ),
      // body: PlacePicker(
      //   apiKey: 'GOOGLE_MAPS_API_KEY_ANDROID',
      //   onPlacePicked: (LocationResult result) {
      //     debugPrint("Place picked: ${result.formattedAddress}");
      //   },
      //   initialLocation: const LatLng(29.378586, 47.990341),
      //   searchInputConfig: const SearchInputConfig(
      //     padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      //     autofocus: false,
      //     textDirection: TextDirection.ltr,
      //   ),
      //   searchInputDecorationConfig: const SearchInputDecorationConfig(
      //     hintText: "Search for a building, street or ...",
      //   ),
      // ),
    );
  }
}
