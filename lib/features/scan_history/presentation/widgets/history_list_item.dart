import 'package:flutter/material.dart';


import '../../../../core/models/scan_history_model.dart';
import '../../../../core/theme/app_text_style.dart';
import '../../../../core/utils/app_color.dart';
import '../../../../core/utils/date_time_helper.dart';

class HistoryListItem extends StatelessWidget {
  final QrHistoryItem item;
  final VoidCallback? onTap;
 
  const HistoryListItem({super.key, required this.item, this.onTap});
 
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: AppColor.cardBackground,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            Container(
              width: 44,
              height: 44,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: AppColor.altBackground,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                item.type == HistoryItemType.scanned
                    ? Icons.qr_code_scanner_rounded
                    : Icons.add_box_outlined,
                color: AppColor.iconMuted,
                size: 22,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.content,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyles.inter500Size14.copyWith(
                      color: AppColor.secondaryText,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    formatRelativeTime(item.timestamp), 
                    style: AppTextStyles.inter600Size12.copyWith(
                      color: AppColor.mutedText,
                    ),
                  ),
                ],
              ),
            ),
            Icon(Icons.chevron_right_rounded, color: AppColor.mutedText),
          ],
        ),
      ),
    );
  }
}