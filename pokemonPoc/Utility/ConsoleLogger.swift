//
//  ConsoleLogger.swift
//  pokemonPoc
//
//  Created by Alessandro Marcon on 03/11/21.
//

import Foundation

/* To modify these configuration, change for each target, custom falgs under build settings options **/
#if DEBUG
var logLevel: Int = ConsoleLogLevel.ll_VERBOSEFUNC.rawValue
#else
var logLevel: Int = ConsoleLogLevel.ll_ERROR.rawValue
#endif


enum ConsoleLogLevel: Int {
    case ll_ERROR           = 1
    case ll_WARNING         = 2
    case ll_INFO            = 3
    case ll_DEBUG           = 4
    case ll_VERBOSE         = 5
    case ll_PRINT           = 6
    case ll_VERBOSEFUNC     = 7
}


/// ERROR log message
///
/// - Parameters:
///   - message: log message
///   - fileName: file where log was printed
///   - functionName: Function name
///   - line: code line
public func LOGE(_ message: String, fileName: String = #file, functionName: String = #function, line: Int = #line) {
    
    if( logLevel >= ConsoleLogLevel.ll_DEBUG.rawValue ) {
        let timestamp = currentDate()
        print("[ERROR] - \(timestamp) - \(fileName).\(functionName):\(line) - \(message)")
    }
}


/// WARNING log level
///
/// - Parameters:
///   - message: log message
///   - fileName: file where log was printed
///   - functionName: Function name
///   - line: code line
public func LOGW(_ message: String, fileName: String = #file, functionName: String = #function, line: Int = #line) {
    
    if( logLevel >= ConsoleLogLevel.ll_DEBUG.rawValue ) {
        let timestamp = currentDate()
        print("WARN] - \(timestamp) - \(fileName).\(functionName):\(line) - \(message)")
    }
}


/// INFO log level
///
/// - Parameters:
///   - message: log message
///   - fileName: file where log was printed
///   - functionName: Function name
///   - line: code line
public func LOGI(_ message: String, fileName: String = #file, functionName: String = #function, line: Int = #line) {
    
    if( logLevel >= ConsoleLogLevel.ll_DEBUG.rawValue ) {
        let timestamp = currentDate()
        print("[INFO] - \(timestamp) - \(fileName).\(functionName):\(line) - \(message)")
    }
}


/// DEBUG log level
///
/// - Parameters:
///   - message: log message
///   - fileName: file where log was printed
///   - functionName: Function name
///   - line: code line
public func LOGD(_ message: String, fileName: String = #file, functionName: String = #function, line: Int = #line) {
    
    if( logLevel >= ConsoleLogLevel.ll_DEBUG.rawValue ) {
        let timestamp = currentDate()
        print("[DEBUG] - \(timestamp) - \(fileName).\(functionName):\(line) - \(message)")
    }
}


/// VERBOSE log level
///
/// - Parameters:
///   - message: log message
///   - functionName: Function name
///   - line: code line
public func LOGV(_ message: String, functionName: String = #function, line: Int = #line) {
    
    if( logLevel >= ConsoleLogLevel.ll_VERBOSEFUNC.rawValue ) {
        let timestamp = currentDate()
        print("[VERBOSE] - \(timestamp) - \(functionName):\(line) - \(message)")
    }
}


/// PRINT log level
///
/// - Parameters:
///   - message: log message
///   - functionName: Function name
///   - line: code line
public func LOGP(_ message: String, functionName: String = #function, line: Int = #line) {

    if( logLevel >= ConsoleLogLevel.ll_PRINT.rawValue ) {
        print("[PRINT] - \(functionName):\(line) - \(message)")
    }
}


/// Static log message to print function begin
///
/// - Parameters:
///   - functionName: Function name that print log
public func LOGFSTART(functionName: String = #function) {
    
    if( logLevel >= ConsoleLogLevel.ll_VERBOSEFUNC.rawValue ) {
        let timestamp = currentDate()
        print("\(timestamp) - \(functionName): START")
    }
}


/// Static log message to print function end
///
/// - Parameters:
///   - functionName: Function name that print log
public func LOGFEND(functionName: String = #function) {
    
    if( logLevel >= ConsoleLogLevel.ll_VERBOSEFUNC.rawValue ) {
        let timestamp = currentDate()
        print("\(timestamp) - \(functionName): END")
    }
}

private func currentDate() -> String {
    let formatter = DateFormatter()
    formatter.timeZone = TimeZone.current
    formatter.locale = Locale.current
    formatter.dateFormat = "dd-MM-yyyy HH:mm:ss.SSS"
    
    return formatter.string(from: Date())
}
