import 'package:emploiflutter/frame_work/controller/authentication_controller/login_controller/login_controller.dart';
import 'package:emploiflutter/frame_work/controller/authentication_controller/register_controller/register_controller.dart';
import 'package:emploiflutter/ui/authentication/register/register_otp.dart';
import 'package:emploiflutter/ui/utils/common_widget/common_button.dart';
import 'package:emploiflutter/ui/utils/common_widget/common_form_field.dart';
import 'package:emploiflutter/ui/utils/form_validation.dart';
import 'package:emploiflutter/ui/utils/theme/app_color.dart';
import 'package:flutter/services.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import '../../../utils/theme/text_styles.dart';
import '../../../utils/theme/theme.dart';

class RegisterCard extends ConsumerWidget {
  const RegisterCard({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final loginWatch = ref.watch(loginController);
    final registerWatch = ref.watch(registerController);
    return Form(
      key: registerWatch.registerKey,
      child: Card(
        margin: EdgeInsets.only(top: 100.h),
        elevation: 4,
        child: Container(
          width: MediaQuery.of(context).size.width *0.93,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.r),
            color: Colors.white,
          ),
          child: Padding(
            padding: EdgeInsets.only(top: 35.h,bottom: 20.h,left: 20.w,right: 20.w),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                   Row(
                    children: [
                       Expanded(child: CommonFormField(
                         autoValidateMode: AutovalidateMode.onUserInteraction,
                        validator: (val)=>nameValidator(val),
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.name,
                        controller: registerWatch.firstNameController,
                        prefixIcon: Icon(Icons.person,size: 18.sp,color: AppColors.colors.blueColors,),
                        hintText: "First name",labelText: "First name",
                         labelStyle: TextStyles.w400.copyWith(color: Colors.black,fontSize: 12.sp),
                       )),
                      SizedBox(width: 10.w,),
                      Expanded(child: CommonFormField(
                        autoValidateMode: AutovalidateMode.onUserInteraction,
                        validator: (val)=>nameValidator(val),
                        textInputAction: TextInputAction.newline,
                        keyboardType: TextInputType.name,
                        controller: registerWatch.lastNameController,
                        prefixIcon: Icon(Icons.person,size: 18.sp,color: AppColors.colors.blueColors,),
                        hintText: "Last name",labelText: "Last name",
                        labelStyle: TextStyles.w400.copyWith(color: Colors.black,fontSize: 12.sp),
                      ),

                      ),
                    ],
                  ),
                   Padding(
                    padding: EdgeInsets.symmetric(vertical: 22.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: (){
                            loginWatch.selectCountry(context);
                          },
                          child: Row(
                            children: [
                              Text(loginWatch.selectedCountry.countryCode,style: TextStyles.w400.copyWith(fontSize: 14.sp,color: Colors.black),),
                              SizedBox(width: 5.w,),
                              Text("+${loginWatch.selectedCountry.phoneCode}",style: TextStyles.w400.copyWith(fontSize: 14.sp,color: Colors.black),),
                              const Icon(Icons.arrow_drop_down_outlined,color: Colors.black,),
                              SizedBox(width: 5.w,),
                            ],
                          ),
                        ),
                        Expanded(child: CommonFormField(
                          maxLength: 10,
                          autoValidateMode: AutovalidateMode.onUserInteraction,
                          validator: (val)=>phoneValidator(val),
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(10),
                          ],
                          textInputAction: TextInputAction.newline,
                          keyboardType: TextInputType.phone,
                          controller: registerWatch.phoneNumberController,
                          prefixIcon: Icon(Icons.phone,size: 18.sp,color: AppColors.colors.blueColors,),
                          hintText: "9876....",labelText: "Phone Number",
                          labelStyle: TextStyles.w400.copyWith(color: Colors.black,fontSize: 12.sp),
                        )),
                      ],
                    ),
                  ),
                  CommonFormField(
                    textInputAction: TextInputAction.newline,
                    controller: registerWatch.emailController,
                    autoValidateMode: AutovalidateMode.onUserInteraction,
                    keyboardType: TextInputType.emailAddress,
                    validator: (val)=>emailValidator(val),
                    prefixIcon: Icon(Icons.email,size: 18.sp,color: AppColors.colors.blueColors,),
                    hintText: "Email",labelText: "Email",
                    labelStyle: TextStyles.w400.copyWith(color: Colors.black,fontSize: 12.sp),
                  ),
                  SizedBox(height: 10.h,),
                  TypeAheadField(
                    direction: AxisDirection.up,
                    textFieldConfiguration: TextFieldConfiguration(
                      controller: registerWatch.cityController,
                      decoration:InputDecoration(
                          errorStyle: TextStyles.w400.copyWith(fontSize: 10.sp,color: Colors.red.shade400),
                          hintText: "City",
                          prefixIcon: Icon(Icons.location_city_outlined,size: 18.sp,color: AppColors.colors.blueColors,),
                          labelText: "City",
                          labelStyle:  TextStyles.w400.copyWith(color: Colors.black,fontSize: 14.sp),
                          hintStyle: TextStyles.w400.copyWith(color: Colors.grey,fontSize: 14.sp),
                          contentPadding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 0),
                          disabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.r),
                              borderSide:  BorderSide(color: AppColors.colors.blueColors,width: 1.w)),
                          errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.r),
                              borderSide:  BorderSide(color: AppColors.colors.blueColors,width: 1.5.w)),
                          focusedErrorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.r),
                              borderSide:  BorderSide(color: AppColors.colors.blueColors,width: 1.5.w)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.r),
                              borderSide:  BorderSide(color: AppColors.colors.blueColors,width: 1.5.w)),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.r),
                              borderSide:  BorderSide(color: AppColors.colors.blueColors,width: 1.w)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.r),
                              borderSide:  BorderSide(color: AppColors.colors.blueColors,width: 1.w)))
                    ),
                    errorBuilder: (context, error) => Container(
                      height: 50.h,
                      alignment: Alignment.centerLeft,
                      child: ListTile(
                        title: Text(error.toString(),style: TextStyles.w400.copyWith(fontSize: 12.sp,color: AppColors.colors.blackColors),),
                      ),
                    ),
                    onSuggestionSelected: (suggestion) {
                        registerWatch.cityController.text= suggestion;
                  } , itemBuilder: (context, itemData){
                      return Container(
                        height: 50.h,
                        alignment: Alignment.centerLeft,
                        child: ListTile(
                        title: Text(itemData,style: TextStyles.w400.copyWith(fontSize: 12.sp,color: AppColors.colors.blackColors),),
                    ),
                      );
                  } , suggestionsCallback: (pattern) {
                   return registerWatch.checkCity(pattern);
                  } ,),
                  SizedBox(height: 10.h,),
                  Row(
                    children: [
                    Checkbox(value: registerWatch.isCheck, onChanged: (val){
                      registerWatch.updateIsCheck(val!);
                    }),
                      SizedBox(width: 5.w,),
                      Expanded(child: Text("I have read and agreed to the terms & conditions",style: TextStyles.w400.copyWith(fontSize: 14.sp,color: Colors.black),))
                    ],
                  ),
                  CommonButton(btnText: "Register",onPressed: (){
                    if(registerWatch.registerKey.currentState!.validate()){
                    Navigator.push(context, MaterialPageRoute(builder: (_)=>const RegisterOTP()));
                    }
                  },fontSize: 20.sp,txtPadding: EdgeInsets.symmetric(horizontal: 40.w,vertical: 6.h)),
                  SizedBox(height: 15.h,),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
