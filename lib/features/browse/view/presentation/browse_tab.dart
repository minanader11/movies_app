import 'package:flutter/material.dart';
import 'package:movies_routee/features/browse/view/presentation/widgets/browse_grid.dart';


class BrowseTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(padding: EdgeInsets.all(20),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Browse Category',
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 25),
          ),
          Expanded(child: BrowseGrid()),
        ],
      ),
    );
  }
}
