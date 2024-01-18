import 'package:flutter/cupertino.dart';
import 'package:pet_adoption_app/widgets/type_radio_tile.dart';
import '/core/constants/app_colors.dart';
import '/core/constants/constants.dart';

class TypePicker extends StatelessWidget {
  const TypePicker({
    Key? key,
    required this.postType,
    required this.onChanged,
  }) : super(key: key);

  final String? postType;
  final Function(String? value) onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: Constants.defaultPadding,
      decoration: BoxDecoration(
        color: AppColors.darkWhiteColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          TypeRadioTile(
            title: 'Lost',
            value: 'lost',
            selectedValue: postType,
            onChanged: onChanged,
          ),
          TypeRadioTile(
            title: 'Found',
            value: 'found',
            selectedValue: postType,
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }
}
