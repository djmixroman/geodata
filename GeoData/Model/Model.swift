//
//  Model.swift
//  GeoData
//
//  Created by Roman Mogutnov on 21.12.2020.
//

import Foundation


// MARK: - Earthquake

struct Earthquake: Codable {
    let type: String
    let metadata: Metadata
    let features: [Feature]
    let bbox: [Double]
}

// MARK: - Feature

struct Feature: Codable {
    let type: FeatureType
    let properties: Properties
    let geometry: Geometry
    let id: String
}

// MARK: - Geometry

struct Geometry: Codable {
    let type: GeometryType
    let coordinates: [Double]
}

enum GeometryType: String, Codable {
    case point = "Point"
}

// MARK: - Properties

struct Properties: Codable {
    
    let mag: Double?
    let place: String
    let time, updated: Int
    let tz: String?
    let url: String
    let detail: String
    let felt: Int?
    let cdi, mmi: Double?
    let alert: Alert?
    let status: Status
    let tsunami, sig: Int
    let net: Net
    let code, ids: String
    let sources: Sources
    let types: String
    let nst: Int?
    let dmin: Double?
    let rms: Double
    let gap: Double?
    let magType: MagType?
    let type: PropertiesType
    let title: String
}

enum Alert: String, Codable {
    case green = "green"
}

enum MagType: String, Codable {
    case mb = "mb"
    case mbLg = "mb_lg"
    case md = "md"
    case mh = "mh"
    case ml = "ml"
    case mw = "mw"
    case mwb = "mwb"
    case mwr = "mwr"
    case mww = "mww"
}

enum Net: String, Codable {
    case ak = "ak"
    case av = "av"
    case ci = "ci"
    case hv = "hv"
    case mb = "mb"
    case nc = "nc"
    case nm = "nm"
    case nn = "nn"
    case ok = "ok"
    case pr = "pr"
    case se = "se"
    case us = "us"
    case uu = "uu"
    case uw = "uw"
}

enum Sources: String, Codable {
    case ak = ",ak,"
    case akAtUs = ",ak,at,us,"
    case akUs = ",ak,us,"
    case atAkUs = ",at,ak,us,"
    case atUs = ",at,us,"
    case atUsAk = ",at,us,ak,"
    case av = ",av,"
    case avAVAk = ",av,av,ak,"
    case avAk = ",av,ak,"
    case avAkUs = ",av,ak,us,"
    case avUs = ",av,us,"
    case avUsAk = ",av,us,ak,"
    case ci = ",ci,"
    case ciNn = ",ci,nn,"
    case ciUs = ",ci,us,"
    case ewAtNcUs = ",ew,at,nc,us,"
    case ewCiUs = ",ew,ci,us,"
    case ewNcUs = ",ew,nc,us,"
    case hv = ",hv,"
    case hvUs = ",hv,us,"
    case hvUsPt = ",hv,us,pt,"
    case mb = ",mb,"
    case mbUs = ",mb,us,"
    case mbUu = ",mb,uu,"
    case nc = ",nc,"
    case ncNn = ",nc,nn,"
    case ncNnUs = ",nc,nn,us,"
    case ncUs = ",nc,us,"
    case ncUsNn = ",nc,us,nn,"
    case nm = ",nm,"
    case nmUs = ",nm,us,"
    case nn = ",nn,"
    case nnCi = ",nn,ci,"
    case nnNc = ",nn,nc,"
    case nnUs = ",nn,us,"
    case nnUsNn = ",nn,us,nn,"
    case ok = ",ok,"
    case okUs = ",ok,us,"
    case pr = ",pr,"
    case prUs = ",pr,us,"
    case ptHvUs = ",pt,hv,us,"
    case se = ",se,"
    case us = ",us,"
    case usAk = ",us,ak,"
    case usAkAt = ",us,ak,at,"
    case usCi = ",us,ci,"
    case usHv = ",us,hv,"
    case usMB = ",us,mb,"
    case usNc = ",us,nc,"
    case usNm = ",us,nm,"
    case usNn = ",us,nn,"
    case usNnNn = ",us,nn,nn,"
    case usOk = ",us,ok,"
    case usPR = ",us,pr,"
    case usSE = ",us,se,"
    case usUu = ",us,uu,"
    case usUw = ",us,uw,"
    case uu = ",uu,"
    case uuUs = ",uu,us,"
    case uuUsMB = ",uu,us,mb,"
    case uw = ",uw,"
    case uwUs = ",uw,us,"
}

enum Status: String, Codable {
    case automatic = "automatic"
    case reviewed = "reviewed"
}

enum PropertiesType: String, Codable {
    case earthquake = "earthquake"
    case explosion = "explosion"
    case iceQuake = "ice quake"
    case otherEvent = "other event"
    case quarryBlast = "quarry blast"
}

enum FeatureType: String, Codable {
    case feature = "Feature"
}

// MARK: - Metadata
struct Metadata: Codable {
    let generated: Int
    let url: String
    let title: String
    let status: Int
    let api: String
    let count: Int
}
