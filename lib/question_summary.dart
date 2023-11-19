import 'package:flutter/material.dart';

class QuestionSummary extends StatelessWidget {
  const QuestionSummary(this.summary, {super.key});
  final List<Map<String, Object>> summary;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.fromLTRB(35, 5, 35, 5),
          child: Column(
            children: summary.map((data) {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: (data["user_ans"] == data["crt_ans"])
                            ? const Color.fromARGB(255, 150, 198, 241)
                            : const Color.fromARGB(255, 249, 133, 241),
                    ),
                    child: Text(
                      (data["q_index"] as int).toString(),
                      style: const TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          data["question"] as String,
                          textAlign: TextAlign.left,
                          style: const TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.normal),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          data["user_ans"] as String,
                          textAlign: TextAlign.left,
                          style: const TextStyle(
                              fontSize: 18,
                              color: Colors.white54,
                              fontWeight: FontWeight.normal),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          data["crt_ans"] as String,
                          textAlign: TextAlign.left,
                          style: const TextStyle(
                              fontSize: 18,
                              color: Color.fromARGB(255, 150, 198, 241),
                              fontWeight: FontWeight.normal),
                        ),
                        const SizedBox(
                          height: 9,
                        )
                      ],
                    ),
                  )
                ],
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
