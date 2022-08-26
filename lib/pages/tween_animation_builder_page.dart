import 'package:flutter/material.dart';

class TweenAnimationBuilderPage extends StatefulWidget {
  const TweenAnimationBuilderPage({Key? key}) : super(key: key);

  @override
  State<TweenAnimationBuilderPage> createState() =>
      _TweenAnimationBuilderPageState();
}

class _TweenAnimationBuilderPageState extends State<TweenAnimationBuilderPage> {
  double _hue = 0.0;

  @override
  Widget build(BuildContext context) {
    String title = ModalRoute.of(context)?.settings.arguments.toString() ?? '';

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AnimatedContainer(
              color: HSVColor.fromAHSV(1.0, _hue, 1.0, 1.0).toColor(),
              duration: const Duration(milliseconds: 1500),
              width: 200,
              height: 200,
              child: const Center(child: Text('AnimatedContainer')),
            ),
            const SizedBox(height: 48.0),
            TweenAnimationBuilder<double>(
              tween: Tween<double>(begin: 0.0, end: _hue),
              duration: const Duration(milliseconds: 1500),
              builder: (context, hue, child) {
                return Container(
                  height: 200,
                  width: 200,
                  color: HSVColor.fromAHSV(1.0, hue, 1.0, 1.0).toColor(),
                  child: child,
                );
              },
              child: const Center(child: Text("This text doesn't rebuild")),
            ),
            const SizedBox(height: 20.0),
            Container(
              height: 40,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    for (int i = 0; i <= 360; ++i)
                      HSVColor.fromAHSV(1.0, i.toDouble(), 1.0, 1.0).toColor(),
                  ],
                  stops: [
                    // stops chạy nhận giá trị từ 0.0 đến 1.0
                    // nếu stop not null thì số lượng phần tử của stop sẽ phải bằng số lượng phần tử của colors
                    // Giả sử ta có mảng gồm 10 màu, ta muốn hiển thị 10 màu đó đều nhau
                    // thì stop sẽ có dạng: 0.0, 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1.0
                    // => Áp dụng với 360 màu:
                    for (int i = 0; i <= 360; ++i) i.toDouble() / 360,
                  ],
                ),
              ),
            ),
            Slider.adaptive(
              min: 0.0,
              max: 360.0,
              value: _hue,
              onChanged: (double value) {
                setState(() {
                  _hue = value;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
