import 'package:flutter/material.dart';
class BloCSetting extends State {
  Map<String, State> _stateMap =
  {}; //key holds the stateID and the value holds the state
  rebuildWidgets(
      {VoidCallback setState, List<State> states, List<String> ids}) {
    if (states != null) {
      states.forEach((s) {
        if (s != null && s.mounted) s.setState(setState ?? () {});
      });
    }
    if (ids != null) {
      ids.forEach(
            (s) {
          final State ss = _stateMap[s];
          if (ss != null && ss.mounted) ss.setState(setState ?? () {});
        },
      );
    }
  }
  @override
  Widget build(BuildContext context) {
    print(
        "This build function will never be called. it has to be overriden here because State interface requires this");
    return null;
  }
}
typedef _StateBuildertype = Widget Function(State state);
class StatesBuilder extends StatefulWidget {
  @required
  final _StateBuildertype builder;
  final void Function(State state) initState, dispose, didChangeDependencies;
  final void Function(StatesBuilder oldWidget, State state) didUpdateWidget;
  final String stateID;
  final List<BloCSetting> blocs;
  StatesBuilder({
    Key key,
    this.stateID,
    this.blocs,
    this.builder,
    this.initState,
    this.dispose,
    this.didChangeDependencies,
    this.didUpdateWidget,
  })  : assert(builder != null),
        assert(stateID == null ||
            blocs != null), // blocs must not be null if a stateID is given
        super(key: key);
  @override
  _StatesBuilderState createState() => _StatesBuilderState();
}
class _StatesBuilderState extends State<StatesBuilder> {
  @override
  void initState() {
    super.initState();
    if (widget.stateID != null && widget.stateID != "") {
      if (widget.blocs != null) {
        widget.blocs.forEach(
              (b) {
            if (b == null) return;
            b._stateMap[widget.stateID] = this;
          },
        );
      }
    }
    if (widget.initState != null) widget.initState(this);
  }
  @override
  void dispose() {
    if (widget.stateID != null && widget.stateID != "") {
      if (widget.blocs != null) {
        widget.blocs.forEach(
              (b) {
            if (b == null) return;
            if (b._stateMap[widget.stateID].hashCode == this.hashCode) {
              b._stateMap.remove(widget.stateID);
            }
          },
        );
      }
    }
    if (widget.dispose != null) widget.dispose(this);
    super.dispose();
  }
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (widget.didChangeDependencies != null)
      widget.didChangeDependencies(this);
  }
  @override
  void didUpdateWidget(StatesBuilder oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.didUpdateWidget != null) widget.didUpdateWidget(oldWidget, this);
  }
  @override
  Widget build(BuildContext context) {
    return widget.builder(this);
  }
}