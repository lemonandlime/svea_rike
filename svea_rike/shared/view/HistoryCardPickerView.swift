import SwiftUI
import Resources
import Models
import Common
import GameLogic

struct HistoryCardPickerView: View {

    @ObservedObject var game: Game

    let onPurchase: (HistoryCard) -> Void

    @MainActor
    @State
    private var selected: HistoryCard?
    @MainActor
    @State
    private var previouslySelected: HistoryCard?

    @MainActor
    private func didTap(card: HistoryCard) {
        if selected == card {
            selected = nil
        } else {
            previouslySelected = card
            selected = card
        }
    }

    @MainActor
    private func purchase(card: HistoryCard) {
        onPurchase(card)
        selected = nil
        previouslySelected = nil
    }

    var body: some View {
        VStack {
            row(cards: Array(game.historyCards.prefix(2)))
            row(cards: Array(game.historyCards.dropFirst(2)))
        }
        .animation(.easeInOut, value: selected)
    }

    @MainActor
    @ViewBuilder func row(cards: [HistoryCard]) -> some View {
        if let cards = cards.nilIfEmpty {
            HStack {
                ForEach(cards.ifNotNilonly(selected)) { card in
                    VStack {
                        card.image.swiftUIImage
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .onTapGesture { didTap(card: card) }

                        Button("Köp historiekort") {
                            purchase(card: card)
                        }
                    }
                    .zIndex((card == (previouslySelected)) ? 2 : 1)
                }
            }
            .zIndex(cards.contains(previouslySelected) ? 2 : 1)
        }
    }
}

private extension [HistoryCard] {
    func ifNotNilonly(_ card: HistoryCard?) -> [HistoryCard] {
        guard let card else { return self }

        return Array(filter { $0 == card })
    }
}

struct HistoryCardPickerView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryCardPickerView(game: try! GameEngine.createGame(playerNames: ["Kalle"]), onPurchase: {_ in })
    }
}
