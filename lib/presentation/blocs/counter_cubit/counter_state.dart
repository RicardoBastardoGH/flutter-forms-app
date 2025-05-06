part of 'counter_cubit.dart';

class CounterState extends Equatable {

  final int counter;
  final int transaccionCount;

  const CounterState({
    this.counter = 0, 
    this.transaccionCount = 0
  });

  // Creando un nuevo estado
  copyWith({
    int? counter,
    int? transaccionCount
  }) => CounterState(
    counter: counter ?? this.counter,
    transaccionCount: transaccionCount ?? this.transaccionCount,
  );
  
  @override
  List<Object> get props => [ counter, transaccionCount];

}