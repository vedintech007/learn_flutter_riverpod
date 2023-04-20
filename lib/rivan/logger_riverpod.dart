import 'package:hooks_riverpod/hooks_riverpod.dart';

class LoggerRiverpod extends ProviderObserver {
  @override
  void didUpdateProvider(
    ProviderBase provider,
    Object? previousValue,
    Object? newValue,
    ProviderContainer container,
  ) {
    print('$provider $previousValue $newValue $container');
  }
}
