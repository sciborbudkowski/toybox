import UIKit

extension UIFont {

    public enum QuicksandFontType: String {
        case bold = "-Bold"
        case light = "-Light"
        case medium = "-Medium"
        case regular = "-Regular"
        case semiBold = "-SemiBold"
    }

    static func FontQuicksand(_ type: QuicksandFontType = .regular, ofSize: CGFloat = UIFont.systemFontSize) -> UIFont {
        return UIFont(name: "Quicksand\(type.rawValue)", size: ofSize)!
    }

    public enum KarlaFontType: String {
        case bold = "-Bold"
        case boldItalic = "-BoldItalic"
        case extraBold = "-ExtraBold"
        case extraBoldItalic = "-ExtraBoldItalic"
        case extraLight = "-ExtraLight"
        case extraLightItalic = "-ExtraLightItalic"
        case italic = "-Italic"
        case ligth = "-Light"
        case lightItalic = "-LightItalic"
        case medium = "-Medium"
        case mediumItalic = "-MediumItalic"
        case regular = "-Regular"
        case semiBold = "-SemiBold"
        case semiBoldItalic = "-SemiBoldItalic"
    }

    static func FontKarla(_ type: KarlaFontType = .regular, ofSize: CGFloat = UIFont.systemFontSize) -> UIFont {
        return UIFont(name: "Karla\(type.rawValue)", size: ofSize)!
    }
}

