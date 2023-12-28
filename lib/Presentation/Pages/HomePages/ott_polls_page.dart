import 'package:flutter/material.dart';

class OttPollsPage extends StatefulWidget {
  const OttPollsPage({super.key});

  @override
  State<OttPollsPage> createState() => _OttPollsPageState();
}

class _OttPollsPageState extends State<OttPollsPage> {
  List<String> options = [
    'Prefer washing myself',
    'Car wash center',
    'No preference, it depends on the situation',
  ];
  List<String> question = [
    'Do you prefer washing your car yourself, or do you prefer having it washed at a car wash center?',
    'Which of the following is your favorite movie genre?',
    'Who is your favorite actor?',
  ];
  String? selectedOptions;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'OTT Polls',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18.0,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: ListView.builder(
          itemCount: question.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 6.0),
                  width: MediaQuery.of(context).size.width * 1.0,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 15.0, vertical: 10.0),
                  decoration: const BoxDecoration(
                    color: Color(0xff424242),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(1.0),
                            decoration: const BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.all(
                                Radius.circular(2.0),
                              ),
                            ),
                            child: const Text(
                              'Polls',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14.0,
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(1.0),
                            decoration: const BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.all(
                                Radius.circular(2.0),
                              ),
                            ),
                            child: const Text(
                              '1.5k Votes',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                      // question
                      const SizedBox(height: 10.0),
                      Text(
                        question[index],
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 15.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      // options
                      const SizedBox(height: 10.0),
                      ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: options.length,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: const EdgeInsets.only(bottom: 10.0),
                            width: MediaQuery.of(context).size.width * 1.0,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 0.0, vertical: 0.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.0),
                              border: Border.all(
                                color: Colors.red,
                                width: 0.8,
                              ),
                            ),
                            child: RadioListTile(
                              value: options[index],
                              groupValue: selectedOptions,
                              onChanged: (onChanged) {
                                setState(() {
                                  selectedOptions = onChanged;
                                });
                              },
                              activeColor: Colors.red,
                              contentPadding: EdgeInsets.zero,
                              hoverColor: Colors.red,
                              fillColor: MaterialStateProperty.all(Colors.red),
                              dense: true,
                              materialTapTargetSize:
                                  MaterialTapTargetSize.shrinkWrap,
                              visualDensity: VisualDensity.compact,
                              title: Text(
                                options[index],
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                      const SizedBox(height: 5.0),
                      Divider(color: Colors.grey[400], thickness: 0.3),
                      // like, comment, share
                      const SizedBox(height: 10.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 5.0, vertical: 3.0),
                            child: const Row(
                              children: [
                                Icon(
                                  Icons.thumb_up_alt_outlined,
                                  color: Colors.white,
                                  size: 20.0,
                                ),
                                SizedBox(width: 5.0),
                                Text(
                                  '1.5k',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Row(
                            children: [
                              Icon(
                                Icons.comment_outlined,
                                color: Colors.white,
                                size: 20.0,
                              ),
                              SizedBox(width: 5.0),
                              Text(
                                '1.5k',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                          const Row(
                            children: [
                              Icon(
                                Icons.share_outlined,
                                color: Colors.white,
                                size: 20.0,
                              ),
                              SizedBox(width: 5.0),
                              Text(
                                '1.5k',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            );
          }),
    );
  }
}


// Container(
                //   margin: const EdgeInsets.only(bottom: 10.0),
                //   width: MediaQuery.of(context).size.width * 1.0,
                //   padding: const EdgeInsets.symmetric(
                //       horizontal: 0.0, vertical: 0.0),
                //   decoration: BoxDecoration(
                //     borderRadius: BorderRadius.circular(5.0),
                //     border: Border.all(
                //       color: Colors.red,
                //       width: 0.8,
                //     ),
                //   ),
                //   child: RadioListTile(
                //     value: 'Car wash center',
                //     groupValue: selectedOptions,
                //     onChanged: (onChanged) {
                //       setState(() {
                //         selectedOptions = onChanged;
                //       });
                //     },
                //     activeColor: Colors.red,
                //     contentPadding: EdgeInsets.zero,
                //     hoverColor: Colors.red,
                //     fillColor: MaterialStateProperty.all(Colors.red),
                //     dense: true,
                //     materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                //     visualDensity: VisualDensity.compact,
                //     title: const Text(
                //       'Car wash center',
                //       style: TextStyle(
                //         color: Colors.white,
                //         fontSize: 15.0,
                //         fontWeight: FontWeight.w400,
                //       ),
                //     ),
                //   ),
                // ),