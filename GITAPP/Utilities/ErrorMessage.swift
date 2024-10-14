//
//  ErrorMessage.swift
//  GITAPP
//
//  Created by Yareni Grajales Mérida on 08/10/24.
//

import Foundation

//implementa protocolo de errores de switf
enum GFError: String, Error {
    case invalidUsername = "This username created an invalid request, please try again"
    case unableToComplete = "Unable to complete your request. Please check your internet connection"
    case invalidResponse = "Invalid response from the server. Please try again"
    case invalidData = "The data received from the server was invalid. Please try again"
}
