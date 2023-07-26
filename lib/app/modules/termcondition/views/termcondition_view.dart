import 'package:bizani_learning/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/termcondition_controller.dart';

class TermconditionView extends GetView<TermconditionController> {
  const TermconditionView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        elevation: 1,
        automaticallyImplyLeading: false,
        title: const Center(
          child: Text("Syarat & Ketentuan"),
        ),
      ),
      body: Container(
        color: bgColor,
        child: SafeArea(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                child: Obx(() => ListView.builder(
                    itemCount: controller.data.length,
                    itemBuilder: (context, index) {
                      if (index < controller.data.length) {
                        return ListTile(
                          title: Text(controller.data[index].title,
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold)),
                          subtitle: Padding(
                              padding: const EdgeInsets.only(top: 15),
                              child: Text(controller.data[index].content)),
                        );
                      } else {
                        return const Padding(
                          padding: EdgeInsets.all(15),
                          child: Center(
                            child: CircularProgressIndicator(
                              color: primaryColor,
                            ),
                          ),
                        );
                      }
                    }))),
            Expanded(
                child: Column(
              children: [
                const SizedBox(height: 30),
                const Center(
                    child: Text(
                  'Apakah anda menyetujuinya?',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                )),
                const SizedBox(height: 20),
                Obx(() => CheckboxListTile(
                    controlAffinity: ListTileControlAffinity.leading,
                    title: const Text(
                        'Saya sudah membaca dan saya menyetujui syarat & ketentuan tersebut.'),
                    value: controller.setuju1.value,
                    onChanged: (bool? value) {
                      controller.setuju1.value = value!;
                    })),
                const SizedBox(height: 5),
                Obx(() => CheckboxListTile(
                    controlAffinity: ListTileControlAffinity.leading,
                    title: const Text(
                        'Saya sudah membaca dan saya menyetujui syarat & ketentuan tersebut.'),
                    value: controller.setuju2.value,
                    onChanged: (bool? value) {
                      controller.setuju2.value = value!;
                    })),
                const SizedBox(height: 40),
                Obx(
                  () => (controller.setuju1.isTrue && controller.setuju2.isTrue)
                      ? GestureDetector(
                          onTap: () => controller.postDataAgreement(),
                          child: Container(
                            padding: const EdgeInsets.all(25),
                            margin: const EdgeInsets.symmetric(horizontal: 25),
                            decoration: BoxDecoration(
                              color: primaryColor,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Center(
                              child: controller.isLoadingBTn.isFalse
                                  ? const Text(
                                      'Simpan',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    )
                                  : const CircularProgressIndicator(
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                          Colors.white),
                                    ),
                            ),
                          ),
                        )
                      : const Text('Kami menghargai segala keputusan anda.'),
                )
              ],
            ))
          ],
        )),
      ),
    );
  }
}
