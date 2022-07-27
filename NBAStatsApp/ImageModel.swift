//
//  Model.swift
//  NBAStatsApp
//
//  Created by Stephen on 6/3/22.
//

import Foundation

//struct First: Codable {
//    let league: League
//}
//// MARK: - League
//struct League: Codable {
//    let standard: [Standard]
//}
//struct Standard: Codable {
//    let personID: String
//}

//struct Initial: Codable {
//    let data: [Data]
//}
//struct Data: Codable {
//    let first_name: String?
//    let last_name: String?
//    let team: Team
//  
//    var dictionary: [String: Any] {
//        return ["first_name": first_name ?? "",
//                "last_name": last_name ?? ""]
//        }
//        var nsDictionary: NSDictionary {
//            return dictionary as NSDictionary
//        }
//    struct Team: Codable {
////        let conference: String?
////        let city: String?
//        let full_name: String?
//    
//        var dictionary: [String: Any] {
////        return ["city": city ?? 0,
////                "conference": conference ?? 0]
//            return ["full_name": full_name ?? 0]
//        }
//    }
//}
//{"data":[{"id":14,"first_name":"Ike","height_feet":null,"height_inches":null,"last_name":"Anigbogu","position":"C","team":{"id":12,"abbreviation":"IND","city":"Indiana","conference":"East","division":"Central","full_name":"Indiana Pacers","name":"Pacers"},"weight_pounds":null},{"id":25,"first_name":"Ron","height_feet":null,"height_inches":null,"last_name":"Baker","position":"G","team":{"id":20,"abbreviation":"NYK","city":"New York","conference":"East","division":"Atlantic","full_name":"New York Knicks","name":"Knicks"},"weight_pounds":null},{"id":47,"first_name":"Jabari","height_feet":null,"height_inches":null,"last_name":"Bird","position":"G","team":{"id":2,"abbreviation":"BOS","city":"Boston","conference":"East","division":"Atlantic","full_name":"Boston Celtics","name":"Celtics"},"weight_pounds":null},{"id":67,"first_name":"MarShon","height_feet":null,"height_inches":null,"last_name":"Brooks","position":"G","team":{"id":15,"abbreviation":"MEM","city":"Memphis","conference":"West","division":"Southwest","full_name":"Memphis Grizzlies","name":"Grizzlies"},"weight_pounds":null},{"id":71,"first_name":"Lorenzo","height_feet":null,"height_inches":null,"last_name":"Brown","position":"G","team":{"id":28,"abbreviation":"TOR","city":"Toronto","conference":"East","division":"Atlantic","full_name":"Toronto Raptors","name":"Raptors"},"weight_pounds":null},{"id":90,"first_name":"Omri","height_feet":null,"height_inches":null,"last_name":"Casspi","position":"F","team":{"id":15,"abbreviation":"MEM","city":"Memphis","conference":"West","division":"Southwest","full_name":"Memphis Grizzlies","name":"Grizzlies"},"weight_pounds":null},{"id":1,"first_name":"Alex","height_feet":6,"height_inches":6,"last_name":"Abrines","position":"G","team":{"id":21,"abbreviation":"OKC","city":"Oklahoma City","conference":"West","division":"Northwest","full_name":"Oklahoma City Thunder","name":"Thunder"},"weight_pounds":200},{"id":119,"first_name":"Tyler","height_feet":null,"height_inches":null,"last_name":"Davis","position":"C","team":{"id":21,"abbreviation":"OKC","city":"Oklahoma City","conference":"West","division":"Northwest","full_name":"Oklahoma City Thunder","name":"Thunder"},"weight_pounds":null},{"id":149,"first_name":"Keenan","height_feet":null,"height_inches":null,"last_name":"Evans","position":"G","team":{"id":9,"abbreviation":"DET","city":"Detroit","conference":"East","division":"Central","full_name":"Detroit Pistons","name":"Pistons"},"weight_pounds":null},{"id":179,"first_name":"Marcin","height_feet":null,"height_inches":null,"last_name":"Gortat","position":"C","team":{"id":13,"abbreviation":"LAC","city":"LA","conference":"West","division":"Pacific","full_name":"LA Clippers","name":"Clippers"},"weight_pounds":null},{"id":1593,"first_name":"Andrew","height_feet":null,"height_inches":null,"last_name":"Bogut","position":"F","team":{"id":10,"abbreviation":"GSW","city":"Golden State","conference":"West","division":"Pacific","full_name":"Golden State Warriors","name":"Warriors"},"weight_pounds":null},{"id":241,"first_name":"Amir","height_feet":6,"height_inches":9,"last_name":"Johnson","position":"C-F","team":{"id":23,"abbreviation":"PHI","city":"Philadelphia","conference":"East","division":"Atlantic","full_name":"Philadelphia 76ers","name":"76ers"},"weight_pounds":240},{"id":392,"first_name":"Malachi","height_feet":null,"height_inches":null,"last_name":"Richardson","position":"G","team":{"id":29,"abbreviation":"UTA","city":"Utah","conference":"West","division":"Northwest","full_name":"Utah Jazz","name":"Jazz"},"weight_pounds":null},{"id":281,"first_name":"Zach","height_feet":null,"height_inches":null,"last_name":"Lofton","position":"G","team":{"id":9,"abbreviation":"DET","city":"Detroit","conference":"East","division":"Central","full_name":"Detroit Pistons","name":"Pistons"},"weight_pounds":null},{"id":263,"first_name":"Kosta","height_feet":7,"height_inches":0,"last_name":"Koufos","position":"C","team":{"id":26,"abbreviation":"SAC","city":"Sacramento","conference":"West","division":"Pacific","full_name":"Sacramento Kings","name":"Kings"},"weight_pounds":245},{"id":382,"first_name":"Billy","height_feet":null,"height_inches":null,"last_name":"Preston","position":"F","team":{"id":6,"abbreviation":"CLE","city":"Cleveland","conference":"East","division":"Central","full_name":"Cleveland Cavaliers","name":"Cavaliers"},"weight_pounds":null},{"id":384,"first_name":"Zhou","height_feet":null,"height_inches":null,"last_name":"Qi","position":"F-C","team":{"id":11,"abbreviation":"HOU","city":"Houston","conference":"West","division":"Southwest","full_name":"Houston Rockets","name":"Rockets"},"weight_pounds":null},{"id":388,"first_name":"Zach","height_feet":null,"height_inches":null,"last_name":"Randolph","position":"F","team":{"id":26,"abbreviation":"SAC","city":"Sacramento","conference":"West","division":"Pacific","full_name":"Sacramento Kings","name":"Kings"},"weight_pounds":null},{"id":430,"first_name":"DJ","height_feet":null,"height_inches":null,"last_name":"Stephens","position":"G-F","team":{"id":15,"abbreviation":"MEM","city":"Memphis","conference":"West","division":"Southwest","full_name":"Memphis Grizzlies","name":"Grizzlies"},"weight_pounds":null},{"id":437,"first_name":"Milos","height_feet":null,"height_inches":null,"last_name":"Teodosic","position":"G","team":{"id":13,"abbreviation":"LAC","city":"LA","conference":"West","division":"Pacific","full_name":"LA Clippers","name":"Clippers"},"weight_pounds":null},{"id":448,"first_name":"Gary","height_feet":null,"height_inches":null,"last_name":"Trent Jr.","position":"G","team":{"id":25,"abbreviation":"POR","city":"Portland","conference":"West","division":"Northwest","full_name":"Portland Trail Blazers","name":"Trail Blazers"},"weight_pounds":null},{"id":494,"first_name":"Michael","height_feet":null,"height_inches":null,"last_name":"Smith","position":"","team":{"id":2,"abbreviation":"BOS","city":"Boston","conference":"East","division":"Atlantic","full_name":"Boston Celtics","name":"Celtics"},"weight_pounds":null},{"id":495,"first_name":"John","height_feet":null,"height_inches":null,"last_name":"Morton","position":"","team":{"id":6,"abbreviation":"CLE","city":"Cleveland","conference":"East","division":"Central","full_name":"Cleveland Cavaliers","name":"Cavaliers"},"weight_pounds":null},{"id":496,"first_name":"Howard","height_feet":null,"height_inches":null,"last_name":"Wright","position":"","team":{"id":1,"abbreviation":"ATL","city":"Atlanta","conference":"East","division":"Southeast","full_name":"Atlanta Hawks","name":"Hawks"},"weight_pounds":null},{"id":497,"first_name":"Michael","height_feet":null,"height_inches":null,"last_name":"Ansley","position":"","team":{"id":22,"abbreviation":"ORL","city":"Orlando","conference":"East","division":"Southeast","full_name":"Orlando Magic","name":"Magic"},"weight_pounds":null}],"meta":{"total_pages":151,"current_page":1,"next_page":2,"per_page":25,"total_count":3757}}
//
//
//









 
//struct Data: Codable {
//    let first_name: String
//    let last_name: String
//    let height_inches: Int
//    let weight_pounds: Int
//}
//struct JSON {
//    static let encoder = JSONEncoder()
//}
//extension Encodable {
//    subscript(key: String) -> Any? {
//        return dictionary[key]
//    }
//    var dictionary: [String: Any] {
//        return (try? JSONSerialization.jsonObject(with: JSON.encoder.encode(self))) as? [String: Any] ?? [:]
//    }
//}

