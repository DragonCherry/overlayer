# overlayer

Lightweight utility for put addition overlay widget upon existing widget.

## Getting Started

```
@override
Widget build(BuildContext context) {
  return BlocBuilder<YourBloc, YourState>(builder: (context, state) {
    ...
    // to show indicator
    if (state is LoadingState) {
      return currentWidget.overlaid(child: CircularProgressIndicator());
    }
    // to show indicator on dim
    if (state is LoadingState) {
      return currentWidget.dimmed(child: CircularProgressIndicator()));
    }
    ...
  });
}
```