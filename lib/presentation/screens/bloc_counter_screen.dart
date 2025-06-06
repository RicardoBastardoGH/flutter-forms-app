import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forms_app/presentation/blocs/counter_bloc/counter_bloc.dart';

class BlocCounterScreen extends StatelessWidget {
  const BlocCounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => CounterBloc(),
      child: BlocCounterView()
    );
  }
}

class BlocCounterView extends StatelessWidget {
  const BlocCounterView({
    super.key,
  });

  void increaseCounterBy( BuildContext context, [int value = 1] ){
    // context.read<CounterBloc>().add( CounterIncreased(value));
    context.read<CounterBloc>().increaseBy(value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: context.select((CounterBloc bloc) {
          return Text('Bloc Counter ${bloc.state.transactionCount}');
        }) ,
        actions: [
          IconButton(
            onPressed: (){
              context.read<CounterBloc>().add(CounterReset());
              // context.read<CounterBloc>().add( CounterIncreased(value));
            }, 
            icon: Icon (Icons.refresh_outlined)
          )
        ],
      ),
      body: Center(
        child: context.select(
          (CounterBloc counterBLoc) => Text('Counter value: ${counterBLoc.state.counter}')) 
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: '1',
            child: const Text('+3'),
            onPressed: (){
              increaseCounterBy(context, 3);
            }
          ),
    
          const SizedBox(height: 10,),
          
          FloatingActionButton(
            heroTag: '2',
            child: const Text('+2'),
            onPressed: (){
              increaseCounterBy(context, 2);
    
            }
          ),
    
          const SizedBox(height: 10,),
    
          FloatingActionButton(
            heroTag: '3',
            child: const Text('+1'),
            onPressed: (){
              increaseCounterBy(context);
    
            }
          ),
    
        ]
      ),
    );
  }
}