import 'package:amorium/repository/home/home_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final homeControllerProvider = Provider((ref) {
  final homeRepository = ref.watch(homeRepositoryProvider);
  return HomeController(homeRepository: homeRepository, ref: ref);
});

class HomeController {
  final HomeRepository homeRepository;
  final ProviderRef ref;

  HomeController({
    required this.homeRepository,
    required this.ref,
  });
}
