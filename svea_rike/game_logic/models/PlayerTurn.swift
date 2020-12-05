//
//  PlayerTurn.swift
//  svea_rike
//
//  Created by Karl Söderberg on 2020-11-23.
//

import Foundation
import Combine

class PlayerTurn: ObservableObject, Equatable, Hashable {
    static func == (lhs: PlayerTurn, rhs: PlayerTurn) -> Bool {
        lhs.hashValue == rhs.hashValue
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(eventCard)
        hasher.combine(specialization)
        hasher.combine(incomeSource)
        hasher.combine(purchasedHistoryCard)
        hasher.combine(purchasedProvince)
        hasher.combine(skippedProvincePurchase)
        hasher.combine(collectedIncome)
        hasher.combine(paidTroopSupport)
        hasher.combine(addedMerchant)
        hasher.combine(hasfinished)
        hasher.combine(stage)
    }
    
    
    var cancellable = Set<AnyCancellable>()
    
    @Published var eventCard: EventCard? = nil
    
    @Published var specialization: Specialization? = nil
    
    @Published var incomeSource: Specialization? = nil
    
    @Published var purchasedHistoryCard: HistoryCard? = nil
    
    @Published var skippedHistoryCardPurchase = false
    
    @Published var purchasedProvince: Province? = nil
    
    @Published var skippedProvincePurchase = false
    
    @Published var collectedIncome: Int? = nil
    
    @Published var paidTroopSupport: Int? = nil
    
    @Published var addedMerchant: Country? = nil
    
    @Published var hasfinished = false
    
    @Published var stage: PlayerTurnStage = .drawingCard {
        didSet {
            print(stage.display)
        }
    }
    
    init() {
        
        $eventCard
            .receive(on: RunLoop.main)
            .removeDuplicates()
            .map(recalcalculateStage(_:))
            .assign(to: \.stage, on: self)
            .store(in: &cancellable)
        
        $specialization
            .receive(on: RunLoop.main)
            .removeDuplicates()
            .map(recalcalculateStage(_:))
            .assign(to: \.stage, on: self)
            .store(in: &cancellable)
        
        $incomeSource
            .receive(on: RunLoop.main)
            .removeDuplicates()
            .map(recalcalculateStage(_:))
            .assign(to: \.stage, on: self)
            .store(in: &cancellable)
        
        $purchasedHistoryCard
            .receive(on: RunLoop.main)
            .removeDuplicates()
            .map(recalcalculateStage(_:))
            .assign(to: \.stage, on: self)
            .store(in: &cancellable)
        
        $skippedHistoryCardPurchase
            .receive(on: RunLoop.main)
            .removeDuplicates()
            .map(recalcalculateStage(_:))
            .assign(to: \.stage, on: self)
            .store(in: &cancellable)
        
        $purchasedProvince
            .receive(on: RunLoop.main)
            .removeDuplicates()
            .map(recalcalculateStage(_:))
            .assign(to: \.stage, on: self)
            .store(in: &cancellable)
        
        $skippedProvincePurchase
            .receive(on: RunLoop.main)
            .removeDuplicates()
            .map(recalcalculateStage(_:))
            .assign(to: \.stage, on: self)
            .store(in: &cancellable)
        
        $collectedIncome
            .receive(on: RunLoop.main)
            .removeDuplicates()
            .map(recalcalculateStage(_:))
            .assign(to: \.stage, on: self)
            .store(in: &cancellable)
        
        $paidTroopSupport
            .receive(on: RunLoop.main)
            .removeDuplicates()
            .map(recalcalculateStage(_:))
            .assign(to: \.stage, on: self)
            .store(in: &cancellable)
        
        $addedMerchant
            .receive(on: RunLoop.main)
            .removeDuplicates()
            .map(recalcalculateStage(_:))
            .assign(to: \.stage, on: self)
            .store(in: &cancellable)
        
        $hasfinished
            .receive(on: RunLoop.main)
            .removeDuplicates()
            .map(recalcalculateStage(_:))
            .assign(to: \.stage, on: self)
            .store(in: &cancellable)
    }
    
    deinit {
        cancellable.forEach { $0.cancel() }
    }
    
    
    private func recalcalculateStage(_ : Any) -> PlayerTurnStage {
        
        if eventCard == nil {
            return .drawingCard
        }
        
        guard let specialization = specialization else {
            return .selectingSpecialization
        }
        
        if specialization == .trade {
            
            if addedMerchant == nil {
                return .placingMerchant
            }
            
            guard let collectedIncome = collectedIncome else {
                return .collectingTradeIncome
            }
            
            guard let paidTroopSupport = paidTroopSupport else {
                return .payingTroops
            }
            
        }
        
        if specialization == .farming {
            
            guard let collectedIncome = collectedIncome else {
                return .collectionFarmingIncome
            }
            
            if purchasedProvince == nil, skippedProvincePurchase == false {
                return .purchasingProvince
            }
            
        }
        
        if specialization == .scienceAndCulture {
            
            guard let incomeSource = incomeSource else {
                return .selectingIncomeSource
            }
            
            if collectedIncome == nil {
                if incomeSource == .farming {
                    return .collectionFarmingIncome
                } else {
                    return .collectingTradeIncome
                }
            }
            
            guard let paidTroopSupport = paidTroopSupport else {
                return .payingTroops
            }
            
            if purchasedHistoryCard == nil, skippedHistoryCardPurchase == false {
                return .purchasingHistoryCard
            }
            
        }
        
        if !hasfinished {
            return .confirmingFinished
        }
        
        return .done
    }
}


enum PlayerTurnStage: Int, Equatable {
    
    case drawingCard
    case selectingSpecialization
    case selectingIncomeSource
    case placingMerchant
    case collectingTradeIncome
    case collectionFarmingIncome
    case purchasingProvince
    case purchasingHistoryCard
    case payingTroops
    case confirmingFinished
    case done
    
    var display: String {
        switch self {
        case .drawingCard:
            return "Dra ett händelsekort"
        case .selectingSpecialization:
            return "Välj verksamhet"
        case .selectingIncomeSource:
            return "Inkassera inkomster från Handel ELLER Jordbruk"
        case .placingMerchant:
            return "Ställ ut eller flytta en Handelsman"
        case .collectingTradeIncome:
            return "Inkassera inkomster för Handel och Drottningar"
        case .collectionFarmingIncome:
            return "Inkassera inkomster från Jordbruk och Slott"
        case .purchasingProvince:
            return "Köp ett ledigt Förläningskort"
        case .purchasingHistoryCard:
            return "Köp ett Historiekort"
        case .payingTroops:
            return "Betala truppunderhåll"
        case .confirmingFinished:
            return "Är du färdig?"
        case .done:
            return "Turen är avslutad"
        }
    }
}

