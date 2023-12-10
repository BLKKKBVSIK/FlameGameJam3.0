import 'package:injectable/injectable.dart';
import 'package:stacked/stacked.dart';

import '../ui/game/models/memory_card.dart';

@lazySingleton
class GameService with ListenableServiceMixin {
  final ReactiveValue<double> _volume = ReactiveValue<double>(1);
  double get volume => _volume.value;

  final ReactiveValue<List<MemoryCard>> _memoryCards = ReactiveValue<List<MemoryCard>>([]);
  List<MemoryCard> get memoryCards => _memoryCards.value;

  // set card in List
  void setCard(MemoryCard card) {
    if (_memoryCards.value.length == 2) {
      _memoryCards.value.clear();
      print("Two cards in list");
    }
    _memoryCards.value.add(card);
    notifyListeners();
  }
}
