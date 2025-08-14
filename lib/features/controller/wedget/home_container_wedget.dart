import 'package:flutter/material.dart';
import 'package:coursa/features/controller/wedget/progress_container.dart';


class HomeContainer extends StatefulWidget {
  const HomeContainer({super.key,this.page, required this.file,required this.title,required this.image,required this.start,required this.end, this.onProgressUpdated,});

  final Widget? page; 
  final String file;
  final String title;
  final String image;
  final int start;
  final int end;
  final Future<void> Function()? onProgressUpdated;


  @override
  State<HomeContainer> createState() => _HomeContainerState();
}

class _HomeContainerState extends State<HomeContainer> {
  late int currentStart;
  late int currentEnd;

  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 1),
      child: InkWell(
 
  onTap: () async {
    if (widget.page != null) {
      final bool? updated = await Navigator.push<bool>(
        context,
        MaterialPageRoute(builder: (_) => widget.page!),
      );

      if (updated == true && mounted && widget.onProgressUpdated != null) {
      await widget.onProgressUpdated!();
    }
    }
  },
  child: ProgressContainer(
    containerGroub: {
      widget.title: {
        'centerimage': 'assets/images/${widget.image}',
        'start': widget.start,
        'end': widget.end,
      }
    },
  ),
)

    );
  }
}
