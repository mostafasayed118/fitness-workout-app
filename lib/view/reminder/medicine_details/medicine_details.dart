import 'package:fitness_workout_app_1/core/constants.dart';
import 'package:fitness_workout_app_1/core/global_bloc.dart';
import 'package:fitness_workout_app_1/core/models/medicine.dart';
import 'package:fitness_workout_app_1/core/utils/app_assets.dart';
import 'package:fitness_workout_app_1/core/utils/app_colors.dart';
import 'package:fitness_workout_app_1/core/utils/app_strings.dart';
import 'package:fitness_workout_app_1/view/main_tab/select_view.dart';
import 'package:fitness_workout_app_1/view/reminder/home_page_reminder.dart';
import 'package:fitness_workout_app_1/view/reminder/medicine_details/extended_section.dart';
import 'package:fitness_workout_app_1/view/reminder/medicine_details/main_section.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:fitness_workout_app_1/core/utils/responsive.dart';

class MedicineDetails extends StatefulWidget {
  const MedicineDetails(this.medicine, {Key? key}) : super(key: key);
  final Medicine medicine;

  @override
  State<MedicineDetails> createState() => _MedicineDetailsState();
}

class _MedicineDetailsState extends State<MedicineDetails> {
  @override
  Widget build(BuildContext context) {
    final GlobalBloc _globalBloc = Provider.of<GlobalBloc>(context);
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColor.backgroundColor,
        centerTitle: true,
        elevation: 0,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            margin: const EdgeInsets.all(8),
            height: 40,
            width: 40,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              // color: TColor.lightGray,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Image.asset(
              AppAssets.leftArrowIcon,
              width: 30,
              height: 30,
              fit: BoxFit.contain,
            ),
          ),
        ),
        title: Text(
          AppStrings.details,
          style: TextStyle(
            color: AppColor.black,
            fontSize: 20,
            fontWeight: FontWeight.w700,
            fontFamily: 'Hind',
          ),
        ),
        actions: [
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SelectView()),
              );
            },
            child: Container(
              margin: const EdgeInsets.all(8),
              height: 40,
              width: 40,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                // color: TColor.lightGray,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Image.asset(
                AppAssets.twoDotsIcon,
                width: 30,
                height: 30,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(2.height),
        child: Column(
          children: [
            MainSection(medicine: widget.medicine),
            ExtendedSection(medicine: widget.medicine),
            const Spacer(),
            SizedBox(
              width: 100.width,
              height: 7.height,
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: AppColor.red.withOpacity(0.7),
                  shape: const StadiumBorder(),
                ),
                onPressed: () {
                  //open alert dialog box,+global bloc, later
                  //cool its working
                  openAlertBox(context, _globalBloc);
                },
                child: Text(
                  AppStrings.delete,
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: AppColor.white,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w700,
                    fontFamily: AppStrings.fontFamilyPoppins,
                  ),
                ),
              ),
            ),
            SizedBox(height: 2.height),
          ],
        ),
      ),
    );
  }
  //delete a medicine from memory

  openAlertBox(BuildContext context, GlobalBloc _globalBloc) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: AppColor.backgroundColor,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0),
              bottomRight: Radius.circular(20.0),
            ),
          ),
          contentPadding: EdgeInsets.only(top: 1.height),
          title: Text(
            AppStrings.deleteThisReminder,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                AppStrings.cancel,
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  fontWeight: FontWeight.w500,
                  fontFamily: AppStrings.fontFamilyHind,
                  fontSize: 12.sp,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                //global block to delete medicine
                _globalBloc.removeMedicine(widget.medicine);
                // Navigator.of(context).pop();
                // Navigator.popUntil(context, ModalRoute.withName('/'));
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const HomePageReminder();
                    },
                  ),
                );
              },
              child: Text(
                AppStrings.ok,
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: kSecondaryColor,
                  fontWeight: FontWeight.w500,
                  fontFamily: AppStrings.fontFamilyHind,
                  fontSize: 12.sp,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
