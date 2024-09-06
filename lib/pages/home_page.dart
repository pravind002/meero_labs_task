import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/assets.dart';
import '../constants/colors.dart';
import '../constants/dimension.dart';
import '../utils/popular_meal_page.dart';
import '../utils/todays_meal_page.dart';
import '../widgets/floating_action_button_page.dart';
import '../widgets/text.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late PageController _pageController;
  late DateTime _currentDate;
  DateTime _selectedDate = DateTime.now(); // Default selected date
  int _currentWeekOffset = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
    _currentDate = DateTime.now();
  }

  List<DateTime> _getDatesForWeek(int weekOffset) {
    DateTime firstDayOfWeek = _currentDate
        .subtract(Duration(days: _currentDate.weekday - 1))
        .add(Duration(days: 7 * weekOffset));
    return List.generate(
        7, (index) => firstDayOfWeek.add(Duration(days: index)));
  }

  String _getGreeting() {
    int hour = DateTime.now().hour;

    if (hour < 12) {
      return 'Good Morning,';
    } else if (hour < 17) {
      return 'Good Afternoon,';
    } else {
      return 'Good Evening,';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: whiteColor,
        leading: _buildLeadingIcon(),
        title: _buildLocationTitle(),
        actions: [_buildNotificationIcon()],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0).w,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              height20(),
              // _buildGreetingText(),
              RichText(
                text: TextSpan(
                  text: '${_getGreeting()} ',
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 28,
                      fontWeight: FontWeight.w700),
                  children: const [
                    TextSpan(
                      text: 'Rehan!',
                      style: TextStyle(
                          color: primaryColor,
                          fontSize: 28,
                          fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "Choose the right meal for you",
                style: TextStyle(
                    fontSize: 16,
                    color: Color(0xff888888),
                    fontWeight: FontWeight.w400,
                    letterSpacing: 0.5),
              ),
              height20(),
              _buildSearchRow(),
              height20(),
              _buildServingThisMonthHeader(),
              height20(),
              _buildScrollableWeekView(),
              height20(),
              customText("Todays Meal",
                  fontsize: 16.sp, fontWeight: FontWeight.w500),
              const SizedBox(height: 10),
              SizedBox(
                  height: 100.h,
                  child: TodaysMealPage()), // Today's Meal Section
              height20(),
              PopularMealPaage(), // Popular Meal Section
              height20(),
            ],
          ),
        ),
      ),
      resizeToAvoidBottomInset: false,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: const FloatingActionButtonPage(),
    );
  }

  Widget _buildScrollableWeekView() {
    return SizedBox(
      height: 60,
      child: PageView.builder(
        controller: _pageController,
        scrollDirection: Axis.horizontal,
        onPageChanged: (index) {
          setState(() {
            _currentWeekOffset = index; // Update the week offset on scroll
          });
        },
        itemBuilder: (context, index) {
          List<DateTime> weekDates = _getDatesForWeek(index);
          return _buildHorizontalDateList(weekDates);
        },
      ),
    );
  }

  Widget _buildHorizontalDateList(List<DateTime> weekDates) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: weekDates.length,
      itemBuilder: (context, index) {
        DateTime dateForIndex = weekDates[index];
        bool isCurrentDay = _selectedDate.day == dateForIndex.day &&
            _selectedDate.month == dateForIndex.month &&
            _selectedDate.year == dateForIndex.year;

        return GestureDetector(
          onTap: () {
            setState(() {
              _selectedDate = dateForIndex;
            });
          },
          child: Container(
            height: 56,
            width: 45,
            margin: const EdgeInsets.symmetric(horizontal: 4),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: isCurrentDay ? primaryColor : lightColor,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                customText(_getShortDayName(dateForIndex.weekday),
                    fontsize: 14,
                    fontWeight: FontWeight.w600,
                    color: isCurrentDay ? whiteColor : blackColor),
                customText('${dateForIndex.day}',
                    fontsize: 14,
                    fontWeight: FontWeight.w600,
                    color: isCurrentDay ? whiteColor : blackColor),
              ],
            ),
          ),
        );
      },
    );
  }

  String _getShortDayName(int weekday) {
    switch (weekday) {
      case DateTime.monday:
        return 'Mon';
      case DateTime.tuesday:
        return 'Tue';
      case DateTime.wednesday:
        return 'Wed';
      case DateTime.thursday:
        return 'Thu';
      case DateTime.friday:
        return 'Fri';
      case DateTime.saturday:
        return 'Sat';
      case DateTime.sunday:
        return 'Sun';
      default:
        return '';
    }
  }

  Widget _buildLocationTitle() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          locationImage,
          width: 16,
          height: 18,
        ),
        const SizedBox(width: 5),
        const Text("Dhanmondi, Dhaka",
            style: TextStyle(
                color: Color(0xff323434),
                fontSize: 14,
                fontWeight: FontWeight.w600)),
        const Icon(Icons.keyboard_arrow_down),
      ],
    );
  }

  Widget _buildNotificationIcon() {
    return Container(
      width: 44,
      height: 44,
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: fillColor,
      ),
      child: Center(
        child: Image.asset(
          notifationImage,
          width: 24,
          height: 24,
        ),
      ),
    );
  }

  Widget _buildSearchRow() {
    return Row(
      children: [
        Expanded(
          child: TextFormField(
            decoration: InputDecoration(
              fillColor: const Color(0xffF5F5F5),
              filled: true,
              hintText: 'Search lunch, dishes',
              hintStyle: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Color(0xff888888),
              ),
              prefixIcon: const Icon(
                Icons.search,
                color: Color(0xff888888),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 17),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your email';
              }
              return null;
            },
          ),
        ),
        const SizedBox(width: 10),
        Container(
          height: 56,
          width: 56,
          decoration: BoxDecoration(
            color: primaryColor,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Center(
            child: Image.asset(
              filterImage,
              width: 24,
              height: 24,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildLeadingIcon() {
    return Container(
      width: 44,
      height: 44,
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: fillColor,
      ),
      child: Center(
        child: Image.asset(
          gridImage,
          width: 24,
          height: 24,
        ),
      ),
    );
  }

  Widget _buildServingThisMonthHeader() {
    // Format current week range (e.g., "01-07 Sep")
    String weekRange =
        "${_formatDate(_getDatesForWeek(_currentWeekOffset).first)} - ${_formatDate(_getDatesForWeek(_currentWeekOffset).last)}";
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text("Serving this Month",
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                letterSpacing: 0.15,
                color: Color(0xff323434))),
        Text(weekRange,
            style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.5,
                color: primaryColor)),
      ],
    );
  }

  String _formatDate(DateTime date) {
    return "${date.day.toString().padLeft(2, '0')} ${_getMonthName(date.month)}";
  }

  String _getMonthName(int month) {
    const months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec'
    ];
    return months[month - 1];
  }
}
