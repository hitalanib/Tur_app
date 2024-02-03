import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:tur/screens/signup_screen/signup_screen.dart';
import 'package:tur/shared/network/local/cache_helper.dart';
import 'package:tur/shared/style/colors.dart';

import '../layouts/home_layout.dart';
import '../shared/constants.dart';
import '../shared/widgets.dart';
class BoardigModel{
  final String image;
  final String tittle;
  final String body;
  BoardigModel(this.image, this.tittle, this.body);
}
class OnBoardingScreen extends StatefulWidget {
  OnBoardingScreen({Key? key,}) : super(key: key);
  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  List<BoardigModel> bording=[
    BoardigModel('assests/images/onboard_1.png', 'Plan Your Trip', 'plan your trip, choose your destination. pick the best place for your holiday. '),
    BoardigModel('assests/images/onboard_1.png', 'Select The Date', 'plan your trip, choose your destination. pick the best place for your holiday. '),
    BoardigModel('assests/images/onboard_1.png', 'Enjoy Your Trip', 'plan your trip, choose your destination. pick the best place for your holiday. '),
  ];
  bool isLast=false;
  var boardController= PageController();
  void submit(){
    CashHelper.saveData(key: 'onBoarding', value: true).then((value) {
      navigatorTo(context, SignUpScreen(),);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                onPageChanged: (index) {
                  if(index == bording.length-1){
                    setState(() {
                      isLast=true;
                    });
                  }
                  else{
                    setState(() {
                      isLast=false;
                    });
                  }
                },
                physics: BouncingScrollPhysics(),
                controller: boardController,
                itemBuilder: (context, index) => buildOnBoardingItem(bording[index]),
                itemCount: bording.length,
              ),
            ),
            SizedBox(height : 40.0.h),
            Row(
              children: [
                defaultTextButton(function: (){
                  submit();
                }, text: 'skip',context: context,
                activeColor: false,),
               const Spacer(),
               SmoothPageIndicator(
                 controller: boardController,
                 count: bording.length,
                 effect:  const ExpandingDotsEffect(
                 dotColor: lightGrey,
                 spacing: 5.0,
                 dotHeight: 10.0,
                 dotWidth: 10.0,
                 expansionFactor: 4.0,
                 activeDotColor: lightBlue,
               ),
               ),
                const Spacer(),
                defaultTextButton(function: (){
                  if(isLast){
                    submit();
                  }
                  else{
                    boardController.nextPage(duration: const Duration(milliseconds: 750,), curve: Curves.fastLinearToSlowEaseIn,);
                  }
                }, text: 'Next',context: context,activeColor: true,),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildOnBoardingItem(BoardigModel model) => Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.center,
    children:  [
      Expanded(
        child: Image(
          image: AssetImage('${model.image}'),
          fit: BoxFit.contain,
        ),
      ),
      Center(
        child: SizedBox(
          width: 300.w,
          child: Column(
            children: [
              Text(
                '${model.tittle}',
                style:  Theme.of(context).textTheme.headline1,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 15.0,
              ),
              Text(
                '${model.body}',
                style: Theme.of(context).textTheme.subtitle1?.copyWith(height:1.8,fontFamily: 'Jannah',
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
      const SizedBox(
        height: 15.0,
      ),
    ],
  );
}
