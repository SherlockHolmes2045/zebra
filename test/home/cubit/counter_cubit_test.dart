import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:zebra/home/cubit/home_cubit.dart';

void main() {
  group('CounterCubit', () {
    test('initial state is 0', () {
      expect(HomeCubit().state, equals(0));
    });

    blocTest<HomeCubit, int>(
      'emits [1] when increment is called',
      build: HomeCubit.new,
      act: (cubit) => cubit.increment(),
      expect: () => [equals(1)],
    );

    blocTest<HomeCubit, int>(
      'emits [-1] when decrement is called',
      build: HomeCubit.new,
      act: (cubit) => cubit.decrement(),
      expect: () => [equals(-1)],
    );
  });
}
