import 'card_item.dart';

class Game {
  int gridSize;
  int index;
  List<CardItem> cards = [];
  bool gameOver = false;
  int time = 0;

  Game({required this.gridSize, this.index=0}) {
    generateCards();
  }

  void generateCards() {
    cards = [];
    for (int i = index; i < index+3; i++) {
      int cardValue = i + 1;
      cards.add(CardItem(cardValue, state: CardState.hidden));
      cards.add(CardItem(cardValue, state: CardState.hidden));
    }
    cards.shuffle();
  }

  void resetGame() {
    generateCards();
    gameOver = false;
    time = 0;
  }

  void onCardPressed(int index) {
    cards[index].state = CardState.visible;
    List<int> selectedCardIndexes = _getSelectedCardIndexes();
    if (selectedCardIndexes.length == 2) {
      CardItem card1 = cards[selectedCardIndexes[0]];
      CardItem card2 = cards[selectedCardIndexes[1]];

      if (card1.value == card2.value) {
        card1.state = CardState.guessed;
        card2.state = CardState.guessed;

        gameOver = _isGameOver();
      } else {
        Future.delayed(
          const Duration(milliseconds: 1000),
          () {
            card1.state = CardState.hidden;
            card2.state = CardState.hidden;
          },
        );
      }
    }
  }

  List<int> _getSelectedCardIndexes() {
    List<int> selectedCardIndexes = [];
    for (int i = 0; i < cards.length; i++) {
      if (cards[i].state == CardState.visible) {
        selectedCardIndexes.add(i);
      }
    }
    return selectedCardIndexes;
  }

  bool _isGameOver() {
    for (int i = 0; i < cards.length; i++) {
      if (cards[i].state == CardState.hidden) {
        return false;
      }
    }
    return true;
  }
}
