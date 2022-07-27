//
//  TeamsModel.swift
//
//
//  Created by Stephen on 6/13/22.
//

/// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try Welcome(json)

//import Foundation
//
//struct Welcome {
//    let greeting: String
//    let instructions: [Instruction]
//}
//
//// MARK: - Instruction
//struct Instruction {
//    let instructionInternal: Internal
//    let league: League
//}
//
//// MARK: - Internal
//struct Internal {
//    let pubDateTime, igorPath, xslt, xsltForceRecompile: String
//    let xsltInCache, xsltCompileTimeMillis, xsltTransformTimeMillis, consolidatedDOMKey: String
//    let endToEndTimeMillis: String
//}
//
//// MARK: - League
//struct League {
//    let standard: [Sacramento]
//    let africa: [Any?]
//    let sacramento, vegas, utah: [Sacramento]
//}
//
//// MARK: - Sacramento
//struct Sacramento {
//    let firstName, lastName: String
//    let temporaryDisplayName: String?
//    let personID, teamID, jersey: String
//    let isActive: Bool
//    let pos: Pos
//    let heightFeet, heightInches: String
//    let heightMeters: HeightMeters
//    let weightPounds, weightKilograms, dateOfBirthUTC: String
//    let teamSitesOnly: TeamSitesOnly?
//    let teams: [Team]
//    let draft: Draft
//    let nbaDebutYear, yearsPro, collegeName, lastAffiliation: String
//    let country: String
//    let isallStar: Bool?
//}
//
//// MARK: - Draft
//struct Draft {
//    let teamID, pickNum, roundNum, seasonYear: String
//}
//
//enum HeightMeters {
//    case empty
//    case the102
//    case the175
//    case the178
//    case the18
//    case the183
//    case the185
//    case the188
//    case the19
//    case the193
//    case the196
//    case the198
//    case the201
//    case the203
//    case the206
//    case the208
//    case the211
//    case the213
//    case the216
//    case the218
//    case the221
//}
//
//enum Pos {
//    case c
//    case cF
//    case empty
//    case f
//    case fC
//    case fG
//    case g
//    case gF
//}
//
//// MARK: - TeamSitesOnly
//struct TeamSitesOnly {
//    let playerCode: String
//    let posFull: PosFull
//    let displayAffiliation, freeAgentCode: String
//}
//
//enum PosFull {
//    case center
//    case centerForward
//    case empty
//    case forward
//    case forwardCenter
//    case forwardGuard
//    case guardForward
//    case posFullGuard
//}
//
//// MARK: - Team
//struct Team {
//    let teamID, seasonStart, seasonEnd: String
//}
