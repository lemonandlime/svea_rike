//
//  HistoryCard.swift
//  svea_rike
//
//  Created by Karl Soderberg on 2020-11-24.
//

import Foundation
import Resources

public enum HistoryCard: String, Identifiable, CaseIterable, Hashable {
    case tyska_knektar
    case maria_elionora
    case lennart_torstensson
    case ostindiska_kompaniet
    case falu_koppargruva
    case viborgs_fastning
    case johannes_bureus
    case gustaf_horn
    case johan_henric_kellgren
    case kungliga_slottet
    case olaus_magnus
    case haga
    case karin_mansdotter
    case hattpartiet
    case carl_gustaf_armfeldt
    case sofia_magdalena
    case ostersjoflotta
    case carl_von_linne
    case axel_von_fersen
    case finska_rytteriet
    case forbindelser_med_hansan
    case conrad_von_pyhy
    case bergsbruk
    case olaus_petri
    case drots
    case orbyhus
    case jordreform
    case anders_celsius
    case skokloster
    case katarina_jagellonica
    case vadstena
    case karoliner
    case kanslipresident
    case georg_carl_von_dobeln
    case emmanuel_swedenborg
    case tycho_brahe
    case jons_jacob_berzelius
    case lovisa_ulrika
    case glimmingehus
    case manufakturier
    case sala_silvergruva
    case gripsholm
    case georg_stiernhielm
    case hedvig_eleonora
    case carl_michael_bellman

    private typealias Images = Asset.Image.HistoryCard

    public var id: String { self.rawValue }

    public var name: String {
        switch self {
        case .tyska_knektar:
            return "TYSKA KNEKTAR"
        case .maria_elionora:
            return "MARIA ELEONORA"
        case .lennart_torstensson:
            return "LENNART TORSTENSSON"
        case .ostindiska_kompaniet:
            return "ANDEL I OSTINDISKA KOMPANIET"
        case .falu_koppargruva:
            return "ANDEL I FALU KOPPARGRUVA"
        case .viborgs_fastning:
            return "VIBORGS FÄSTNING"
        case .johannes_bureus:
            return "JOHANNES BUREUS"
        case .gustaf_horn:
            return "GUSTAF HORN"
        case .johan_henric_kellgren:
            return "JOHAN HENRIC KELLGREN"
        case .kungliga_slottet:
            return "KUNGLIGA SLOTTET"
        case .olaus_magnus:
            return "OLAUS MAGNUS"
        case .haga:
            return "HAGA"
        case .karin_mansdotter:
            return "KARIN MÄNSDOTTER"
        case .hattpartiet:
            return "STÖD AT HATTPARTIET"
        case .carl_gustaf_armfeldt:
            return "CARL GUSTAF ARMFELDT"
        case .sofia_magdalena:
            return "SOFIA MAGDALENA"
        case .ostersjoflotta:
            return "ÖSTERSJÖFLOTTA"
        case .carl_von_linne:
            return "CARL VON LINNÉ"
        case .axel_von_fersen:
            return "AXEL VON FERSEN"
        case .finska_rytteriet:
            return "FINSKA RYTTERIET"
        case .forbindelser_med_hansan:
            return "FÖRBINDELSER MED HANSAN"
        case .conrad_von_pyhy:
            return "CONRAD VON PYHY"
        case .bergsbruk:
            return "BERGSBRUK"
        case .olaus_petri:
            return "OLAUS PETRI"
        case .drots:
            return "DROTS"
        case .orbyhus:
            return "ÖRBYHUS"
        case .jordreform:
            return "JORDREFORM"
        case .anders_celsius:
            return "ANDERS CELSIUS"
        case .skokloster:
            return "SKOKLOSTER"
        case .katarina_jagellonica:
            return "KATARINA JAGELLONICA"
        case .vadstena:
            return "VADSTENA"
        case .karoliner:
            return "KAROLINER"
        case .kanslipresident:
            return "KANSLIPRESIDENT"
        case .georg_carl_von_dobeln:
            return "GEORG CARL VON DÖBELN"
        case .emmanuel_swedenborg:
            return "EMMANUEL SWEDENBORG"
        case .tycho_brahe:
            return "TYCHO BRAHE"
        case .jons_jacob_berzelius:
            return "JÖNS JACOB BERZELIUS"
        case .lovisa_ulrika:
            return "LOVISA ULRIKA"
        case .glimmingehus:
            return "GLIMMINGEHUS"
        case .manufakturier:
            return "MANUFAKTURIER"
        case .sala_silvergruva:
            return "ANDEL I SALA SILVERGRUVA"
        case .gripsholm:
            return "GRIPSHOLM"
        case .georg_stiernhielm:
            return "GEORG STIERNHIELM"
        case .hedvig_eleonora:
            return "HEDVIG ELEONORA"
        case .carl_michael_bellman:
            return "CARL MICHAEL BELLMAN"
        }
    }

    public var description: String {
        switch self {
        case .tyska_knektar:
            return "Under i stort sett samtliza europeiska krig under 1500- och 1600-talen arvändes legoknektar av de stridande parterna."
        case .maria_elionora:
            return "Git med Gustav Il Adolf och förvarade efter bans död dennes bärta i ett skrin. Rumde till Danmark 1640."
        case .lennart_torstensson:
            return "Greve. Urvecklade under 1600-talet det svenska artillerist. Slutade sina dagar som guvernor over Västsverige."
        case .ostindiska_kompaniet:
            return "Sveriges mest vinstgivande företag under bela 1700-talet. Totalt utrustades 132 expeditioner, till Kina och Indien."
        case .falu_koppargruva:
            return "En forutsättning for Sveriges maksposition - pà 1600-talet svarade gruvan for 2/3 av wärldsproduktionen av koppar."
        case .viborgs_fastning:
            return "Uppförd p§ 1400-talet; länge svenska rikets vikrigaste gränsfäste i öster. Belägrad av ryssen mänga gänger."
        case .johannes_bureus:
            return "Riksarkivarie och riksantikvarie under Gustaf II Adolf. Lärde sig lasa runor och avtecknade en mängd runstenar."
        case .gustaf_horn:
            return "Greve, fältmarskalk och riksmarsk. Kung Gustav II Adolfs närmaste man under det trettioáriga kriget."
        case .johan_henric_kellgren:
            return "Skald och publicist. Skrew operor ibop med Gustav III. Humanist som forespräkade fornuft, klarbet och tolerans."
        case .kungliga_slottet:
            return "Uppfört 1692-1754 med Nicodemus Tessin d y. som arkitekt. Sveriges fornâmsta officiella bygenad."
        case .olaus_magnus:
            return "Ärkebiskop, diplomat och författare. Strev bla. 'Historia or de nordiska folken' 1555, illustrerad med 476 träsnitt."
        case .haga:
            return "Uppfort pà 1 700-talet. Kungligt slott med lustpark i engelsk stil, räknad bland världens främsta."
        case .karin_mansdotter:
            return "Dotter till en soldat, kammarjungfru pà kungliga slotter. Gift med Erik XIV. Begravd i Abo domkyrka."
        case .hattpartiet:
            return "Polinsk parti frän omkring 1 730 till 1 772, företrädande framst merkantilistiska intressen genom bl.a. C.G. Tessin."
        case .carl_gustaf_armfeldt:
            return "Friberre och överbefalhavare i Finland. Ledde den svenska arméns återtåg frin Trondbein 1718, då 3000 man av 5000 frös ibjäl."
        case .sofia_magdalena:
            return "Dansk prinsessa som av politiska skal vid fem ärs älder trolovades med den lika unge kronprins Gustav (III)"
        case .ostersjoflotta:
            return "Fartyg, inte bara bestyckade med 24-skälpundskanoner och ausedda för krig, utan ocksà for trupptransporter."
        case .carl_von_linne:
            return "Professor vid Uppsala universitet. Revolutionerade under 1 700-talet botaniken. En av historiens mest kânda svenskar."
        case .axel_von_fersen:
            return "Greve och riksmarskalk. Overste för det franska regementet Royal Suédois. Anses ha varit alskare till Marie Antoinette."
        case .finska_rytteriet:
            return "Skickliga och uthälliga krigsmän, fruktade inte minst av arufienden muskoviterna."
        case .forbindelser_med_hansan:
            return "Frän 1 100-talet till 1600-talet ett mäktigt merkantilt och poliriskt förbund i Östersjöstaderna."
        case .conrad_von_pyhy:
            return "Au isk börd, kansler under Gustav Vasa. Aktiv inom utrikespolitiken, lade grunden till dagens byråkrati."
        case .bergsbruk:
            return "Främst brytning av järn, koppar och stenkol. En kapitalkrävande bransch, viktig for Sverige sedan medeliden."
        case .olaus_petri:
            return "Den svenska kyrkans främste reformatör. Råkade i onåd hos Gustav Vasa och dömdes till döden men benâdades,"
        case .drots:
            return ""
        case .orbyhus:
            return "Uppfört som tornborg pa 1400-talet av Gustav Vasas farfar Johan Kristersson Vasa, sedan urbyggt till barockslott."
        case .jordreform:
            return "Under stormaktstiden genomfördes en mängd jordreformer som syftade till at öka produktionen och att underlätta arvsskifiena."
        case .anders_celsius:
            return "Apotekare och kemist. Hans upptäckter och forskning bidrog i hög grad till kemins utveckling i slutet av 1 700-talet."
        case .skokloster:
            return "Uppfôrt 1654-68. Rymmer en praktfull barockinredning och enastâende samlingar an konst, konsthantverk och vaper."
        case .katarina_jagellonica:
            return "Polsk prinsessa. Hertig Johan (III) gifte sig med benne och han blev därför inspärrad av Erik XIV i fyra år."
        case .vadstena:
            return "Uppfort i mitten a~ 1 500-talet. F.d. kungligt slott och arkitektoniskt ett av Sveriges fornämsta renässansslott."
        case .karoliner:
            return "Krigarna som ingick i Karl XIlis armé och delioz i de mänga falitägen mot bla. Ryssland, Sachsen och Norge."
        case .kanslipresident:
            return ""
        case .georg_carl_von_dobeln:
            return "Generallöjtnant, stred för Frankrike i Indien och mot ryssen i Finland. Odödliggjord i 'Fänrik Ståls sägner'."
        case .emmanuel_swedenborg:
            return "Naturforskare och mystiker. Hade drömmar och syner, och skapade i mitten av 1 700-talet en egen religios lära."
        case .tycho_brahe:
            return "Astronom och egentligen dansk. På ön Ven inrättade han världens då största och förnämsta observatorium."
        case .jons_jacob_berzelius:
            return "Kemist som zjorde banbrytande forskning. En av Sveriges internationelle mest berömda naturforskare nägonsin."
        case .lovisa_ulrika:
            return "Gift med Adolf Fredrik och mor till Gustav III. Vacker, begavad och intresserad av saval kultur som politik."
        case .glimmingehus:
            return "Uppfört i början av 1 500-talet. Nordens bäst bevarade medelridsborg. Innehäller bl.a ätskilliga skulpturer."
        case .manufakturier:
            return "Den frarrväsande tillverkningsindustrin på 1700-talet, vilken försägs med en egen lagstifining utanför skraväsendets."
        case .sala_silvergruva:
            return "'Riksens förmämsta Clenodium', enligt Karl IX. Sveriges viktigaste exportinkomst under hela 1500-talet."
        case .gripsholm:
            return "Ursprungligen uppfört pà 1300-talet. Idag ett av vara främsta nationalmonument. Inrymmer Svenska statens porträttsamling."
        case .georg_stiernhielm:
            return "Jurist, skald och filosof. Skrev 'Herkules vid skiljevägen', stormaktstidens främsta litterara verk."
        case .hedvig_eleonora:
            return "Dotter till en bertig av Holstein-Gottorp, gift med Karl X Gustav. Lat uppföra Drottningholms slott."
        case .carl_michael_bellman:
            return "Diktare, musiker, aktör. Portalfiguren inom svensk vistradition, med en hängiven beundrare i Gustav III."
        }
    }

    public var image: ImageAsset {
        switch self {
        case .tyska_knektar:
            return Images.tyskaKnektar
        case .maria_elionora:
            return Images.mariaElionora
        case .lennart_torstensson:
            return Images.lennartTorstensson
        case .ostindiska_kompaniet:
            return Images.ostindiskaKompaniet
        case .falu_koppargruva:
            return Images.faluKoppargruva
        case .viborgs_fastning:
            return Images.viborgsFastning
        case .johannes_bureus:
            return Images.johannesBureus
        case .gustaf_horn:
            return Images.gustafHorn
        case .johan_henric_kellgren:
            return Images.johanHenrikKjellgren
        case .kungliga_slottet:
            return Images.kungligaSlottet
        case .olaus_magnus:
            return Images.olausMagnus
        case .haga:
            return Images.haga
        case .karin_mansdotter:
            return Images.karinMansdotter
        case .hattpartiet:
            return Images.hattpartiet
        case .carl_gustaf_armfeldt:
            return Images.carGustavArmfeldt
        case .sofia_magdalena:
            return Images.sofiaMagdalena
        case .ostersjoflotta:
            return Images.ostersjoflotta
        case .carl_von_linne:
            return Images.carlVonLinne
        case .axel_von_fersen:
            return Images.axelVonFersen
        case .finska_rytteriet:
            return Images.finskaRytteriet
        case .forbindelser_med_hansan:
            return Images.forbindelserMedHansan
        case .conrad_von_pyhy:
            return Images.conradVonPyhy
        case .bergsbruk:
            return Images.bergsbruk
        case .olaus_petri:
            return Images.olausPetri
        case .drots:
            return Images.drots
        case .orbyhus:
            return Images.orbyhus
        case .jordreform:
            return Images.jordreform
        case .anders_celsius:
            return Images.andersCelsius
        case .skokloster:
            return Images.skokloster
        case .katarina_jagellonica:
            return Images.katarinaJagellonica
        case .vadstena:
            return Images.vadstena
        case .karoliner:
            return Images.karoliner
        case .kanslipresident:
            return Images.kanslipresident
        case .georg_carl_von_dobeln:
            return Images.georgCarlVonDobeln
        case .emmanuel_swedenborg:
            return Images.emmanuelSwedenborg
        case .tycho_brahe:
            return Images.tychoBrahe
        case .jons_jacob_berzelius:
            return Images.jonsJacobBerzelius
        case .lovisa_ulrika:
            return Images.lovisaUlrika
        case .glimmingehus:
            return Images.glimmingehus
        case .manufakturier:
            return Images.manufakturer
        case .sala_silvergruva:
            return Images.salaSilvergruva
        case .gripsholm:
            return Images.gripsholm
        case .georg_stiernhielm:
            return Images.georgStiernheilm
        case .hedvig_eleonora:
            return Images.hedvidElionora
        case .carl_michael_bellman:
            return Images.carlMichaelBellman
        }
    }

    public var actionDescription: String {
        switch cardType {
        case .queen:
            return "Ger dig 2 extra guld när du väljer Handel som verksamhet."
        case .culturePerson:
            return "Du fär omedelbart dra ett extra Händelsekort."
        case .castle:
            return "Ger dig 2 extra guld nar du väljer Jordbruk som verksamhet."
        case .army, .general:
            return "Ökar ditt Förläningskorts stridsvärde med +1 i krig. Du behöver aldrig betala underhåll för detta kort."
        case .scientist:
            return "Du far omedelbart köpa ytterligare ETT Historiekort."
        case .resource:
            switch self {
            case .ostindiska_kompaniet:
                return "Slå en tarning vid spelets slut (men innan ni börjar räkna AP) blir resultatet 5 eller 6 får du en extra Anseendepoäng."
            case .falu_koppargruva:
                return "Ger dig I extra guld per spelvarv, i fred som i krig. Inkassera detta INNAN någon gör sitt drag."
            case .hattpartiet:
                return "Du far dra tva Händelsekort i stället for ett varje gang du drar Händelsekort i början av din speltur."
            case .jordreform:
                return "Ger dig I extra guld per forlaning varje gang du inkasserar inkomst fran dina förläningar."
            case .forbindelser_med_hansan:
                return "Ger dig I extra guld per Handelsman varje gang du inkasserar inkomst frän dina Handelsmän."
            case .bergsbruk:
                return "Ger dig 2 extra guld per spelvarv, i fred som i krig. Inkassera detta INNAN nagon gör sitt drag."
            case .drots, .kanslipresident:
                return "Du far när som helst ta detta kort ur spel och i stället genast antingen köpa ett annat Förlänings-eller Historiekort, ELLER placera ut en Handelsman."
            case .manufakturier:
                return "Vid spelets slut, innan ni börjar räkna AP, slå en tärning och multiplicera resultatet med tio. Du får omedelbart sa manga guld fran Riksgälden."
            case .sala_silvergruva:
                return "Ger 2 extra guld per spel-varv som det inte ar krig. Inkassera detta INNAN någon gör sitt drag."
            default:
                fatalError("This should never happen")
            }
        }
    }

    public var price: Int {
        switch self {
        case .conrad_von_pyhy, .drots, .hattpartiet, .olaus_petri:
            return 2
        case .axel_von_fersen, .carl_gustaf_armfeldt, .georg_carl_von_dobeln, .gustaf_horn,
             .jordreform, .kanslipresident, .karin_mansdotter, .katarina_jagellonica,
             .lennart_torstensson:
            return 3
        case .falu_koppargruva, .forbindelser_med_hansan, .georg_stiernhielm, .hedvig_eleonora,
             .maria_elionora, .olaus_magnus, .sala_silvergruva, .tycho_brahe:
            return 4
        case .carl_michael_bellman, .emmanuel_swedenborg, .finska_rytteriet, .glimmingehus,
             .gripsholm, .haga, .johan_henric_kellgren, .karoliner, .kungliga_slottet,
             .lovisa_ulrika,
             .orbyhus, .ostersjoflotta, .ostindiska_kompaniet, .skokloster, .sofia_magdalena,
             .tyska_knektar, .vadstena, .viborgs_fastning:
            return 5
        case .anders_celsius, .bergsbruk, .carl_von_linne, .johannes_bureus, .jons_jacob_berzelius:
            return 6
        case .manufakturier:
            return 20
        }
    }

    public var cardType: HistoryCardType {
        switch self {
        case .finska_rytteriet, .karoliner, .ostersjoflotta, .tyska_knektar:
            return .army
        case .hedvig_eleonora, .karin_mansdotter, .katarina_jagellonica, .lovisa_ulrika,
             .maria_elionora, .sofia_magdalena:
            return .queen
        case .axel_von_fersen, .carl_gustaf_armfeldt, .georg_carl_von_dobeln, .gustaf_horn,
             .lennart_torstensson:
            return .general
        case .bergsbruk, .drots, .falu_koppargruva, .forbindelser_med_hansan, .hattpartiet,
             .jordreform, .kanslipresident, .manufakturier, .ostindiska_kompaniet,
             .sala_silvergruva:
            return .resource
        case .glimmingehus, .gripsholm, .haga, .kungliga_slottet, .orbyhus, .skokloster, .vadstena,
             .viborgs_fastning:
            return .castle
        case .carl_michael_bellman, .conrad_von_pyhy, .emmanuel_swedenborg, .georg_stiernhielm,
             .johan_henric_kellgren, .olaus_petri:
            return .culturePerson
        case .anders_celsius, .carl_von_linne, .johannes_bureus, .jons_jacob_berzelius,
             .olaus_magnus, .tycho_brahe:
            return .scientist
        }
    }

    public var era: Era {
        switch self {
        case .bergsbruk, .conrad_von_pyhy, .drots, .falu_koppargruva, .forbindelser_med_hansan,
             .glimmingehus, .gripsholm, .karin_mansdotter, .katarina_jagellonica, .olaus_magnus,
             .olaus_petri, .sala_silvergruva, .tycho_brahe, .tyska_knektar, .vadstena,
             .viborgs_fastning:
            return .green
        case .carl_gustaf_armfeldt, .georg_stiernhielm, .gustaf_horn, .hedvig_eleonora,
             .johannes_bureus, .jordreform, .karoliner, .lennart_torstensson, .maria_elionora,
             .orbyhus, .skokloster:
            return .red
        case .anders_celsius, .axel_von_fersen, .carl_michael_bellman, .carl_von_linne,
             .emmanuel_swedenborg, .finska_rytteriet, .georg_carl_von_dobeln, .haga, .hattpartiet,
             .johan_henric_kellgren, .jons_jacob_berzelius, .kanslipresident, .kungliga_slottet,
             .lovisa_ulrika, .manufakturier, .ostersjoflotta, .ostindiska_kompaniet,
             .sofia_magdalena:
            return .blue
        }
    }
}

public enum HistoryCardType {
    case queen
    case culturePerson
    case castle
    case army
    case general
    case scientist
    case resource
}
