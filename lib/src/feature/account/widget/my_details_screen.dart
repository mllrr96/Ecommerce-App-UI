import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:sizzle_starter/src/core/utils/extensions/context_extension.dart';
import 'package:sizzle_starter/src/core/widget/appbar/e_app_bar.dart';

@RoutePage()
class MyDetailsScreen extends StatelessWidget {
  const MyDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: context.unfocus,
        child: Scaffold(
          bottomNavigationBar: Container(
            margin: const EdgeInsets.fromLTRB(24, 0, 24, 20),
            child: ShadButton(
              width: double.infinity,
              height: 54,
              onPressed: context.maybePop,
              child: const Text('Submit'),
            ),
          ),
          appBar: const EAppBar(title: 'My Details'),
          body: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            children: [
              const Divider(thickness: 2),
              ShadInputFormField(
                label: const Text('Full Name'),
                suffix: const SizedBox(height: 52),
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
              ),
              const Gap(10),
              ShadInputFormField(
                label: const Text('Email'),
                suffix: const SizedBox(height: 52),
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
              ),
              const Gap(10),
              const Text('Date of Birth'),
              const Gap(10),
              const ShadDatePicker(
                closeOnSelection: true,
                height: 54,
              ),
              const Gap(10),
              const Text('Gender'),
              const Gap(10),
              ShadSelect<String>(
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 12),
                placeholder: const Text('Gender'),
                options: const [
                  ShadOption(
                    value: 'M',
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 12),
                    child: Text('Male'),
                  ),
                  Gap(8),
                  ShadOption(
                    value: 'F',
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 12),
                    child: Text('Female'),
                  ),
                ],
                selectedOptionBuilder: (context, value) =>
                    Text(value == 'M' ? 'Male' : 'Female'),
              ),
              const Gap(10),
              ShadInputFormField(
                label: const Text('Phone Number'),
                suffix: const SizedBox(height: 52),
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
              ),
            ],
          ),
        ),
      );
}
