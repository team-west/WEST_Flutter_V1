import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:west/core/provider/state/gender_type.dart';

final genderSelectProvider = StateProvider<GenderType>((ref) => GenderType.none);
