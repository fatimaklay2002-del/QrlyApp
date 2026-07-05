import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/widgets/section_header_widget.dart';
import '../../logic/history_cubit.dart';
import '../../logic/history_state.dart';
import '../widgets/custom_filter_tabs.dart';
import '../widgets/history_empty_state.dart';
import '../widgets/history_grouped_list.dart';

class ScanHistoryView extends StatelessWidget {
  const ScanHistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<HistoryCubit, HistoryState>(
          builder: (context, state) {
            final items = state.filteredItems;

            return SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SectionHeader(
                    leadingIcon: SvgPicture.asset(
                      'assets/images/history_icon_active.svg',
                      width: 24,
                      height: 24,
                    ),
                    title: 'History',
                  ),
                  const SizedBox(height: 24),
                  CustomFilterTabs(
                    onTabSelected: (index) => context
                        .read<HistoryCubit>()
                        .changeFilter(HistoryFilter.values[index]),
                  ),
                  const SizedBox(height: 20),
                  if (items.isEmpty)
                    const HistoryEmptyState()
                  else
                    ...buildGroupedHistoryItems(context, items),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
