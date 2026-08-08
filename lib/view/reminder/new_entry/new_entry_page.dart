import 'dart:math';

import 'package:fitness_workout_app_1/core/constants.dart';
import 'package:fitness_workout_app_1/core/global_bloc.dart';
import 'package:fitness_workout_app_1/core/models/errors.dart';
import 'package:fitness_workout_app_1/core/models/medicine.dart';
import 'package:fitness_workout_app_1/core/models/medicine_type.dart';
import 'package:fitness_workout_app_1/core/utils/app_assets.dart';
import 'package:fitness_workout_app_1/core/utils/app_colors.dart';
import 'package:fitness_workout_app_1/core/utils/app_strings.dart';
import 'package:fitness_workout_app_1/view/main_tab/select_view.dart';
import 'package:fitness_workout_app_1/view/reminder/home_page_reminder.dart';
import 'package:fitness_workout_app_1/view/reminder/new_entry/new_entry_bloc.dart';
import 'package:fitness_workout_app_1/view/reminder/new_entry/select_time.dart';
import 'package:fitness_workout_app_1/view/reminder/success_screen/success_screen.dart';
import 'package:fitness_workout_app_1/widget/interval_selection.dart';
import 'package:fitness_workout_app_1/widget/medicine_type_column.dart';
import 'package:fitness_workout_app_1/widget/panel_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:fitness_workout_app_1/core/utils/responsive.dart';
import 'package:timezone/timezone.dart' as tz;

class NewEntryPage extends StatefulWidget {
  const NewEntryPage({Key? key}) : super(key: key);

  @override
  State<NewEntryPage> createState() => _NewEntryPageState();
}

class _NewEntryPageState extends State<NewEntryPage> {
  late TextEditingController nameController;
  late TextEditingController dosageController;
  late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
  late NewEntryBloc _newEntryBloc;
  late GlobalKey<ScaffoldState> _scaffoldKey;

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    dosageController.dispose();
    _newEntryBloc.dispose();
  }

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    dosageController = TextEditingController();
    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    _newEntryBloc = NewEntryBloc();
    _scaffoldKey = GlobalKey<ScaffoldState>();
    initializeNotifications();
    initializeErrorListen();
  }

  @override
  Widget build(BuildContext context) {
    final GlobalBloc globalBloc = Provider.of<GlobalBloc>(context);
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      key: _scaffoldKey,
      resizeToAvoidBottomInset: false,
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
          AppStrings.addNew,
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
      body: Provider<NewEntryBloc>.value(
        value: _newEntryBloc,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.all(2.height),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const PanelTitle(title: 'Medicine Name', isRequired: true),
                TextFormField(
                  cursorColor: AppColor.primaryColor1,
                  maxLength: 70,
                  controller: nameController,
                  textCapitalization: TextCapitalization.words,
                  decoration: InputDecoration(
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: AppColor.primaryColor4),
                    ),
                    hintText: 'Enter Medicine Name',
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: AppColor.primaryColor1),
                    ),
                    border: const UnderlineInputBorder(),
                  ),
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: AppColor.primaryColor1,
                    fontFamily: AppStrings.fontFamilyHind,
                    fontWeight: FontWeight.w600,
                    fontSize: 10.sp,
                  ),
                ),
                const PanelTitle(title: 'Dosage in mg', isRequired: false),
                TextFormField(
                  cursorColor: AppColor.primaryColor1,
                  maxLength: 12,
                  controller: dosageController,
                  textCapitalization: TextCapitalization.words,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: AppColor.primaryColor4),
                    ),
                    hintText: 'Enter Dosage in mg',
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: AppColor.primaryColor1),
                    ),
                    border: const UnderlineInputBorder(),
                  ),
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: AppColor.primaryColor1,
                    fontFamily: AppStrings.fontFamilyHind,
                    fontWeight: FontWeight.w600,
                    fontSize: 10.sp,
                  ),
                ),
                SizedBox(height: 1.height),
                const PanelTitle(title: 'Medicine Type', isRequired: false),
                Padding(
                  padding: EdgeInsets.only(top: 1.height),
                  child: StreamBuilder<MedicineType>(
                    //new entry block
                    stream: _newEntryBloc.selectedMedicineType,
                    builder: (context, snapshot) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          //not yet clickable?
                          MedicineTypeColumn(
                            medicineType: MedicineType.Bottle,
                            name: 'Bottle',
                            iconPath: AppAssets.bottleIcon,
                            isSelected: snapshot.data == MedicineType.Bottle
                                ? true
                                : false,
                          ),
                          MedicineTypeColumn(
                            medicineType: MedicineType.Pill,
                            name: 'Pill',
                            iconPath: AppAssets.pillIcon,
                            isSelected: snapshot.data == MedicineType.Pill
                                ? true
                                : false,
                          ),
                          MedicineTypeColumn(
                            medicineType: MedicineType.Syringe,
                            name: 'Syringe',
                            iconPath: AppAssets.syringeIcon,
                            isSelected: snapshot.data == MedicineType.Syringe
                                ? true
                                : false,
                          ),
                          MedicineTypeColumn(
                            medicineType: MedicineType.Tablet,
                            name: 'Tablet',
                            iconPath: AppAssets.tabletIcon,
                            isSelected: snapshot.data == MedicineType.Tablet
                                ? true
                                : false,
                          ),
                        ],
                      );
                    },
                  ),
                ),
                const PanelTitle(title: 'Interval Selection', isRequired: true),
                const IntervalSelection(),
                Row(
                  children: [
                    const PanelTitle(title: 'Starting Time', isRequired: true),
                    SizedBox(width: 2.width),
                    const SelectTime(),
                  ],
                ),
                SizedBox(height: 9.height),
                Padding(
                  padding: EdgeInsets.only(left: 8.width, right: 8.width),
                  child: SizedBox(
                    width: 80.height,
                    height: 6.height,
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColor.white,
                        borderRadius: BorderRadius.circular(35),
                        boxShadow: [
                          BoxShadow(
                            color: AppColor.primaryColor1,
                            blurRadius: 4,
                          ),
                        ],
                      ),
                      child: TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: AppColor.white,
                        ),
                        child: Center(
                          child: Text(
                            'Confirm',
                            style: Theme.of(context).textTheme.titleSmall!
                                .copyWith(
                                  color: AppColor.primaryColor1,
                                  fontFamily: AppStrings.fontFamilyHind,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 18.sp,
                                ),
                          ),
                        ),
                        onPressed: () {
                          //add medicine
                          //some validations
                          //go to success screen

                          String? medicineName;
                          int? dosage;

                          //medicineName
                          if (nameController.text == "") {
                            _newEntryBloc.submitError(EntryError.nameNull);
                            return;
                          }
                          if (nameController.text != "") {
                            medicineName = nameController.text;
                          }
                          //dosage
                          if (dosageController.text == "") {
                            dosage = 0;
                          }
                          if (dosageController.text != "") {
                            dosage = int.parse(dosageController.text);
                          }
                          for (var medicine
                              in globalBloc.medicineList$!.value) {
                            if (medicineName == medicine.medicineName) {
                              _newEntryBloc.submitError(
                                EntryError.nameDuplicate,
                              );
                              return;
                            }
                          }
                          if (_newEntryBloc.selectIntervals!.value == 0) {
                            _newEntryBloc.submitError(EntryError.interval);
                            return;
                          }
                          if (_newEntryBloc.selectedTimeOfDay$!.value ==
                              'None') {
                            _newEntryBloc.submitError(EntryError.startTime);
                            return;
                          }

                          String medicineType = _newEntryBloc
                              .selectedMedicineType!
                              .value
                              .toString()
                              .substring(13);

                          int interval = _newEntryBloc.selectIntervals!.value;
                          String startTime =
                              _newEntryBloc.selectedTimeOfDay$!.value;

                          List<int> intIDs = makeIDs(
                            24 / _newEntryBloc.selectIntervals!.value,
                          );
                          List<String> notificationIDs = intIDs
                              .map((i) => i.toString())
                              .toList();

                          Medicine newEntryMedicine = Medicine(
                            notificationIDs: notificationIDs,
                            medicineName: medicineName,
                            dosage: dosage,
                            medicineType: medicineType,
                            interval: interval,
                            startTime: startTime,
                          );

                          //update medicine list via global bloc
                          globalBloc.updateMedicineList(newEntryMedicine);

                          //schedule notification
                          // scheduleNotification(newEntryMedicine);

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SuccessScreen(),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void initializeErrorListen() {
    _newEntryBloc.errorState$!.listen((EntryError error) {
      switch (error) {
        case EntryError.nameNull:
          displayError("Please enter the medicine's name");
          break;

        case EntryError.nameDuplicate:
          displayError("Medicine name already exists");
          break;
        case EntryError.dosage:
          displayError("Please enter the dosage required");
          break;
        case EntryError.interval:
          displayError("Please select the reminder's interval");
          break;
        case EntryError.startTime:
          displayError("Please select the reminder's starting time");
          break;
        default:
      }
    });
  }

  void displayError(String error) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: AppColor.red,
        content: Text(
          error,
          style: TextStyle(
            color: AppColor.white,
            fontFamily: AppStrings.fontFamilyHind,
            fontWeight: FontWeight.w700,
          ),
        ),
        duration: const Duration(milliseconds: 2000),
      ),
    );
  }

  List<int> makeIDs(double n) {
    var rng = Random();
    List<int> ids = [];
    for (int i = 0; i < n; i++) {
      ids.add(rng.nextInt(1000000000));
    }
    return ids;
  }

  initializeNotifications() async {
    var initializationSettingsAndroid = const AndroidInitializationSettings(
      '@mipmap/launcher_icon',
    );

    var initializationSettingsIOS = const DarwinInitializationSettings();
    var initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,
    );

    await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  Future onSelectNotification(String? payload) async {
    if (payload != null) {
      debugPrint('notification payload: $payload');
    }
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const HomePageReminder()),
    );
  }

  Future<void> scheduleNotification(Medicine medicine) async {
    var hour = int.parse(medicine.startTime![0] + medicine.startTime![1]);
    var ogValue = hour;
    var minute = int.parse(medicine.startTime![2] + medicine.startTime![3]);

    var androidPlatformChannelSpecifics = const AndroidNotificationDetails(
      'repeatDailyAtTime channel id',
      'repeatDailyAtTime channel name',
      importance: Importance.max,
      ledColor: kOtherColor,
      ledOffMs: 1000,
      ledOnMs: 1000,
      enableLights: true,
    );

    var iOSPlatformChannelSpecifics = const DarwinNotificationDetails();

    var platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics,
      iOS: iOSPlatformChannelSpecifics,
    );

    for (int i = 0; i < (24 / medicine.interval!).floor(); i++) {
      if (hour + (medicine.interval! * i) > 23) {
        hour = hour + (medicine.interval! * i) - 24;
      } else {
        hour = hour + (medicine.interval! * i);
      }
      await flutterLocalNotificationsPlugin.zonedSchedule(
        int.parse(medicine.notificationIDs![i]),
        'Reminder: ${medicine.medicineName}',
        medicine.medicineType.toString() != MedicineType.None.toString()
            ? 'It is time to take your ${medicine.medicineType!.toLowerCase()}, according to schedule'
            : 'It is time to take your medicine, according to schedule',
        tz.TZDateTime.now(tz.local).add(Duration(hours: hour, minutes: minute)),
        platformChannelSpecifics,
        androidScheduleMode: AndroidScheduleMode.inexactAllowWhileIdle,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
        matchDateTimeComponents: DateTimeComponents.time,
        payload: 'scheduled payload',
      );
      hour = ogValue;
    }
  }
}
