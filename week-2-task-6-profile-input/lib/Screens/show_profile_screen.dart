import 'package:flutter/material.dart';
class SecondScreen extends StatelessWidget {
  final String name;
  final String gender;
  final bool agreedToTerms;

  const SecondScreen({super.key,
    required this.name,
    required this.gender,
    required this.agreedToTerms,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.redAccent,
      appBar: AppBar(automaticallyImplyLeading: false,
        backgroundColor: Colors.redAccent,
        title: const Text('Profile Details',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
      ),
      body: Container(
        margin: const EdgeInsets.all(10),
        child: Column(
          children: [

            Container(
              height: 480,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.black,
              ),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  SizedBox
                    (
                    width: 300,height: 280,
                    child:gender=='Female' ?Image.asset('images/female_2.png',fit: BoxFit.fill,):Image.asset('images/male_2.png'),
                  ),
                  const SizedBox(height: 10,),

                  Text(name,style: const TextStyle(fontSize: 23,color: Colors.white,fontWeight: FontWeight.bold),),
                  const SizedBox(height: 5,),
                  Text(gender,style: const TextStyle(fontSize: 20,color: Colors.white70)),
                  Text('Agreed to terms: ${agreedToTerms ? "Yes" : "No"}',style: const TextStyle(fontSize: 20,color: Colors.white70)),
                  const SizedBox(height: 25),

                ],
              ),
            ),
            const SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,

              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 50,vertical: 14)
                  ),
                  child: const Text('Back',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                ),
                const SizedBox(width: 15,)
              ],
            ),
          ],
        ),
      ),
    );
  }
}
