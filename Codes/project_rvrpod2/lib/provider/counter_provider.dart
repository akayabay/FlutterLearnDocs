import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_rvrpod2/models/counter_model.dart';

final counterProvider = ChangeNotifierProvider<CounterModel>((ref) => CounterModel(counter: 0));
