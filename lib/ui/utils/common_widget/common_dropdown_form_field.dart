import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:emploiflutter/ui/utils/theme/theme.dart';

import '../theme/app_color.dart';
import '../theme/text_styles.dart';

class CommonDropDownFormField extends StatelessWidget {
  final List<String> items;
  final String? selectedValue;
  final String hintTextForDropdown;
  final String hintTextForField;
  final TextEditingController searchController;
  final void Function(String?)? onChanged;
   const CommonDropDownFormField({
    super.key, required this.items, required this.searchController,required this.selectedValue,required this.onChanged, required this.hintTextForDropdown, required this.hintTextForField
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2<String>(
        isExpanded: true,
        hint: Text(
          hintTextForDropdown,
          style: TextStyles.w500
              .copyWith(fontSize: 14.sp, color: AppColors.colors.greyRegent),
        ),
        items: items
            .map((item) => DropdownMenuItem(
                value: item,
                child: Text(
                  item,
                  style: const TextStyle(
                    fontSize: 14,
                  ),
                )))
            .toList(),
        value: selectedValue,
        onChanged: onChanged,
        buttonStyleData: ButtonStyleData(
          elevation: 0,
          overlayColor: MaterialStateColor.resolveWith(
              (states) => AppColors.colors.whiteColors),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.r),
              border:
                  Border.all(color: AppColors.colors.blueColors, width: 1.5.w)),
          padding: EdgeInsets.symmetric(
            horizontal: 10.w,
            vertical: 10.h
          ),
          height: 50.h,
          width: double.infinity,
        ),
        dropdownStyleData: DropdownStyleData(
          maxHeight: double.infinity.h,
        ),
        menuItemStyleData: MenuItemStyleData(
          height: 40.h,
        ),
        dropdownSearchData: DropdownSearchData(
          searchController: searchController,
          searchInnerWidgetHeight: 18.h,
          searchInnerWidget: Container(
            padding: EdgeInsets.symmetric(vertical: 12.h,horizontal: 10.w),
            child: TextFormField(
              controller: searchController,
              decoration: InputDecoration(
                  hintText: hintTextForField,
                  prefixIcon: const Icon(Icons.search),
                  hintStyle: TextStyles.w400.copyWith(
                      fontSize: 14.sp, color: AppColors.colors.blueColors)),
            ),
          ),
          searchMatchFn: (item, searchValue) {
            return item.value
                .toString()
                .toLowerCase()
                .contains(searchValue.toLowerCase());
          },
        ),
        /// This to clear the search value when you close the menu ///
        onMenuStateChange: (isOpen) {
          if (!isOpen) {
            searchController.clear();
          }
        },
      ),
    );
  }
}
