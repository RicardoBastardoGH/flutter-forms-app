part of 'counter_bloc.dart';

sealed class CounterEvent{
  const CounterEvent();

}

class CounterIncreased extends CounterEvent {
  final int value;
  const CounterIncreased(this.value);
}

// COunterReset
class CounterReset extends CounterEvent {}