//
//  String+Utility.swift
//  UtilityFramework
//
//  Created by Amit Majumdar on 27/12/18.
//  Copyright © 2018 Amit Majumdar. All rights reserved.
//

import Foundation

//MARK:- String Extension -- Custom String Methods

extension String {
    
    /// UtilityFramework: Returns a Empty String.
    public static var emptyString: String {
        return whiteSpaceString.trimmed
    }
    
    /// UtilityFramework: Returns a White Space.
    public static var whiteSpaceString: String {
        return " "
    }
    
    /// UtilityFramework: Returns a New line.
    public static var newLineString: String {
        return "\n"
    }
    
    /// UtilityFramework: Returns Regular Expression for Email.
    public static var emailRegEx: String {
        return "^(?:[\\p{L}0-9!#$%\\&'*+/=?\\^_`{|}~-]+(?:\\.[\\p{L}0-9!#$%\\&'*+/=?\\^_`{|}~-]+)*|\"(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21\\x23-\\x5b\\x5d-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])*\")@(?:(?:[\\p{L}0-9](?:[a-z0-9-]*[\\p{L}0-9])?\\.)+[\\p{L}0-9](?:[\\p{L}0-9-]*[\\p{L}0-9])?|\\[(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?|[\\p{L}0-9-]*[\\p{L}0-9]:(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21-\\x5a\\x53-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])+)\\])$"
    }
    
    /// UtilityFramework: Returns https.
    public static var https: String {
        return "https"
    }
    
    /// UtilityFramework: Returns http.
    public static var http: String {
        return "http"
    }
}

//MARK:- String Extension -- String Conversion Methods

extension String {
    
    /// UtilityFramework: Returns a Float representation of the String.
    public var floatRepresentation: Float {
        return NSString(string:self).floatValue
    }
    
    /// UtilityFramework: Returns a Double representation of the String.
    public var doubleRepresentation: Double {
        return NSString(string:self).doubleValue
    }
    
    /// UtilityFramework: Returns a Integer representation of the String.
    public var integerRepresentation: Int {
        return NSString(string:self).integerValue
    }
    
    /// Returns a Camel Cased representation of the String.
    public var camelcased: String {
        let source = lowercased()
        let first = source[..<source.index(after: source.startIndex)]
        if source.contains(String.whiteSpaceString) {
            let connected = source.capitalized.replacingOccurrences(of: String.whiteSpaceString, with: String.emptyString)
            let camel = connected.replacingOccurrences(of: String.newLineString, with: String.emptyString)
            let rest = String(camel.dropFirst())
            return first + rest
        }
        let rest = String(source.dropFirst())
        return first + rest
    }
    
    /// UtilityFramework: Check if string contains one or more emojis.
    public var containsEmoji: Bool {
        for scalar in unicodeScalars {
            switch scalar.value {
            case 0x3030, 0x00AE, 0x00A9, // Special Characters
            0x1D000...0x1F77F, // Emoticons
            0x2100...0x27BF, // Misc symbols and Dingbats
            0xFE00...0xFE0F, // Variation Selectors
            0x1F900...0x1F9FF: // Supplemental Symbols and Pictographs
                return true
            default:
                continue
            }
        }
        return false
    }
    
    /// UtilityFramework: String encoded in base64 (if applicable).
    public var base64Encoded: String? {
        let plainData = data(using: .utf8)
        return plainData?.base64EncodedString()
    }
    
    /// UtilityFramework: String decoded from base64 (if applicable).
    public var base64Decoded: String? {
        guard let decodedData = Data(base64Encoded: self) else { return nil }
        return String(data: decodedData, encoding: .utf8)
    }
    
    /// UtilityFramework: URL escaped string.
    public var urlEncoded: String {
        return addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
    }
    
    /// UtilityFramework: Readable string from a URL string.
    public var urlDecoded: String {
        return removingPercentEncoding ?? self
    }
    
    /// UtilityFramework: Bool value from string (if applicable).
    public var bool: Bool? {
        let selfLowercased = trimmed.lowercased()
        switch selfLowercased {
        case "true", "1":
            return true
        case "false", "0":
            return false
        default:
            return nil
        }
    }
    /// UtilityFramework: returns localized String.
    public var localized: String {
        return NSLocalizedString(self, comment: String.emptyString)
    }
    
    /// UtilityFramework: Latinize string.
    public var latinize: String {
        return folding(options: .diacriticInsensitive, locale: Locale.current)
    }
    
    /// UtilityFramework: Reversed string.
    public var reversed: String {
        let chars: [Character] = reversed()
        return String(chars)
    }
}

//MARK:- String Extension -- String Validation Methods

extension String {
    
    /// UtilityFramework: Returns whether the string is empty or not
    public var isEmptyString: Bool {
        return trimmed.isEmpty
    }
    
    /// UtilityFramework: checks if string is a valid email.
    public var isValidEmail: Bool {
        let predicate = NSPredicate(format: "SELF MATCHES %@", String.emailRegEx)
        return predicate.evaluate(with: self)
    }
    
    /// UtilityFramework: Check if string is a valid schemed URL.
    public var isValidSchemedUrl: Bool {
        guard let url = URL(string: self) else { return false }
        return url.scheme != nil
    }
    
    /// UtilityFramework: Check if string is a valid https URL.
    public var isValidHttpsUrl: Bool {
        guard let url = URL(string: self) else { return false }
        return url.scheme == String.https
    }
    
    /// UtilityFramework: Check if string is a valid http URL.
    public var isValidHttpUrl: Bool {
        guard let url = URL(string: self) else { return false }
        return url.scheme == String.http
    }
    
    /// UtilityFramework: Check if string is a valid URL.
    public var isValidUrl: Bool {
        return URL(string: self) != nil
    }
    
    /// UtilityFramework: Check if string is a valid file URL.
    public var isValidFileUrl: Bool {
        return URL(string: self)?.isFileURL ?? false
    }
    
    #if os(iOS) || os(tvOS)
    
    /// UtilityFramework: Check if the given string spelled correctly
    public var isSpelledCorrectly: Bool {
        let checker = UITextChecker()
        let range = NSRange(location: 0, length: utf16.count)
        
        let misspelledRange = checker.rangeOfMisspelledWord(in: self, range: range, startingAt: 0, wrap: false, language: Locale.preferredLanguages.first ?? "en")
        return misspelledRange.location == NSNotFound
    }
    #endif
}

//MARK:- String Extension -- Utility Methods

extension String {
    /**
     UtilityFramework: dymic height in respect to a specific UIFont and a particular width.
     
     - Parameter font: UIFont used in the string.
     - Parameter width: Width of the label.
     
     - Returns: height of the dynamic text.
     */
    func getDynamicHeightForFont(_ font: UIFont, andWidth width: CGFloat) -> CGFloat {
        let rect = CGSize(width: width, height: .greatestFiniteMagnitude)
        let boundingRect = self.boundingRect(with: rect, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil)
        return boundingRect.height
    }
    
    /**
     UtilityFramework: dymic width in respect to a specific UIFont and a particular height.
     
     - Parameter font: UIFont used in the string.
     - Parameter height: Height of the label.
     
     - Returns: width of the dynamic text.
     */
    func getDynamicWidthForFont(_ font: UIFont, andHeight height: CGFloat) -> CGFloat {
        let rect = CGSize(width: .greatestFiniteMagnitude, height: height )
        let boundingRect = self.boundingRect(with: rect, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil)
        return boundingRect.width
    }
    
    /**
     UtilityFramework: Lorem ipsum string of given length.
     
     - Parameter length: number of characters to limit lorem ipsum to (default is 445 - full lorem ipsum).
     
     - Returns: Lorem ipsum dolor sit amet... string.
     */
    public static func staticLoremIpsumText(ofLength length: Int = 445) -> String {
        guard length > 0 else { return "" }
        let loremIpsum = """
        Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
        """
        if loremIpsum.count > length {
            return String(loremIpsum[loremIpsum.startIndex..<loremIpsum.index(loremIpsum.startIndex, offsetBy: length)])
        }
        return loremIpsum
    }
    
    #if os(iOS) || os(macOS)
    /**
     UtilityFramework: Copies the given string to Paste Board.
     */
    public func copyToPasteboard() {
        #if os(iOS)
        UIPasteboard.general.string = self
        #elseif os(macOS)
        NSPasteboard.general.clearContents()
        NSPasteboard.general.setString(self, forType: .string)
        #endif
    }
    #endif
    
    /**
     UtilityFramework: Verify if string matches the regex pattern.
     
     - Parameter pattern: Pattern to verify.
     
     - Returns: true if string matches the pattern.
     */
    public func matches(pattern: String) -> Bool {
        return range(of: pattern, options: .regularExpression, range: nil, locale: nil) != nil
    }
}

//MARK:- String Extension -- String Manipulation Methods

extension String {
    
    /// UtilityFramework: Returns a trimmed version of the String by removing white space & new line.
    public var trimmed: String {
        return trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
    /// UtilityFramework: Returns a reformatted paragraph by removing uneven white-spaces & new lines. It will truncate more than one consecutive new lines and white spaces. It also removes white spaces and new line from start & end of the string.
    public var reformattedParagraphByRemovingExtraWhiteSpacesAndNewLines: String {
        var charactersArray = [Character]()
        forEach { (character) in
            if charactersArray.count != 0 {
                let lastCharacter = charactersArray.last
                if character == Character.whiteSpaceCharacter {
                    if lastCharacter != Character.whiteSpaceCharacter && lastCharacter != Character.newLineCharacter {
                        charactersArray.append(character)
                    }
                } else if character == Character.newLineCharacter {
                    if lastCharacter != Character.newLineCharacter && lastCharacter != Character.whiteSpaceCharacter {
                        charactersArray.append(character)
                    }
                }else {
                    charactersArray.append(character)
                }
            } else {
                charactersArray.append(character)
            }
        }
        let requiredStr = String(charactersArray).trimmed
        return requiredStr
    }
}

//MARK:- String Extension -- Returns Directory

extension String {
    
    /// UtilityFramework: Returns the Applications Directory
    public static var applicationDirectory: String {
        return NSSearchPathForDirectoriesInDomains(.applicationDirectory, .userDomainMask, true)[0]
    }
    
    /// UtilityFramework: Returns the Demo Application Directory
    public static var demoApplicationDirectory: String {
        return NSSearchPathForDirectoriesInDomains(.demoApplicationDirectory, .userDomainMask, true)[0]
    }
    
    /// UtilityFramework: Returns the Developer Application Directory
    public static var developerApplicationDirectory: String {
        return NSSearchPathForDirectoriesInDomains(.developerApplicationDirectory, .userDomainMask, true)[0]
    }
    
    /// UtilityFramework: Returns the Admin Application Directory
    public static var adminApplicationDirectory: String {
        return NSSearchPathForDirectoriesInDomains(.adminApplicationDirectory, .userDomainMask, true)[0]
    }
    
    /// UtilityFramework: Returns the Library Directory
    public static var libraryDirectory: String {
        return NSSearchPathForDirectoriesInDomains(.libraryDirectory, .userDomainMask, true)[0]
    }
    
    /// UtilityFramework: Returns the Developer Directory
    public static var developerDirectory: String {
        return NSSearchPathForDirectoriesInDomains(.developerDirectory, .userDomainMask, true)[0]
    }
    
    /// UtilityFramework: Returns the User Directory Directory
    public static var userDirectory: String {
        return NSSearchPathForDirectoriesInDomains(.userDirectory, .userDomainMask, true)[0]
    }
    
    /// UtilityFramework: Returns the Documentation Directory
    public static var documentationDirectory: String {
        return NSSearchPathForDirectoriesInDomains(.documentationDirectory, .userDomainMask, true)[0]
    }
    
    /// UtilityFramework: Returns the Document Directory
    public static var documentDirectory: String {
        return NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
    }
    
    /// UtilityFramework: Returns the Core Service Directory
    public static var coreServiceDirectory: String {
        return NSSearchPathForDirectoriesInDomains(.coreServiceDirectory, .userDomainMask, true)[0]
    }
    
    /// UtilityFramework: Returns the Autosaved Information Directory
    public static var autosavedInformationDirectory: String {
        return NSSearchPathForDirectoriesInDomains(.autosavedInformationDirectory, .userDomainMask, true)[0]
    }
    
    /// UtilityFramework: Returns the Desktop Directory
    public static var desktopDirectory: String {
        return NSSearchPathForDirectoriesInDomains(.desktopDirectory, .userDomainMask, true)[0]
    }
    
    /// UtilityFramework: Returns the Caches Directory
    public static var cachesDirectory: String {
        return NSSearchPathForDirectoriesInDomains(.cachesDirectory, .userDomainMask, true)[0]
    }
    
    /// UtilityFramework: Returns the Applications Support Directory
    public static var applicationSupportDirectory: String {
        return NSSearchPathForDirectoriesInDomains(.applicationSupportDirectory, .userDomainMask, true)[0]
    }
    
    /// UtilityFramework: Returns the Downloads Directory
    public static var downloadsDirectory: String {
        return NSSearchPathForDirectoriesInDomains(.downloadsDirectory, .userDomainMask, true)[0]
    }
    
    /// UtilityFramework: Returns the Input Methods Directory
    public static var inputMethodsDirectory: String {
        return NSSearchPathForDirectoriesInDomains(.inputMethodsDirectory, .userDomainMask, true)[0]
    }
    
    /// UtilityFramework: Returns the Movies Directory
    public static var moviesDirectory: String {
        return NSSearchPathForDirectoriesInDomains(.moviesDirectory, .userDomainMask, true)[0]
    }
    
    /// UtilityFramework: Returns the Music Directory
    public static var musicDirectory: String {
        return NSSearchPathForDirectoriesInDomains(.musicDirectory, .userDomainMask, true)[0]
    }
    
    /// UtilityFramework: Returns the Pictures Directory
    public static var picturesDirectory: String {
        return NSSearchPathForDirectoriesInDomains(.picturesDirectory, .userDomainMask, true)[0]
    }
    
    /// UtilityFramework: Returns the Printer  Description Directory
    public static var printerDescriptionDirectory: String {
        return NSSearchPathForDirectoriesInDomains(.printerDescriptionDirectory, .userDomainMask, true)[0]
    }
    
    /// UtilityFramework: Returns the Shared Public Directory
    public static var sharedPublicDirectory: String {
        return NSSearchPathForDirectoriesInDomains(.sharedPublicDirectory, .userDomainMask, true)[0]
    }
    
    /// UtilityFramework: Returns the Preference Panes Directory
    public static var preferencePanesDirectory: String {
        return NSSearchPathForDirectoriesInDomains(.preferencePanesDirectory, .userDomainMask, true)[0]
    }
    
    /// UtilityFramework: Returns the Item Replacement Directory
    public static var itemReplacementDirectory: String {
        return NSSearchPathForDirectoriesInDomains(.itemReplacementDirectory, .userDomainMask, true)[0]
    }
    
    /// UtilityFramework: Returns the All Applications Directory
    public static var allApplicationsDirectory: String {
        return NSSearchPathForDirectoriesInDomains(.allApplicationsDirectory, .userDomainMask, true)[0]
    }
    
    /// UtilityFramework: Returns the All Libraries Directory
    public static var allLibrariesDirectory: String {
        return NSSearchPathForDirectoriesInDomains(.allLibrariesDirectory, .userDomainMask, true)[0]
    }
    
    /// UtilityFramework: Returns the Trash Directory
    public static var trashDirectory: String {
        return NSSearchPathForDirectoriesInDomains(.trashDirectory, .userDomainMask, true)[0]
    }
}
