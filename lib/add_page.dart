import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/resume_context.dart';
import 'package:flutter_application_1/data/resume_entity.dart';

class AddPage extends StatefulWidget {
  const AddPage({super.key, required this.title});

  final String title;

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  int currentStep = 0;
  String buttonText = "23";

  //Form Data
  var nameController = TextEditingController();
  var secondNameController = TextEditingController();
  var surnameController = TextEditingController();
  var phoneController = TextEditingController();
  var emailController = TextEditingController();
  var socialLinkController = TextEditingController();
  var functionController = TextEditingController();
  var salaryController = TextEditingController();
  var employmentController = TextEditingController();
  var sheldueController = TextEditingController();
  var cityController = TextEditingController();
  var countryController = TextEditingController();
  var birthdayController = TextEditingController();
  var familyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stepper(
      type: StepperType.horizontal,
      currentStep: currentStep,
      onStepCancel: () => currentStep == 0
          ? null
          : setState(() {
              currentStep -= 1;
            }),
      onStepContinue: () {
        bool isLastStep = currentStep == getSteps().length - 1;
        if (!isLastStep) {
          setState(() {
            currentStep += 1;
          });
        } else {
          var entity = ResumeEntity(
              nameController.text,
              secondNameController.text,
              surnameController.text,
              int.parse(phoneController.text),
              emailController.text,
              socialLinkController.text,
              functionController.text.toString(),
              int.parse(salaryController.text),
              employmentController.text,
              sheldueController.text,
              cityController.text,
              countryController.text,
              birthdayController.text,
              familyController.text);
          var context = ResumeContext();
          context.insert(entity);
        }
      },
      onStepTapped: (step) => setState(() {
        currentStep = step;
      }),
      steps: getSteps(),
    ));
  }

  //steps of form
  //step 1 name
  List<Step> getSteps() {
    return <Step>[
      Step(
          state: currentStep > 0 ? StepState.complete : StepState.indexed,
          isActive: currentStep >= 0,
          title: const Text("ФИО"),
          content: Column(
            children: [
              Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: TextField(
                    controller: nameController,
                    keyboardType: TextInputType.name,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), labelText: "Имя"),
                  )),
              Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: TextField(
                    controller: secondNameController,
                    keyboardType: TextInputType.name,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), labelText: "Фамилия"),
                  )),
              Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: TextField(
                    controller: surnameController,
                    keyboardType: TextInputType.name,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), labelText: "Отчество"),
                  )),
            ],
          )),
      //step 2 contacts
      Step(
          state: currentStep > 1 ? StepState.complete : StepState.indexed,
          isActive: currentStep >= 1,
          title: const Text("Контактные данные"),
          content: Column(
            children: [
              Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: TextField(
                    controller: phoneController,
                    keyboardType: TextInputType.phone,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), labelText: "Телефон"),
                  )),
              Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: TextField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Электронная почта"),
                  )),
              Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: TextField(
                    controller: socialLinkController,
                    keyboardType: TextInputType.url,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Ссылка на социальную сеть"),
                  ))
            ],
          )),
      //step 3 whishes
      Step(
          state: currentStep > 2 ? StepState.complete : StepState.indexed,
          isActive: currentStep >= 2,
          title: const Text("Пожелания к работе"),
          content: Column(
            children: [
              Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: TextField(
                    controller: functionController,
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), labelText: "Должность"),
                  )),
              Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: TextField(
                    controller: salaryController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), labelText: "Зарплата"),
                  )),
              Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: TextField(
                    controller: employmentController,
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), labelText: "Занятость"),
                  )),
              Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: TextField(
                    controller: sheldueController,
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "График работы"),
                  ))
            ],
          )),
      //step 4 own data
      Step(
          state: currentStep > 3 ? StepState.complete : StepState.indexed,
          isActive: currentStep >= 3,
          title: const Text("Личные данные"),
          content: Column(
            children: [
              Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: TextField(
                    controller: cityController,
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Город проживания"),
                  )),
              Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: TextField(
                    controller: countryController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Страна проживания"),
                  )),
              Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: TextField(
                    controller: birthdayController,
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "День рождения"),
                  )),
              Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: TextField(
                    controller: familyController,
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Семейное положение"),
                  ))
            ],
          )),
      //step 3
    ];
  }
}
