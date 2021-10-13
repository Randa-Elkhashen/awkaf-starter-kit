import 'package:flutter/material.dart';
import 'package:flutter_app/view_models/topic.dart';
import 'package:flutter_app/views/style/app_style.dart';
import 'package:flutter_app/views/widgets/loaders/image_loader.dart';
import 'package:intl/intl.dart' as intl;
import 'package:timeline_tile/timeline_tile.dart';
class TimeLineItem extends StatelessWidget {

  final int index;
  final Topic topic;
  final Function(Topic)? onPressed;

  const TimeLineItem({
    Key? key,
    required this.topic,
    this.onPressed,
    required this.index
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool _shift = index%2 == 0;
    final _child = TimeLineChild(
      topic: topic,
      onPressed: onPressed,
      shift: _shift,
    );
    return TimelineTile(
      alignment: TimelineAlign.center,
      afterLineStyle: LineStyle(
        color: Theme.of(context).colorScheme.primary,
        thickness: 1 * AppStyle.scaleFactor
      ),
      beforeLineStyle: LineStyle(
          color: Theme.of(context).colorScheme.primary,
          thickness: 1 * AppStyle.scaleFactor
      ),
      indicatorStyle: IndicatorStyle(
        color: Theme.of(context).colorScheme.primary,
        iconStyle: IconStyle(
          iconData: Icons.circle,
          fontSize: 18,
          color: Theme.of(context).colorScheme.onPrimary
        )
      ),
      startChild: _shift ? _child : null,
      endChild: _shift ? null : _child,
    );
  }
}

class TimeLineChild extends StatefulWidget {

  final Topic topic;
  final bool shift;
  final Function(Topic)? onPressed;

  const TimeLineChild({
    Key? key,
    required this.topic,
    required this.onPressed,
    required this.shift,
  }) : super(key: key);

  @override
  State<TimeLineChild> createState() => _TimeLineChildState();
}

class _TimeLineChildState extends State<TimeLineChild>
    with TickerProviderStateMixin  {

  late AnimationController _animationController;
  late Animation<Offset> _offsetAnimation;
  late Animation<double> _doubleAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this
    );

    _offsetAnimation = Tween<Offset>(
      begin:  widget.shift
          ? const Offset(-1.0, 0.5)
          : const Offset(1.0, 0.5),
      end: const Offset(0, .5),
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeOut,
    ));

    _doubleAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeOut,
    );

    _animationController.forward();
  }
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (BuildContext context, Widget? child) {
        return SlideTransition(
          position: _offsetAnimation,
          child: FadeTransition(
            opacity: _doubleAnimation,
            child: SizedBox(
              height: 140 * AppStyle.scaleFactor,
              child: AbsorbPointer(
                child: TextButton(
                  style:TextButton.styleFrom(
                    padding: EdgeInsets.zero
                  ) ,
                  onPressed: (){
                    widget.onPressed!(widget.topic);
                  },
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    textDirection: widget.shift
                      ? TextDirection.rtl
                      : TextDirection.ltr,
                    children: [
                      Container(
                        height: 1 * AppStyle.scaleFactor,
                        width: 18 * AppStyle.scaleFactor,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: widget.shift
                              ? CrossAxisAlignment.end
                              : CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              padding: EdgeInsets.all(2 * AppStyle.scaleFactor),
                              decoration: BoxDecoration(
                                color: Theme.of(context).colorScheme.primary,
                                border: Border(
                                  top: BorderSide(
                                    color: Theme.of(context).colorScheme.primary,
                                    width: 1.0 * AppStyle.scaleFactor
                                  )
                                )
                              ),
                              child: Text(
                                intl.DateFormat.yMMMMd().format(widget.topic.dateTime!),
                                style: Theme.of(context).textTheme.caption?.copyWith(
                                  color: Theme.of(context).colorScheme.onPrimary,
                                ),
                              ),
                            ),
                            Column(
                              children: [
                                AspectRatio(
                                  aspectRatio: 16/9,
                                  child: ImageLoader(
                                    url: widget.topic.imageUrl,
                                  ),
                                ),
                                Container(
                                  width: double.infinity,
                                  alignment: Alignment.center,
                                  padding: EdgeInsets.all(4 * AppStyle.scaleFactor),
                                  decoration: BoxDecoration(
                                    color: Theme.of(context).colorScheme.background,
                                  ),
                                  child: Text(
                                    widget.topic.title,
                                    style: Theme.of(context).textTheme.bodyText1,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                ),
              ),
            ),
          ),
        );
      }
    );
  }
}

