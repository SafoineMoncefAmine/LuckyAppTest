//
//  LogManager.swift
//  luckyApp
//
//  Created by Safoine Moncef Amine on 26/12/2020.
//

import Foundation

// LogManager - public globale variable

let log = LogManager(level: -1)

// LogManager - core
// NOTE: We're using this class as a log, to facilitate log management inside app. Different level of this class are inspired from XCGLogger (see https://github.com/DaveWoodCom/XCGLogger). We just added a "all" level before verbose

class LogManager {
    
    // MARK: Enum - public
    
    enum Level: Int, Comparable, CustomStringConvertible {
        case all = -1, verbose, debug, info, warning, error, severe, none
        
        // MARK: Comparable
        
        static func < (lhs: LogManager.Level, rhs: LogManager.Level) -> Bool {
            return lhs.rawValue < rhs.rawValue
        }
        
        // MARK: Comparable
        
        var description: String {
            switch self {
            case .all:
                return "All" // Should never appear
            case .verbose:
                return "Verbose"
            case .debug:
                return "Debug"
            case .info:
                return "Info"
            case .warning:
                return "Warning"
            case .error:
                return "Error"
            case .severe:
                return "Severe"
            case .none:
                return "None" // Should never appear
            }
        }
        
    }
    
    // MARK: Properties - private
    
    private let level: Level
    private let levelsFobidden: [Level]
    private let dateFormatter: DateFormatter
    
    // MARK: Methods - fileprivate - Lifecycle
    
    convenience fileprivate init(level: Int) {
        let level = Level(rawValue: level) ?? .none
        
        self.init(level: level)
    }
    
    private init(level: Level) {
        let levelsFobidden: [Level] = [.all, .none]
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss.SSS"
        
        self.level = level
        self.levelsFobidden = levelsFobidden
        self.dateFormatter = dateFormatter
    }
    
    // MARK: Methods - public - utilities
    
    public func isEnabledFor(level: Level) -> Bool {
        return level >= self.level && !self.levelsFobidden.contains(level)
    }
    
    // MARK: Methods - public - log
    
    public func verbose(_ message: String? = nil, fileName: String = #file, functionName: String = #function, lineNumber: Int = #line) {
        self.display(message, at: .verbose, fileName: fileName, functionName: functionName, lineNumber: lineNumber)
    }
    
    public func debug(_ message: String? = nil, fileName: String = #file, functionName: String = #function, lineNumber: Int = #line) {
        self.display(message, at: .debug, fileName: fileName, functionName: functionName, lineNumber: lineNumber)
    }
    
    public func info(_ message: String? = nil, fileName: String = #file, functionName: String = #function, lineNumber: Int = #line) {
        self.display(message, at: .info, fileName: fileName, functionName: functionName, lineNumber: lineNumber)
    }
    
    public func warning(_ message: String? = nil, fileName: String = #file, functionName: String = #function, lineNumber: Int = #line) {
        self.display(message, at: .warning, fileName: fileName, functionName: functionName, lineNumber: lineNumber)
    }
    
    public func error(_ message: String? = nil, fileName: String = #file, functionName: String = #function, lineNumber: Int = #line) {
        self.display(message, at: .error, fileName: fileName, functionName: functionName, lineNumber: lineNumber)
    }
    
    public func severe(_ message: String? = nil, fileName: String = #file, functionName: String = #function, lineNumber: Int = #line) {
        self.display(message, at: .severe, fileName: fileName, functionName: functionName, lineNumber: lineNumber)
    }
    
    // MARK: Methods - private - log
    
    private func display(_ message: String?, at level: Level, fileName: String, functionName: String, lineNumber: Int) {
        guard self.isEnabledFor(level: level) else { return }
        
        if let message = message {
            print("\(self.dateFormatter.string(from: Date())) [\(level)] [\(URL(fileURLWithPath: fileName).lastPathComponent):\(lineNumber)] \(functionName) > \(message)")
        } else {
            print("\(self.dateFormatter.string(from: Date())) [\(level)] [\(URL(fileURLWithPath: fileName).lastPathComponent):\(lineNumber)] \(functionName) >")
        }
    }
    
}
