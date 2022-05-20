//
//  Logger.swift
//  Core
//
//  Created by Ramon Haro Marques
//

import Foundation

public struct Log {
    /// Type of logs available
    public enum LogType: String {
        /// To log a message
        case debug
        /// To log a warning
        case warning
        /// To log an error
        case error
    }
    
    /// Logs a debug message
    ///  - Parameters:
    ///    - message: Message to log
    ///    - file: File that calls the function
    ///    - line: Line of code from the file where the function is call
    ///    - function: Function that calls the functon
    /// - Returns: The optional message that was logged
    @discardableResult
    static public func d(message: String, file: String = #file, line: Int = #line, function: String = #function) -> String{
        return log(type: .debug, message: message, file: file, line: line, function: function)
    }
    
    /// Logs a warning message
    ///  - Parameters:
    ///    - message: Message to log
    ///    - file: File that calls the function
    ///    - line: Line of code from the file where the function is call
    ///    - function: Function that calls the functon
    /// - Returns: The optional message that was logged
    @discardableResult
    static public func w(message: String, file: String = #file, line: Int = #line, function: String = #function) -> String{
        return log(type: .warning, message: message, file: file, line: line, function: function)
    }
    
    /// Logs an error message
    ///  - Parameters:
    ///    - Parameter message: Message to log
    ///    - Parameter file: File that calls the function
    ///    - Parameter line: Line of code from the file where the function is call
    ///    - Parameter function: Function that calls the functon
    /// - Returns: The optional message that was logged
    @discardableResult
    static public func e(message: String, file: String = #file, line: Int = #line, function: String = #function) -> String{
        return log(type: .error, message: message, file: file, line: line, function: function)
    }
    
    /// Logs an message
    ///  - Parameters:
    ///    - logType: Type of message to log
    ///    - message: Message to log
    ///    - file: File that calls the function
    ///    - line: Line of code from the file where the function is call
    ///    - function: Function that calls the functon
    /// - Returns: The optional message that was logged
    @discardableResult
    static public func log(type logType: LogType = .debug, message: String, file: String = #file, line: Int = #line, function: String = #function) -> String{
        var logMessage = ""
        
        switch logType{
        case .debug:
            logMessage += "🟢"
        case .warning:
            logMessage += "🟡"
        case .error:
            logMessage += "🔴"
        }
        
        let fileName = file.components(separatedBy: "/").last ?? ""
        logMessage += " \(fileName) -> LINE: \(line) -> \(function) => \(message)"
        
        print(logMessage)
        return logMessage
    }
}

