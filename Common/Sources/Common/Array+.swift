import Foundation

public extension Array {
    func object(at index: Int) -> Element? {
        guard endIndex < index else {
            return nil
        }

        return self[index]
    }

    var nilIfEmpty: Self? {
        if self.isEmpty { return nil }
        return self
    }

    mutating func popLast(_ number: Int = 1) -> [Element] {
        var elements = [Element]()

        repeat {
            if let element = popLast() {
                elements.append(element)
            }
        } while elements.count < number && !isEmpty

        return elements
    }
}

public extension Array where Element: Equatable {
    func contains(_ element: Element?) -> Bool {
        guard let element else { return false }
        return self.contains { $0 == element }
    }
}
