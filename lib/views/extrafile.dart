// ignore_for_file: prefer_equal_for_default_values

// TextFormField(
//                     validator: (value) {
//                       if (value!.isEmpty) {
//                         return ("Enter Your Email");
//                       }
//                       if (!RegExp(
//                               r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
//                           .hasMatch(value)) {
//                         return ("Please Enter valid Email");
//                       }
//                       return null;
//                     },
//                     onSaved: (value) {
//                         emailController.text = value!;
//                       },
//                     decoration: InputDecoration(
//                         hintText: "Type Your Email", labelText: "Email"),
//                   ),




// TextFormField(
//                       autofocus: false,
//                       //-------------------------------
//                       keyboardType: TextInputType.emailAddress,
//                       //--------------------------------
//                       controller: emailController,

//                       //--------------------------------
//                       validator: (value) {
//                         if (value!.isEmpty) {
//                           return ("Invalid Email");
//                         }
//                         return null;
//                       },
//                       //--------------------------------
//                       onSaved: (value) {
//                         emailController.text = value!;
//                       },
//                       //--------------------------------
//                       decoration: InputDecoration(
//                           hintText: "Enter Your Email", labelText: "Email"),
//                       //--------------------------------
//                       onChanged: (value) {
//                         name = value;
//                         setState(() {});
//                         //--------------------------------
//                       },
//                       textInputAction: TextInputAction.next,
//                     ),
