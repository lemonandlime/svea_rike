// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

#if os(macOS)
    import AppKit
#elseif os(iOS)
    import UIKit
#elseif os(tvOS) || os(watchOS)
    import UIKit
#endif
#if canImport(SwiftUI)
    import SwiftUI
#endif

// Deprecated typealiases
@available(
    *,
    deprecated,
    renamed: "ImageAsset.Image",
    message: "This typealias will be removed in SwiftGen 7.0"
)
public typealias AssetImageTypeAlias = ImageAsset.Image

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Asset Catalogs

// swiftlint:disable identifier_name line_length nesting type_body_length type_name
public enum Asset {
    public enum Image {
        public enum HistoryCard {
            public static let andersCelsius = ImageAsset(name: "history_card/anders_celsius")
            public static let axelVonFersen = ImageAsset(name: "history_card/axel_von_fersen")
            public static let bergsbruk = ImageAsset(name: "history_card/bergsbruk")
            public static let carGustavArmfeldt =
                ImageAsset(name: "history_card/car_gustav_armfeldt")
            public static let carlMichaelBellman =
                ImageAsset(name: "history_card/carl_michael_bellman")
            public static let carlVonLinne = ImageAsset(name: "history_card/carl_von_linne")
            public static let conradVonPyhy = ImageAsset(name: "history_card/conrad_von_pyhy")
            public static let drots = ImageAsset(name: "history_card/drots")
            public static let emmanuelSwedenborg =
                ImageAsset(name: "history_card/emmanuel_swedenborg")
            public static let faluKoppargruva = ImageAsset(name: "history_card/falu_koppargruva")
            public static let finskaRytteriet = ImageAsset(name: "history_card/finska_rytteriet")
            public static let forbindelserMedHansan =
                ImageAsset(name: "history_card/forbindelser_med_hansan")
            public static let georgCarlVonDobeln =
                ImageAsset(name: "history_card/georg_carl_von_dobeln")
            public static let georgStiernheilm = ImageAsset(name: "history_card/georg_stiernheilm")
            public static let glimmingehus = ImageAsset(name: "history_card/glimmingehus")
            public static let gripsholm = ImageAsset(name: "history_card/gripsholm")
            public static let gustafHorn = ImageAsset(name: "history_card/gustaf_horn")
            public static let haga = ImageAsset(name: "history_card/haga")
            public static let hattpartiet = ImageAsset(name: "history_card/hattpartiet")
            public static let hedvidElionora = ImageAsset(name: "history_card/hedvid_elionora")
            public static let johanHenrikKjellgren =
                ImageAsset(name: "history_card/johan_henrik_kjellgren")
            public static let johannesBureus = ImageAsset(name: "history_card/johannes_bureus")
            public static let jonsJacobBerzelius =
                ImageAsset(name: "history_card/jons_jacob_berzelius")
            public static let jordreform = ImageAsset(name: "history_card/jordreform")
            public static let kanslipresident = ImageAsset(name: "history_card/kanslipresident")
            public static let karinMansdotter = ImageAsset(name: "history_card/karin_mansdotter")
            public static let karoliner = ImageAsset(name: "history_card/karoliner")
            public static let katarinaJagellonica =
                ImageAsset(name: "history_card/katarina_jagellonica")
            public static let kungligaSlottet = ImageAsset(name: "history_card/kungliga_slottet")
            public static let lennartTorstensson =
                ImageAsset(name: "history_card/lennart_torstensson")
            public static let lovisaUlrika = ImageAsset(name: "history_card/lovisa_ulrika")
            public static let manufakturer = ImageAsset(name: "history_card/manufakturer")
            public static let mariaElionora = ImageAsset(name: "history_card/maria_elionora")
            public static let olausMagnus = ImageAsset(name: "history_card/olaus_magnus")
            public static let olausPetri = ImageAsset(name: "history_card/olaus_petri")
            public static let orbyhus = ImageAsset(name: "history_card/orbyhus")
            public static let ostersjoflotta = ImageAsset(name: "history_card/ostersjoflotta")
            public static let ostindiskaKompaniet =
                ImageAsset(name: "history_card/ostindiska_kompaniet")
            public static let salaSilvergruva = ImageAsset(name: "history_card/sala_silvergruva")
            public static let skokloster = ImageAsset(name: "history_card/skokloster")
            public static let sofiaMagdalena = ImageAsset(name: "history_card/sofia_magdalena")
            public static let tychoBrahe = ImageAsset(name: "history_card/tycho_brahe")
            public static let tyskaKnektar = ImageAsset(name: "history_card/tyska_knektar")
            public static let vadstena = ImageAsset(name: "history_card/vadstena")
            public static let viborgsFastning = ImageAsset(name: "history_card/viborgs_fastning")
        }
    }
}

// swiftlint:enable identifier_name line_length nesting type_body_length type_name

// MARK: - Implementation Details

public struct ImageAsset {
    public fileprivate(set) var name: String

    #if os(macOS)
        public typealias Image = NSImage
    #elseif os(iOS) || os(tvOS) || os(watchOS)
        public typealias Image = UIImage
    #endif

    @available(iOS 8.0, tvOS 9.0, watchOS 2.0, macOS 10.7, *) public var image: Image {
        let bundle = BundleToken.bundle
        #if os(iOS) || os(tvOS)
            let image = Image(named: name, in: bundle, compatibleWith: nil)
        #elseif os(macOS)
            let name = NSImage.Name(name)
            let image = (bundle == .main) ? NSImage(named: name) : bundle.image(forResource: name)
        #elseif os(watchOS)
            let image = Image(named: name)
        #endif
        guard let result = image else {
            fatalError("Unable to load image asset named \(name).")
        }
        return result
    }

    #if os(iOS) || os(tvOS)
        @available(iOS 8.0, tvOS 9.0, *)
        public func image(compatibleWith traitCollection: UITraitCollection) -> Image {
            let bundle = BundleToken.bundle
            guard let result = Image(named: name, in: bundle, compatibleWith: traitCollection)
            else {
                fatalError("Unable to load image asset named \(name).")
            }
            return result
        }
    #endif

    #if canImport(SwiftUI)
        @available(
            iOS 13.0,
            tvOS 13.0,
            watchOS 6.0,
            macOS 10.15,
            *
        ) public var swiftUIImage: SwiftUI.Image {
            SwiftUI.Image(asset: self)
        }
    #endif
}

public extension ImageAsset.Image {
    @available(iOS 8.0, tvOS 9.0, watchOS 2.0, *)
    @available(
        macOS,
        deprecated,
        message: "This initializer is unsafe on macOS, please use the ImageAsset.image property"
    )
    convenience init?(asset: ImageAsset) {
        #if os(iOS) || os(tvOS)
            let bundle = BundleToken.bundle
            self.init(named: asset.name, in: bundle, compatibleWith: nil)
        #elseif os(macOS)
            self.init(named: NSImage.Name(asset.name))
        #elseif os(watchOS)
            self.init(named: asset.name)
        #endif
    }
}

#if canImport(SwiftUI)
    @available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15, *)
    public extension SwiftUI.Image {
        init(asset: ImageAsset) {
            let bundle = BundleToken.bundle
            self.init(asset.name, bundle: bundle)
        }

        init(asset: ImageAsset, label: Text) {
            let bundle = BundleToken.bundle
            self.init(asset.name, bundle: bundle, label: label)
        }

        init(decorative asset: ImageAsset) {
            let bundle = BundleToken.bundle
            self.init(decorative: asset.name, bundle: bundle)
        }
    }
#endif

// swiftlint:disable convenience_type
private final class BundleToken {
    static let bundle: Bundle = {
        #if SWIFT_PACKAGE
            return Bundle.module
        #else
            return Bundle(for: BundleToken.self)
        #endif
    }()
}

// swiftlint:enable convenience_type
