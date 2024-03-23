import 'package:flutter/material.dart';
import 'package:movies_routee/features/browse/view/presentation/widgets/browse_grid.dart';


class BrowseTab extends StatelessWidget {
  const BrowseTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(padding: const EdgeInsets.all(20),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Browse Category',
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 25),
          ),
          const Expanded(child: BrowseGrid()),
        ],
      ),
    );
  }
}
