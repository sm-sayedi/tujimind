import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tujimind/constants.dart';
import 'package:tujimind/widgets/therapist_item.dart';

import '../models/therapist.dart';

class SpeakScreen extends StatefulWidget {
  const SpeakScreen({Key? key}) : super(key: key);

  @override
  State<SpeakScreen> createState() => _SpeakScreenState();
}

class _SpeakScreenState extends State<SpeakScreen> {
  final List<Therapist> _therapists = [
    Therapist(
      name: "Dr Step Back",
      imageUrl:
          "https://images.unsplash.com/photo-1612349317150-e413f6a5b16d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80",
      specialities: ["General Wellness", "ADHD Specialist", "Mood Disorders"],
    ),
    Therapist(
      name: "Dr Chase R.",
      imageUrl:
          "https://images.unsplash.com/photo-1594824476967-48c8b964273f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80",
      specialities: ["General Wellness", "ADHD Specialist", "Mood Disorders"],
    ),
    Therapist(
      name: "Dr Flex Onu",
      imageUrl:
          "https://images.unsplash.com/photo-1559839734-2b71ea197ec2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80",
      specialities: ["General Wellness", "ADHD Specialist", "Mood Disorders"],
    ),
    Therapist(
      name: "Dr Katz",
      imageUrl:
          "https://images.unsplash.com/photo-1622902046580-2b47f47f5471?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80",
      specialities: ["General Wellness", "ADHD Specialist", "Mood Disorders"],
    ),
    Therapist(
      name: "Dr Green Beenie Master",
      imageUrl:
          "https://images.unsplash.com/photo-1622253692010-333f2da6031d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=464&q=80",
      specialities: ["General Wellness", "ADHD Specialist", "Mood Disorders"],
    ),
    Therapist(
      name: "Dr Moody Frank",
      imageUrl:
          "https://images.unsplash.com/photo-1642050923713-c48db6ea4bec?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80",
      specialities: ["General Wellness", "ADHD Specialist", "Mood Disorders"],
    ),
  ];

  List<String> _choiceLabels = [
    "All",
    "ADHD",
    "General Wellness",
    "Mood Disorder"
  ];
  List<bool> _choiceStates = [true, false, false, false];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            decoration: InputDecoration(
              hintText: "Search name or expertise",
              contentPadding: EdgeInsets.symmetric(horizontal: 8),
              prefixIcon: Icon(
                FontAwesomeIcons.magnifyingGlass,
                color: activeBottomNavBarColor,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(32),
                borderSide: BorderSide(color: activeBottomNavBarColor),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(32),
                borderSide: BorderSide(color: activeBottomNavBarColor),
              ),
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(vertical: 8),
            child: Row(
              children: List.generate(
                _choiceLabels.length,
                (index) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal:4.0),
                  child: ChoiceChip(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    side: BorderSide(color: activeBottomNavBarColor),
                    backgroundColor: Colors.transparent,
                    selectedColor: activeBottomNavBarColor,
                    label: Text(
                      _choiceLabels[index],
                      style: TextStyle(
                        color: _choiceStates[index] ? Colors.white : Colors.black,
                      ),
                    ),
                    onSelected: (value) {
                      setState(() {
                        _choiceStates[index] = value;
                      });
                    },
                    selected: _choiceStates[index],
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _therapists.length,
              itemBuilder: (ctx, index) => TherapistItem(_therapists[index]),
            ),
          ),
        ],
      ),
    );
  }
}

/*
Center(
      child: Material(
        color: Colors.deepPurpleAccent,
        borderRadius: BorderRadius.circular(18),
        child: InkWell(
          onTap: () {},
          borderRadius: BorderRadius.circular(18),
          child: Container(
            width: 150,
            height: 100,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.red, width: 2),
              borderRadius: BorderRadius.circular(18),
              color: Colors.transparent,
            ),
            clipBehavior: Clip.hardEdge,
            child: const Center(
              child: Text(
                "A box container",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    )
 */
