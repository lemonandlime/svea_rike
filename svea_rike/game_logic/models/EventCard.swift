//
//  EventCard.swift
//  svea_rike
//
//  Created by Karl Söderberg on 2020-11-23.
//

import Foundation



Spela innan en annan spelares drag. Du far bestämma vilken verksamhet den spelaren skall ägna sig åt detta drag.


enum EventCard: Int {
    case inflytelseriktAmbete
    case fornamtAktenskap
    case maktigGranne
    case handelsprivilegier
    case hogforraderi
    case slagetVidNarva
    case foradstag
    case tagetOverStoraBalt
    case slipadForhandlare
    case efterfraganPaImportvaror
    case ranksmideri
    case urHetluften
    case blokadbrytare
    case formyndarregering
    case pestenHarjar
    case overlagsenTaktiker
    case maskeradmordet
    case kravallerBlandBorgerskapet
    case diplomatiskaPatryckningar
    case grannfejd
    case extraSkattTillKyrkan
    case krigetsVindar
    case fallenIOnad
    case slagetVidBreitenfeld
    case penningLan
    case indragningarFranKyrkan
    case forbindelserMedHavet
    
    
    var name: String {
        switch self {
            case .inflytelseriktAmbete: return "Inflytelserikt ämbete"
            case .fornamtAktenskap: return "Förnämt äktenskap"
            case .maktigGranne: return "Mäktig granne"
            case .handelsprivilegier: return "Handelsprivilegier"
            case .hogforraderi: return "Högförräderi!"
            case .slagetVidNarva: return "Slaget vid Narva"
            case .foradstag: return "Förrådstäg"
            case .tagetOverStoraBalt: return "Taget Över Stora Bält"
            case .slipadForhandlare: return "Slipad förhandlare"
            case .efterfraganPaImportvaror: return "Eftertrågan på importvaror"
            case .ranksmideri: return "Ränksmideri"
            case .urHetluften: return "Ur hetluften"
            case .blokadbrytare: return "Blockadbrytare"
            case .formyndarregering: return "Förmyndarregering"
            case .pestenHarjar: return "Pesten härjar"
            case .overlagsenTaktiker: return "Överlägsen taktiker"
            case .maskeradmordet: return "Maskeradmordet"
            case .kravallerBlandBorgerskapet: return "Kravaller bland borgerskapet"
            case .diplomatiskaPatryckningar: return "Diplomatiska påtryckningar"
            case .grannfejd: return "Grannfejd"
            case .extraSkattTillKyrkan: return "Extra skatt till kyrkan"
            case .slagetVidBreitenfeld: return "Slaget vid Breitenfeld"
            case .krigetsVindar: return "Krigets Vindar"
            case .penningLan: return "Penninglån"
            case .indragningarFranKyrkan: return "Indragningar från kyrkan"
            case .forbindelserMedHavet: return "Förbindelser med hovet"

            default:
                return ""
        }
    }
    
    var description: String {
        switch self {
            case .inflytelseriktAmbete:
                return "Så snart någon annan använt ett Händelsekort och lagt det i kasthögen, får du spela ut detta kort och då ta upp det kastade kortet till din hand, för framtida bruk."
            case .fornamtAktenskap:
                return " Spela ut detta kort när du köper en förläning. Du får den då 2 guld billigare per kronsymbol."
            case .maktigGranne:
                return "Välj en av dina förläningar som startar en ekonomiskt fejd mot en angränsande förläning (se kartan). Slå en tärning och lägg till antalet kronsymboler som din förläning ger; motståndaren (Riksgälden om förläningen är ledig) gör detsamma för förläningen som du valde ut. Ar ditt resultat HÖGRE ÄN motståndarens, får du det Förläningskortet."
            case .handelsprivilegier:
                return "Du får omedelbart ställa ut en extra Handelsman i valfri landscirkel på spelplanen."
            case .hogforraderi:
                return "Spela nar Sverige har förlorat ett krig. Du behöver inte avträda någon förläning pga. att Sverige förlorade kriget. Förläningar som automatiskt gar förlorade, förloras dock ändå!"
            case .slagetVidNarva:
                return "Spela ut detta kort när Sverige befinner sig i krig med Ryssland, så får du omedelbart ta bort de 2 av fiendens truppkort som har lägst stridsvärde. Spara detta kort framför dig till spelets slut om Sverige vinner detta krig det ger dig då en extra Anseendepoäng!"
            case .foradstag:
                return "Du behöver ej betala något underhảll för dina trupper detta drag. Gäller både i krig och fred."
            case .tagetOverStoraBalt:
                return "Spela ut detta kort när Sverige befinner sig i krig med Danmark, så far du omedelbart ta bort de 2 av fiendens truppkort som har lägst stridsvärde. Spara detta kort framför dig till spelets slut om Sverige vinner detta krig detger dig då en extra Anseendepoäng!"
            case .slipadForhandlare:
                return "Du får ta ett av en annan spelares Historiekort (valfritt vilket), betala honom eller henne dubbla kortets normala kostnad i guld, och lägga kortet framför dig själv istället."
            case .efterfraganPaImportvaror:
                return "Om du har handelsförbindelser, spelar du ut detta kort när du inkasserar handelsinkomster och får då omedelbart 5 guld."
            case .ranksmideri:
                return "Spela innan en annan spelares drag. Du far bestämma vilken verksamhet den spelaren skall ägna sig åt detta drag."
                
            case .urHetluften:
                return "Spela när som helst. Du får genast flytta en valfri (egen eller annan spelares) Handelsman till en annan Landscirkel."
                
            case .blokadbrytare:
                return "Spela omn krig utbryter. Dina egna Handelsmän i landet som det blir krig med skickas inte hem pga. kriget."
                
            case .formyndarregering:
                return "Spela efter det att sista spelaren gjort sitt drag, innan ni drar ett nytt Regentkort. Låt Regentpjäsen stâ kvar och spela ytterligare en hel omgang, Effekten från det liggande Regentkortet fortsätter galla, i krig sonn i fred! (Kan även spelas efter det sista spelvarvet.)"
                
            case .pestenHarjar:
                return "Pesten drabbar en landsända (välj en förläning på spelplanen; denna och samtliga angränsande förläningar drablbas). Drabbade spelare måste omedelbart ta bort EN valfri Vetenskapsman, Faltherre, Drottning eller Kulturpersonlıghet somn de har framför sig"
                
            case .overlagsenTaktiker:
                return "Spela ut under ett krig. När det blir din tur far du slå tärningen två gånger i stället för en, under resten av kriget. (Slår du tvả \"träffar\" tas tvả fiendetruppkort bort.)"
                
            case .maskeradmordet:
                return "Så snart du spelar ut detta kort är spelvarvet över, och de som ännu inte gjort sitt drag går miste om det (gäller bara i fredstid)."
                
            case .kravallerBlandBorgerskapet:
                return "Våldsamma kravaler drabbar en landsända (välj en förläning på spelplanen, deina och samtliga angränsande förläningar drabbas. Sla en tärning: \n1-3 Ingenting händer \n4 Samtliga drabbade förläningar med ingen eller 1 TRUPPSYMBOL förloras \n5 Samtliga drabbade förläningar med ingen, 1 eller 2 TRUPPSYMBOLER förloras \n6 Samtliga drabbade förläningar förloras \nEn förlorad förläning lämnas tillbaka till Riksgälden."
                        
            case .diplomatiskaPatryckningar:
                return "Ta bort en valfri utplacerad Handelsman på en Landscirkel för en annan spelare, och ge den tillbaka till honomn cller henne."
                
            case .grannfejd:
                return " Väl en av dina törlänıngar som startar en ekononiskt tejd mot en angränsande förläning (se kartan). Slả en tärnıng och lagg til antalet truppsymboler som din förläning ger; motståndaren Riksgälden om förläningen är ledig) gör detsamma för förläningen som du valde ut. Är ditt resultat HÖGRE ÄN motstándarens, får du det Förläningskortet."
                
            case .extraSkattTillKyrkan:
                return "Ett kyrkligt påbud om extra skatt till kyrkan drabbar en landsända (välj en förläning på spelplanen; denna och samtliga angränsande förläningar drabbas). Drabbade spelare mảste omedelbart betala ett guld per kronsymbol som de drabbade förläningarna har, till Riksgalden."
                
            case .fallenIOnad:
                return "Kungen kräver att du tar över en annan spelares forlaning (ditt val). Betala spelaren förläningens fulla värde. Om du inte kan betala händer ingenting, och detta kort kasseras."
                
            case .slagetVidBreitenfeld:
                return "Spela ut detta kort nar Sverige befinner sig i krig med Preussen, så fàr du omedelbart ta bort de 2 av fiendens truppkort som har lägst stridsvärde. Spara detta kort framnför dig till spelets slut om Sverige vinner detta krig det ger dig dá en extra Anseendepoảng!"
                
            case .krigetsVindar:
                return "Betala 7 guld och spela i slutet av ditt drag. Du framtvingar omedelbart ett krig mot valfritt land. Efter kriget avslutas spelvarvet, och spelare som ej ännu gjort sitt drag förlorar sitt drag,"
            case .penningLan:
                return "Du får omedelbart låna valfritt antal guld från Riksgälden, men du MÅSTE betala tillbaka dubbelt så många guld sist i din nästaspelrunda som fred dessutom råder."
                
            case .indragningarFranKyrkan:
                return "Alla spelare far 2 guld var från Riksgälden, utom du själv som får 5"
                
            case .forbindelserMedHavet:
                return "Spela ut detta kort så snart en annan spelare spelar ut ett Händelsekort; det Händelsekortet har då ingen som helst verkan, utan ska i stället genast kastas. Detta kort kan Ej motverkas av ett annat \"Förbindelser med hovet\"."
            default:
                return ""
        }
    }
}
