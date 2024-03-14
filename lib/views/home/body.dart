import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:transviti_assessment_test/controller/home/get_repository.dart';
import 'package:transviti_assessment_test/model/institutes_model.dart';
import 'package:transviti_assessment_test/utils/const/color.dart';
import 'package:transviti_assessment_test/utils/extentions/extention.dart';
import 'package:transviti_assessment_test/utils/widget/custom_text.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  @override
  Widget build(BuildContext context) {
    var repository = Provider.of<GetApiRepository>(context, listen: false);
    return Column(
      children: [
        Container(
          height: 140.h,
          child: Stack(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  height: 110.h,
                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                    Icon(Icons.menu, color: AppColors.white),
                    CustomText(
                      text: 'Institutes',
                      color: AppColors.white,
                      fontSize: 24.0.sp,
                    ),
                    Icon(Icons.align_horizontal_center_rounded, color: AppColors.white)
                  ]),
                  decoration: BoxDecoration(
                    color: AppColors.blue,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(34.0.r),
                      bottomRight: Radius.circular(34.0.r),
                    ),
                  ),
                ),
              ),
              Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 22.0),
                    child: TextField(
                      cursorColor: AppColors.lightGreen,
                      style: const TextStyle(color: AppColors.textColor2),
                      controller: repository.searchController,
                      onChanged: (String? value) {
                        setState(() {});
                      },
                      obscureText: false,
                      autofocus: false,
                      decoration: InputDecoration(
                        fillColor: AppColors.white,
                        filled: true,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(44.0),
                          borderSide: const BorderSide(color: AppColors.dividerColor),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(44.0),
                          borderSide: const BorderSide(color: AppColors.lightGreen),
                        ),
                        prefixIcon: Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Icon(Icons.search, color: AppColors.red),
                        ),
                        suffixIconConstraints: const BoxConstraints(minWidth: 20, maxHeight: 20),
                        hintText: 'Search School',
                        hintStyle: TextStyle(color: AppColors.textColor2, fontWeight: FontWeight.w400, fontSize: 16.0),
                      ),
                    ),
                  )),
            ],
          ),
        ),
        20.0.spaceY,
        Expanded(
          child: FutureBuilder<List<InstitutesModel>>(
              future: repository.institutesFetchApi(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      final String userId = snapshot.data![index].id.toString();
                      if (repository.searchController.text.isEmpty) {
                        return Container(
                          padding: EdgeInsets.all(8.0),
                          margin: EdgeInsets.only(left: 16.0.w, right: 16.0.w, bottom: 18.0.h),
                          height: 120.h,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(24.0.r),
                            color: AppColors.white,
                          ),
                          child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 12.0),
                              child: CircleAvatar(
                                radius: 24.0.r,
                                backgroundImage: Image.network(snapshot.data![index].url.toString()).image,
                              ),
                            ),
                            20.0.spaceX,
                            Expanded(
                                child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                CustomText(
                                  text: snapshot.data![index].title.toString(),
                                  fontSize: 16.0.sp,
                                  color: AppColors.blue,
                                  maxLine: 1,
                                ),
                                Row(
                                  children: [
                                    Icon(Icons.location_on_sharp, color: AppColors.blue),
                                    10.0.spaceX,
                                    CustomText(
                                      text: snapshot.data![index].id.toString(),
                                      fontSize: 16.0.sp,
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Icon(Icons.school_rounded, color: AppColors.blue),
                                    10.0.spaceX,
                                    CustomText(
                                      text: snapshot.data![index].albumId.toString(),
                                      fontSize: 16.0.sp,
                                    ),
                                  ],
                                ),
                              ],
                            ))
                          ]),
                        );
                      } else if (userId.toLowerCase().contains(repository.searchController.text.toLowerCase())) {
                        return Container(
                          padding: EdgeInsets.all(8.0),
                          margin: EdgeInsets.only(left: 16.0.w, right: 16.0.w, bottom: 18.0.h),
                          height: 120.h,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(24.0.r),
                            color: AppColors.white,
                          ),
                          child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 12.0),
                              child: CircleAvatar(
                                radius: 24.0.r,
                                backgroundImage: Image.network(snapshot.data![index].url.toString()).image,
                              ),
                            ),
                            20.0.spaceX,
                            Expanded(
                                child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                CustomText(
                                  text: snapshot.data![index].title.toString(),
                                  fontSize: 16.0.sp,
                                  color: AppColors.blue,
                                  maxLine: 1,
                                ),
                                Row(
                                  children: [
                                    Icon(Icons.location_on_sharp, color: AppColors.blue),
                                    10.0.spaceX,
                                    CustomText(
                                      text: snapshot.data![index].id.toString(),
                                      fontSize: 16.0.sp,
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Icon(Icons.school_rounded, color: AppColors.blue),
                                    10.0.spaceX,
                                    CustomText(
                                      text: snapshot.data![index].albumId.toString(),
                                      fontSize: 16.0.sp,
                                    ),
                                  ],
                                ),
                              ],
                            ))
                          ]),
                        );
                      } else {
                        return SizedBox();
                      }
                    },
                  );
                } else if (snapshot.hasError) {
                  return Text('Error ');
                } else {
                  return Center(
                      child: const CircularProgressIndicator(
                    color: AppColors.black,
                  ));
                }
              }),
        ),
      ],
    );
  }
}
