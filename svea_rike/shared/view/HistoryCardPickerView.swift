import SwiftUI
import Resources
import Models
import Common

struct HistoryCardPickerView: View {
    
    let cards: [HistoryCard]
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

    var body: some View {
        VStack {
            row(cards: Array(cards.prefix(2)))
            row(cards: Array(cards.dropFirst(2)))
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
                            onPurchase(card)
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
        HistoryCardPickerView(cards: [.anders_celsius, .bergsbruk, .carl_michael_bellman, .conrad_von_pyhy], onPurchase: {_ in })
    }
}
