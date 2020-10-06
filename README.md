# overlayer

Lightweight utility for put addition overlay widget upon existing widget.

## Getting Started

```
@override
Widget build(BuildContext context) {
  return BlocBuilder<YourBloc, YourState>(builder: (context, state) {
    ...
    if (state is LoadingState) {
      return currentWidget.overlaid(Center(child: CircularProgressIndicator()));
    }
    ...
  });
}
```