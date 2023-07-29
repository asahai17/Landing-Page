import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:humaranagar/imagery.dart';
import 'package:humaranagar/custcol.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class homepage extends StatefulWidget {
  const homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  PageController _screen = PageController();
  GlobalKey<FormState> _form = GlobalKey<FormState>();

  List Screen = [
    [imagery.Screen1, "We Connect"],
    [imagery.Screen2, "We Solve"],
    [imagery.Screen3, "We Listen"],
    [imagery.Screen4, "We Notify"],
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(30.h),
        color: CustomColor.PrimaryColor,
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              SizedBox(
                height: 120.h,
              ),
              Container(
                  width: double.infinity,
                  height: 300.h,
                  child: PageView.builder(
                    controller: _screen,
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          SvgPicture.asset(
                            Screen[index][0],
                            height: 230.h,
                          ),
                          SizedBox(
                            height: 40.h,
                          ),
                          Text(
                            Screen[index][1],
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 18.sp,
                              fontFamily: 'Open Sans',
                            ),
                          )
                        ],
                      );
                    },
                  )),
              SizedBox(
                height: 20.h,
              ),
              SmoothPageIndicator(
                  controller: _screen, // PageController
                  count: 4,
                  effect: ExpandingDotsEffect(
                      dotHeight: 8.h,
                      dotWidth: 8.w,
                      dotColor: const Color.fromARGB(255, 252, 211, 164),
                      activeDotColor:
                          CustomColor.ButtonColor), // your preferred effect
                  onDotClicked: (index) {}),
              SizedBox(
                height: 60.h,
              ),
              Form(
                  key: _form,
                  child: TextFormField(
                    cursorColor: CustomColor.ButtonColor,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        prefixIcon: Padding(
                          padding: EdgeInsets.only(
                              left: 10.r, top: 5.r, bottom: 5.r),
                          child: Container(
                            width: 50.w,
                            child: Row(
                              children: [
                                Text(
                                  "+91",
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                    fontFamily: 'Open Sans',
                                  ),
                                ),
                                SizedBox(
                                  width: 7.w,
                                ),
                                Container(
                                  color: Color.fromARGB(255, 207, 207, 207),
                                  height: 25.h,
                                  width: 2.w,
                                )
                              ],
                            ),
                          ),
                        ),
                        hintText: "Phone number",
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4),
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 235, 235, 235))),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4),
                            borderSide: BorderSide(
                                color:
                                    const Color.fromARGB(255, 255, 153, 51))),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.sp))),
                    validator: (value) {
                      if (value == "") {
                        return "Phone Number Can't Be Empty";
                      }
                      if (value!.length != 10) {
                        return 'Try To Enter 10 Digit Number';
                      }
                      return null;
                    },
                  )),
              SizedBox(
                height: 30.h,
              ),
              SizedBox(
                  width: double.infinity,
                  height: 50.h,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.r)),
                        backgroundColor: CustomColor.ButtonColor,
                      ),
                      onPressed: () {
                        if (_form.currentState!.validate()) {}
                      },
                      child: Text(
                        "Continue",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 14.sp,
                          height: 14 / 14,
                          fontFamily: 'Open Sans',
                        ),
                      ))),
              SizedBox(
                height: 30.h,
              ),
              Text(
                "By continuing, you agree to our",
                style: TextStyle(
                  fontSize: 12.sp,
                  color: Color.fromARGB(255, 130, 130, 130),
                  fontFamily: 'Open Sans',
                ),
              ),
              Text(
                "Terms & Condition & Privacy Policy",
                style: TextStyle(
                    fontSize: 12.sp,
                    color: Color.fromARGB(255, 79, 79, 79),
                    fontFamily: 'Open Sans',
                    decoration: TextDecoration.underline),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
