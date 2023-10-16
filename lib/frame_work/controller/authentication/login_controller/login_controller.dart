import 'package:emploiflutter/ui/utils/theme/theme.dart';
import 'package:country_picker/country_picker.dart';


final loginController = ChangeNotifierProvider((ref) => LoginController());

class LoginController  extends ChangeNotifier{

  final phoneFieldController = TextEditingController();

  /// ----------------------------Country Picker--------------------------------///
  Country selectedCountry = Country(phoneCode: "91", countryCode: "IN", e164Sc: 0, geographic: true, level: 1, name: "India", example: "9123456789", displayName: "India (IN) [+91]", displayNameNoCountryCode: "India (IN)", e164Key: "91-IN-0");
  selectCountry(BuildContext context){
    showCountryPicker(
      context: context,
      countryListTheme: CountryListThemeData(
          textStyle: TextStyle(fontSize: 14.sp),
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10), topRight: Radius.circular(10)),
          inputDecoration: const InputDecoration(
              hintText: "Start typing to sear", labelText: "Search")),
      favorite: ['IN'],
      onSelect: (value) {
          selectedCountry = value;
          notifyListeners();
      });
    notifyListeners();
  }
/// ----------------------------Country Picker--------------------------------///

}