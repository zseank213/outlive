import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:Eiger/lib.dart';

class PullToRefresh extends StatefulWidget {
  final Widget child;
  final RefreshController refreshController;
  final void Function() onRefresh;
  final void Function() onLoading;
  final Color indicatorColor;
  final Color textColor;

  const PullToRefresh({
    Key? key,
    required this.child,
    required this.refreshController,
    required this.onRefresh,
    required this.onLoading,
    required this.indicatorColor,
    required this.textColor,
  }) : super(key: key);

  @override
  State<PullToRefresh> createState() => _PullToRefreshState();
}

class _PullToRefreshState extends State<PullToRefresh> {
  void _onRefresh() async {
    // _getProfile.getAuth();
    // _listAddress.getAuth();
    // _slider.getAuth();
    // _rekomendasiJasa.getAuth(
    //     data: AuthRekomendasiJasa(
    //       sort_by: "promote_at",
    //       sort_type: "desc",
    //     ));
  }

  void _onLoading() async {
    // monitor network fetch
    await Future.delayed(
      const Duration(milliseconds: 1000),
    );
    // if failed,use loadFailed(),if no data return,use LoadNodata()
    if (mounted) setState(() {});
    widget.refreshController.loadComplete();
  }

  @override
  Widget build(BuildContext context) {
    return SmartRefresher(
      controller: widget.refreshController,
      enablePullDown: true,
      physics: ClampingScrollPhysics(),
      // enablePullUp: true,
      onRefresh: widget.onRefresh,
      onLoading: widget.onLoading,
      header: CustomHeader(
        builder: (BuildContext context, RefreshStatus? mode) {
          Widget body;
          if (mode == RefreshStatus.idle) {
            body = Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.arrow_downward,
                  size: 15,
                  color: widget.textColor,
                ),
                AppDimens.horizontalSpace8,
                Text(
                  "Pull Down to Refresh",
                  style: textSmall(color: widget.textColor),
                ),
              ],
            );
          } else if (mode == RefreshStatus.refreshing) {
            body = CupertinoActivityIndicator(
                radius: 15.0, color: widget.indicatorColor);
          } else if (mode == RefreshStatus.failed) {
            body = Text("");
          } else if (mode == RefreshStatus.canRefresh) {
            body = Text(
              "Release to refresh",
              style: textSmall(color: widget.textColor),
            );
          } else {
            body = Text("");
          }
          return Container(
            height: 55.0,
            child: Center(child: body),
          );
        },
      ),
      child: widget.child,
    );
  }
}
