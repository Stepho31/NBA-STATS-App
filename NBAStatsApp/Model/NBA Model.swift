//
//  NBA Model.swift
//  NBAStatsApp
//
//  Created by Stephen on 6/6/22.
//

import UIKit

// MARK: - Instruction
struct Instruction: Codable {
    let league: League
}
// MARK: - League
struct League: Codable {
    let standard: [Standard]

}

// MARK: - Standard
struct Standard: Codable {
    let firstName, lastName: String?
    let temporaryDisplayName: String?
    let personId, teamId, jersey: String?
    let heightFeet, heightInches: String?
    let weightPounds, weightKilograms, dateOfBirthUTC: String?
    let nbaDebutYear, yearsPro, collegeName, lastAffiliation: String?
    let country: String?
    let teamSitesOnly: TeamSitesOnly?
    let utah: Sacremento?
    let city, altCityName, fullName, tricode: String?
    let teamID, nickname, urlName: String?
    let teamShortName: String?
}
// MARK: - Africa
struct Sacremento: Codable {
    let city, altCityName, fullName, tricode: String?
    let teamID, nickname, urlName: String?
    let teamShortName: String?
}
struct TeamSitesOnly: Codable {
    let playerCode: String?
    let displayAffiliation: String?
    let freeAgentCode: String?
}
