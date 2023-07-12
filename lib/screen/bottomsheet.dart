
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';


import '../AccountPage/widgets/profile_item.dart';

class Bottomsheet extends StatefulWidget {
  const Bottomsheet({Key? key}) : super(key: key);
  @override
  State<Bottomsheet> createState() => _BottomsheetState();
}

class _BottomsheetState extends State<Bottomsheet> {
  String? gender;
  @override
  Widget build(BuildContext context) {
    return  Stack(
      alignment: AlignmentDirectional.topCenter,
      clipBehavior: Clip.none,
      children: [
        Positioned(
          top: -15,
          child: Container(
            width: 60,
            height: 7,
            margin: const EdgeInsets.only(bottom: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.white,
            ),
          ),
        ),

        Column(
          children: [
            Text("يمكنك التواصل معنا عبر",
              style: TextStyle(
                fontSize: 20
            ),),

            Divider(),
            ProfileItem(
              title: "+967 777812182",
              iconData: Iconsax.call4,
              onTab: () {


                print("test");
              },
            ),

            ProfileItem(
              title: "+967 717502063",
              iconData: Iconsax.call4,
              onTab: () {


                print("test");
              },
            ),
            ProfileItem(
              title: "+967 144802",
              iconData: Iconsax.call4,
              onTab: () {


                print("test");
              },
            ),

          ],
        ),
      ],
    );
  }

}

// void ShowModalBottomSheeteeet(BuildContext context) {
//   showModalBottomSheet(
//     context: context,
//     // isScrollControlled: true,
//     shape: const RoundedRectangleBorder(
//         borderRadius: BorderRadius.vertical(
//           top: Radius.circular(30),
//         )),
//     builder: (context) => DraggableScrollableSheet(
//         initialChildSize: 0.4,
//         maxChildSize: 0.9,
//         minChildSize: 0.32,
//         // expand: false,
//         builder: (context, scrollController) {
//           return SingleChildScrollView(
//             // controller: scrollController,
//             child: const Bottomsheet(),
//           );
//         }),
//   );
// }
void ShowModalBottomSheeteeet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    //  isScrollControlled: true,
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(30),
        )),
    builder: (context) => SingleChildScrollView(
      // controller: scrollController,
      child:  Bottomsheet(),
    ),
  );
}

