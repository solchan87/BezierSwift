//
//  BezierColor.swift
//
//
//  Created by Tom on 4/24/24.
//

import SwiftUI
import UIKit

public protocol ColorTokenType {
  /// 색상을 나타내는 HEX 문자열 (예: "#FFFFFF", "#FFFFFFFF").
  var hex: String { get }
}

public protocol ThemeableColorTokenType {
  /// 색상을 나타내는 HEX 문자열 (예: "#FFFFFF", "#FFFFFFFF").
  var lightColorHex: String { get }
  /// 색상을 나타내는 HEX 문자열 (예: "#FFFFFF", "#FFFFFFFF").
  var darkColorHex: String { get }
}

public protocol BezierColorType {
  var lightColorToken: ColorTokenType { get }
  var darkColorToken: ColorTokenType { get }
  var pressedColorToken: ThemeableColorTokenType { get }
}

public struct BezierColor {
  private let bezierColor: BezierColorType
  
  public init(bezierColor: BezierColorType) {
    self.bezierColor = bezierColor
  }
  
  private init(functionalColorToken: FunctionalColorToken) {
    self.bezierColor = functionalColorToken
  }
  
  private init(semanticToken: SemanticColorToken) {
    self.bezierColor = semanticToken
  }
  
  public var color: Color {
    return Color(self.uiColor)
  }
  
  public var pressedColor: Color {
    return Color(self.pressedUiColor)
  }
  
  public var uiColor: UIColor {
    return UIColor { traitCollection in
      switch traitCollection.userInterfaceStyle {
      case .light:
        return UIColor(hex: self.bezierColor.lightColorToken.hex)
      case .dark:
        return UIColor(hex: self.bezierColor.darkColorToken.hex)
      default:
        return UIColor(hex: self.bezierColor.lightColorToken.hex)
      }
    }
  }
  
  public var pressedUiColor: UIColor {
    return UIColor { traitCollection in
      switch traitCollection.userInterfaceStyle {
      case .light:
        return UIColor(hex: self.bezierColor.pressedColorToken.lightColorHex)
      case .dark:
        return UIColor(hex: self.bezierColor.pressedColorToken.darkColorHex)
      default:
        return UIColor(hex: self.bezierColor.pressedColorToken.lightColorHex)
      }
    }
  }
  
  public var cgColor: CGColor {
    return self.uiColor.cgColor
  }
  
  public var pressedCgColor: CGColor {
    return self.pressedUiColor.cgColor
  }
}

extension BezierColor: Equatable {
  public static func == (lhs: BezierColor, rhs: BezierColor) -> Bool {
    lhs.bezierColor.lightColorToken.hex == rhs.bezierColor.lightColorToken.hex
    && lhs.bezierColor.darkColorToken.hex == rhs.bezierColor.darkColorToken.hex
  }
}

//MARK: - FunctionalColorToken
extension BezierColor {
  // MARK: ForegroundBlue
  public static var fgBlueNormal: BezierColor { BezierColor(functionalColorToken: .fgBlueNormal) }
  public static var fgBlueLight: BezierColor { BezierColor(functionalColorToken: .fgBlueLight) }
  public static var fgBlueDark: BezierColor { BezierColor(functionalColorToken: .fgBlueDark) }

  // MARK: ForegroundCobalt
  public static var fgCobaltNormal: BezierColor { BezierColor(functionalColorToken: .fgCobaltNormal) }
  public static var fgCobaltLight: BezierColor { BezierColor(functionalColorToken: .fgCobaltLight) }
  public static var fgCobaltDark: BezierColor { BezierColor(functionalColorToken: .fgCobaltDark) }

  // MARK: ForegroundRed
  public static var fgRedNormal: BezierColor { BezierColor(functionalColorToken: .fgRedNormal) }
  public static var fgRedLight: BezierColor { BezierColor(functionalColorToken: .fgRedLight) }
  public static var fgRedDark: BezierColor { BezierColor(functionalColorToken: .fgRedDark) }

  // MARK: ForegroundOrange
  public static var fgOrangeNormal: BezierColor { BezierColor(functionalColorToken: .fgOrangeNormal) }
  public static var fgOrangeLight: BezierColor { BezierColor(functionalColorToken: .fgOrangeLight) }
  public static var fgOrangeDark: BezierColor { BezierColor(functionalColorToken: .fgOrangeDark) }

  // MARK: ForegroundGreen
  public static var fgGreenNormal: BezierColor { BezierColor(functionalColorToken: .fgGreenNormal) }
  public static var fgGreenLight: BezierColor { BezierColor(functionalColorToken: .fgGreenLight) }
  public static var fgGreenDark: BezierColor { BezierColor(functionalColorToken: .fgGreenDark) }

  // MARK: ForegroundTeal
  public static var fgTealNormal: BezierColor { BezierColor(functionalColorToken: .fgTealNormal) }
  public static var fgTealLight: BezierColor { BezierColor(functionalColorToken: .fgTealLight) }
  public static var fgTealDark: BezierColor { BezierColor(functionalColorToken: .fgTealDark) }

  // MARK: ForegroundOlive
  public static var fgOliveNormal: BezierColor { BezierColor(functionalColorToken: .fgOliveNormal) }
  public static var fgOliveLight: BezierColor { BezierColor(functionalColorToken: .fgOliveLight) }
  public static var fgOliveDark: BezierColor { BezierColor(functionalColorToken: .fgOliveDark) }

  // MARK: ForegroundYellow
  public static var fgYellowNormal: BezierColor { BezierColor(functionalColorToken: .fgYellowNormal) }
  public static var fgYellowLight: BezierColor { BezierColor(functionalColorToken: .fgYellowLight) }
  public static var fgYellowDark: BezierColor { BezierColor(functionalColorToken: .fgYellowDark) }

  // MARK: ForegroundPink
  public static var fgPinkNormal: BezierColor { BezierColor(functionalColorToken: .fgPinkNormal) }
  public static var fgPinkLight: BezierColor { BezierColor(functionalColorToken: .fgPinkLight) }
  public static var fgPinkDark: BezierColor { BezierColor(functionalColorToken: .fgPinkDark) }

  // MARK: ForegroundPurple
  public static var fgPurpleNormal: BezierColor { BezierColor(functionalColorToken: .fgPurpleNormal) }
  public static var fgPurpleLight: BezierColor { BezierColor(functionalColorToken: .fgPurpleLight) }
  public static var fgPurpleDark: BezierColor { BezierColor(functionalColorToken: .fgPurpleDark) }

  // MARK: ForegroundNavy
  public static var fgNavyNormal: BezierColor { BezierColor(functionalColorToken: .fgNavyNormal) }
  public static var fgNavyLight: BezierColor { BezierColor(functionalColorToken: .fgNavyLight) }
  public static var fgNavyDark: BezierColor { BezierColor(functionalColorToken: .fgNavyDark) }

  // MARK: ForegroundGrey
  public static var fgGreyDarkest: BezierColor { BezierColor(functionalColorToken: .fgGreyDarkest) }
  public static var fgGreyDark: BezierColor { BezierColor(functionalColorToken: .fgGreyDark) }
  public static var fgGreyNormal: BezierColor { BezierColor(functionalColorToken: .fgGreyNormal) }
  public static var fgGreyLight: BezierColor { BezierColor(functionalColorToken: .fgGreyLight) }
  public static var fgGreyLighter: BezierColor { BezierColor(functionalColorToken: .fgGreyLighter) }
  public static var fgGreyLightest: BezierColor { BezierColor(functionalColorToken: .fgGreyLightest) }

  // MARK: ForegroundGreyAlpha
  public static var fgGreyAlphaDarkest: BezierColor { BezierColor(functionalColorToken: .fgGreyAlphaDarkest) }
  public static var fgGreyAlphaDarker: BezierColor { BezierColor(functionalColorToken: .fgGreyAlphaDarker) }
  public static var fgGreyAlphaDark: BezierColor { BezierColor(functionalColorToken: .fgGreyAlphaDark) }
  public static var fgGreyAlphaLight: BezierColor { BezierColor(functionalColorToken: .fgGreyAlphaLight) }

  // MARK: ForegroundWhite
  public static var fgWhiteNormal: BezierColor { BezierColor(functionalColorToken: .fgWhiteNormal) }

  // MARK: ForegroundBlack
  public static var fgBlackLightest: BezierColor { BezierColor(functionalColorToken: .fgBlackLightest) }
  public static var fgBlackLight: BezierColor { BezierColor(functionalColorToken: .fgBlackLight) }
  public static var fgBlackDark: BezierColor { BezierColor(functionalColorToken: .fgBlackDark) }
  public static var fgBlackDarker: BezierColor { BezierColor(functionalColorToken: .fgBlackDarker) }
  public static var fgBlackDarkest: BezierColor { BezierColor(functionalColorToken: .fgBlackDarkest) }
  public static var fgBlackPure: BezierColor { BezierColor(functionalColorToken: .fgBlackPure) }

  // MARK: ForegroundAbsoluteWhite
  public static var fgAbsoluteWhiteLightest: BezierColor { BezierColor(functionalColorToken: .fgAbsoluteWhiteLightest) }
  public static var fgAbsoluteWhiteLighter: BezierColor { BezierColor(functionalColorToken: .fgAbsoluteWhiteLighter) }
  public static var fgAbsoluteWhiteLight: BezierColor { BezierColor(functionalColorToken: .fgAbsoluteWhiteLight) }
  public static var fgAbsoluteWhiteNormal: BezierColor { BezierColor(functionalColorToken: .fgAbsoluteWhiteNormal) }
  public static var fgAbsoluteWhiteDark: BezierColor { BezierColor(functionalColorToken: .fgAbsoluteWhiteDark) }

  // MARK: ForegroundAbsoluteBlack
  public static var fgAbsoluteBlackLightest: BezierColor { BezierColor(functionalColorToken: .fgAbsoluteBlackLightest) }
  public static var fgAbsoluteBlackLighter: BezierColor { BezierColor(functionalColorToken: .fgAbsoluteBlackLighter) }
  public static var fgAbsoluteBlackLight: BezierColor { BezierColor(functionalColorToken: .fgAbsoluteBlackLight) }
  public static var fgAbsoluteBlackNormal: BezierColor { BezierColor(functionalColorToken: .fgAbsoluteBlackNormal) }
  public static var fgAbsoluteBlackDark: BezierColor { BezierColor(functionalColorToken: .fgAbsoluteBlackDark) }

  // MARK: BackgroundBlue
  public static var bgBlueNormal: BezierColor { BezierColor(functionalColorToken: .bgBlueNormal) }
  public static var bgBlueLight: BezierColor { BezierColor(functionalColorToken: .bgBlueLight) }
  public static var bgBlueLighter: BezierColor { BezierColor(functionalColorToken: .bgBlueLighter) }
  public static var bgBlueLightest: BezierColor { BezierColor(functionalColorToken: .bgBlueLightest) }
  public static var bgBlueDark: BezierColor { BezierColor(functionalColorToken: .bgBlueDark) }
  public static var bgBlueShadeLighter: BezierColor { BezierColor(functionalColorToken: .bgBlueShadeLighter) }
  public static var bgBlueShadeNormal: BezierColor { BezierColor(functionalColorToken: .bgBlueShadeNormal) }
  public static var bgBlueTransparent: BezierColor { BezierColor(functionalColorToken: .bgBlueTransparent) }

  // MARK: BackgroundCobalt
  public static var bgCobaltNormal: BezierColor { BezierColor(functionalColorToken: .bgCobaltNormal) }
  public static var bgCobaltLight: BezierColor { BezierColor(functionalColorToken: .bgCobaltLight) }
  public static var bgCobaltLighter: BezierColor { BezierColor(functionalColorToken: .bgCobaltLighter) }
  public static var bgCobaltLightest: BezierColor { BezierColor(functionalColorToken: .bgCobaltLightest) }
  public static var bgCobaltDark: BezierColor { BezierColor(functionalColorToken: .bgCobaltDark) }
  public static var bgCobaltShadeLighter: BezierColor { BezierColor(functionalColorToken: .bgCobaltShadeLighter) }
  public static var bgCobaltShadeNormal: BezierColor { BezierColor(functionalColorToken: .bgCobaltShadeNormal) }
  public static var bgCobaltTransparent: BezierColor { BezierColor(functionalColorToken: .bgCobaltTransparent) }

  // MARK: BackgroundRed
  public static var bgRedNormal: BezierColor { BezierColor(functionalColorToken: .bgRedNormal) }
  public static var bgRedLight: BezierColor { BezierColor(functionalColorToken: .bgRedLight) }
  public static var bgRedLighter: BezierColor { BezierColor(functionalColorToken: .bgRedLighter) }
  public static var bgRedLightest: BezierColor { BezierColor(functionalColorToken: .bgRedLightest) }
  public static var bgRedDark: BezierColor { BezierColor(functionalColorToken: .bgRedDark) }
  public static var bgRedShadeLighter: BezierColor { BezierColor(functionalColorToken: .bgRedShadeLighter) }
  public static var bgRedShadeNormal: BezierColor { BezierColor(functionalColorToken: .bgRedShadeNormal) }
  public static var bgRedTransparent: BezierColor { BezierColor(functionalColorToken: .bgRedTransparent) }

  // MARK: BackgroundOrange
  public static var bgOrangeNormal: BezierColor { BezierColor(functionalColorToken: .bgOrangeNormal) }
  public static var bgOrangeLight: BezierColor { BezierColor(functionalColorToken: .bgOrangeLight) }
  public static var bgOrangeLighter: BezierColor { BezierColor(functionalColorToken: .bgOrangeLighter) }
  public static var bgOrangeLightest: BezierColor { BezierColor(functionalColorToken: .bgOrangeLightest) }
  public static var bgOrangeDark: BezierColor { BezierColor(functionalColorToken: .bgOrangeDark) }
  public static var bgOrangeShadeLighter: BezierColor { BezierColor(functionalColorToken: .bgOrangeShadeLighter) }
  public static var bgOrangeShadeNormal: BezierColor { BezierColor(functionalColorToken: .bgOrangeShadeNormal) }
  public static var bgOrangeTransparent: BezierColor { BezierColor(functionalColorToken: .bgOrangeTransparent) }

  // MARK: BackgroundGreen
  public static var bgGreenNormal: BezierColor { BezierColor(functionalColorToken: .bgGreenNormal) }
  public static var bgGreenLight: BezierColor { BezierColor(functionalColorToken: .bgGreenLight) }
  public static var bgGreenLighter: BezierColor { BezierColor(functionalColorToken: .bgGreenLighter) }
  public static var bgGreenLightest: BezierColor { BezierColor(functionalColorToken: .bgGreenLightest) }
  public static var bgGreenDark: BezierColor { BezierColor(functionalColorToken: .bgGreenDark) }
  public static var bgGreenShadeLighter: BezierColor { BezierColor(functionalColorToken: .bgGreenShadeLighter) }
  public static var bgGreenShadeNormal: BezierColor { BezierColor(functionalColorToken: .bgGreenShadeNormal) }
  public static var bgGreenTransparent: BezierColor { BezierColor(functionalColorToken: .bgGreenTransparent) }

  // MARK: BackgroundTeal
  public static var bgTealNormal: BezierColor { BezierColor(functionalColorToken: .bgTealNormal) }
  public static var bgTealLight: BezierColor { BezierColor(functionalColorToken: .bgTealLight) }
  public static var bgTealLighter: BezierColor { BezierColor(functionalColorToken: .bgTealLighter) }
  public static var bgTealLightest: BezierColor { BezierColor(functionalColorToken: .bgTealLightest) }
  public static var bgTealDark: BezierColor { BezierColor(functionalColorToken: .bgTealDark) }
  public static var bgTealShadeLighter: BezierColor { BezierColor(functionalColorToken: .bgTealShadeLighter) }
  public static var bgTealShadeNormal: BezierColor { BezierColor(functionalColorToken: .bgTealShadeNormal) }
  public static var bgTealTransparent: BezierColor { BezierColor(functionalColorToken: .bgTealTransparent) }

  // MARK: BackgroundOlive
  public static var bgOliveNormal: BezierColor { BezierColor(functionalColorToken: .bgOliveNormal) }
  public static var bgOliveLight: BezierColor { BezierColor(functionalColorToken: .bgOliveLight) }
  public static var bgOliveLighter: BezierColor { BezierColor(functionalColorToken: .bgOliveLighter) }
  public static var bgOliveLightest: BezierColor { BezierColor(functionalColorToken: .bgOliveLightest) }
  public static var bgOliveDark: BezierColor { BezierColor(functionalColorToken: .bgOliveDark) }
  public static var bgOliveShadeLighter: BezierColor { BezierColor(functionalColorToken: .bgOliveShadeLighter) }
  public static var bgOliveShadeNormal: BezierColor { BezierColor(functionalColorToken: .bgOliveShadeNormal) }
  public static var bgOliveTransparent: BezierColor { BezierColor(functionalColorToken: .bgOliveTransparent) }

  // MARK: BackgroundYellow
  public static var bgYellowNormal: BezierColor { BezierColor(functionalColorToken: .bgYellowNormal) }
  public static var bgYellowLight: BezierColor { BezierColor(functionalColorToken: .bgYellowLight) }
  public static var bgYellowLighter: BezierColor { BezierColor(functionalColorToken: .bgYellowLighter) }
  public static var bgYellowLightest: BezierColor { BezierColor(functionalColorToken: .bgYellowLightest) }
  public static var bgYellowDark: BezierColor { BezierColor(functionalColorToken: .bgYellowDark) }
  public static var bgYellowShadeLighter: BezierColor { BezierColor(functionalColorToken: .bgYellowShadeLighter) }
  public static var bgYellowShadeNormal: BezierColor { BezierColor(functionalColorToken: .bgYellowShadeNormal) }
  public static var bgYellowTransparent: BezierColor { BezierColor(functionalColorToken: .bgYellowTransparent) }

  // MARK: BackgroundPink
  public static var bgPinkNormal: BezierColor { BezierColor(functionalColorToken: .bgPinkNormal) }
  public static var bgPinkLight: BezierColor { BezierColor(functionalColorToken: .bgPinkLight) }
  public static var bgPinkLighter: BezierColor { BezierColor(functionalColorToken: .bgPinkLighter) }
  public static var bgPinkLightest: BezierColor { BezierColor(functionalColorToken: .bgPinkLightest) }
  public static var bgPinkDark: BezierColor { BezierColor(functionalColorToken: .bgPinkDark) }
  public static var bgPinkShadeLighter: BezierColor { BezierColor(functionalColorToken: .bgPinkShadeLighter) }
  public static var bgPinkShadeNormal: BezierColor { BezierColor(functionalColorToken: .bgPinkShadeNormal) }
  public static var bgPinkTransparent: BezierColor { BezierColor(functionalColorToken: .bgPinkTransparent) }

  // MARK: BackgroundPurple
  public static var bgPurpleNormal: BezierColor { BezierColor(functionalColorToken: .bgPurpleNormal) }
  public static var bgPurpleLight: BezierColor { BezierColor(functionalColorToken: .bgPurpleLight) }
  public static var bgPurpleLighter: BezierColor { BezierColor(functionalColorToken: .bgPurpleLighter) }
  public static var bgPurpleLightest: BezierColor { BezierColor(functionalColorToken: .bgPurpleLightest) }
  public static var bgPurpleDark: BezierColor { BezierColor(functionalColorToken: .bgPurpleDark) }
  public static var bgPurpleShadeLighter: BezierColor { BezierColor(functionalColorToken: .bgPurpleShadeLighter) }
  public static var bgPurpleShadeNormal: BezierColor { BezierColor(functionalColorToken: .bgPurpleShadeNormal) }
  public static var bgPurpleTransparent: BezierColor { BezierColor(functionalColorToken: .bgPurpleTransparent) }

  // MARK: - BackgroundNavy
  public static var bgNavyNormal: BezierColor { BezierColor(functionalColorToken: .bgNavyNormal) }
  public static var bgNavyLight: BezierColor { BezierColor(functionalColorToken: .bgNavyLight) }
  public static var bgNavyLighter: BezierColor { BezierColor(functionalColorToken: .bgNavyLighter) }
  public static var bgNavyLightest: BezierColor { BezierColor(functionalColorToken: .bgNavyLightest) }
  public static var bgNavyDark: BezierColor { BezierColor(functionalColorToken: .bgNavyDark) }
  public static var bgNavyShadeLighter: BezierColor { BezierColor(functionalColorToken: .bgNavyShadeLighter) }
  public static var bgNavyShadeNormal: BezierColor { BezierColor(functionalColorToken: .bgNavyShadeNormal) }
  public static var bgNavyTransparent: BezierColor { BezierColor(functionalColorToken: .bgNavyTransparent) }

  // MARK: BackgroundGrey
  public static var bgGreyDarkest: BezierColor { BezierColor(functionalColorToken: .bgGreyDarkest) }
  public static var bgGreyDark: BezierColor { BezierColor(functionalColorToken: .bgGreyDark) }
  public static var bgGreyNormal: BezierColor { BezierColor(functionalColorToken: .bgGreyNormal) }
  public static var bgGreyLight: BezierColor { BezierColor(functionalColorToken: .bgGreyLight) }
  public static var bgGreyLighter: BezierColor { BezierColor(functionalColorToken: .bgGreyLighter) }
  public static var bgGreyLightest: BezierColor { BezierColor(functionalColorToken: .bgGreyLightest) }
  public static var bgGreyTransparent: BezierColor { BezierColor(functionalColorToken: .bgGreyTransparent) }

  // MARK: BackgroundGreyAlpha
  public static var bgGreyAlphaDarkest: BezierColor { BezierColor(functionalColorToken: .bgGreyAlphaDarkest) }
  public static var bgGreyAlphaDarker: BezierColor { BezierColor(functionalColorToken: .bgGreyAlphaDarker) }
  public static var bgGreyAlphaDark: BezierColor { BezierColor(functionalColorToken: .bgGreyAlphaDark) }
  public static var bgGreyAlphaLight: BezierColor { BezierColor(functionalColorToken: .bgGreyAlphaLight) }

  // MARK: BackgroundBlack
  public static var bgBlackDarkest: BezierColor { BezierColor(functionalColorToken: .bgBlackDarkest) }
  public static var bgBlackDarker: BezierColor { BezierColor(functionalColorToken: .bgBlackDarker) }
  public static var bgBlackDark: BezierColor { BezierColor(functionalColorToken: .bgBlackDark) }
  public static var bgBlackLight: BezierColor { BezierColor(functionalColorToken: .bgBlackLight) }
  public static var bgBlackLighter: BezierColor { BezierColor(functionalColorToken: .bgBlackLighter) }
  public static var bgBlackLightest: BezierColor { BezierColor(functionalColorToken: .bgBlackLightest) }
  public static var bgBlackTransparent: BezierColor { BezierColor(functionalColorToken: .bgBlackTransparent) }

  // MARK: BackgroundWhite
  public static var bgWhiteHighest: BezierColor { BezierColor(functionalColorToken: .bgWhiteHighest) }
  public static var bgWhiteHigher: BezierColor { BezierColor(functionalColorToken: .bgWhiteHigher) }
  public static var bgWhiteNormal: BezierColor { BezierColor(functionalColorToken: .bgWhiteNormal) }
  public static var bgWhiteTransparent: BezierColor { BezierColor(functionalColorToken: .bgWhiteTransparent) }

  // MARK: BackgroundWhiteAlpha
  public static var bgWhiteAlphaLightest: BezierColor { BezierColor(functionalColorToken: .bgWhiteAlphaLightest) }
  public static var bgWhiteAlphaLighter: BezierColor { BezierColor(functionalColorToken: .bgWhiteAlphaLighter) }
  public static var bgWhiteAlphaLight: BezierColor { BezierColor(functionalColorToken: .bgWhiteAlphaLight) }
  public static var bgWhiteAlphaTransparent: BezierColor { BezierColor(functionalColorToken: .bgWhiteAlphaTransparent) }

  // MARK: BackgroundAbsoluteBlack
  public static var bgAbsoluteBlackDark: BezierColor { BezierColor(functionalColorToken: .bgAbsoluteBlackDark) }
  public static var bgAbsoluteBlackNormal: BezierColor { BezierColor(functionalColorToken: .bgAbsoluteBlackNormal) }
  public static var bgAbsoluteBlackLight: BezierColor { BezierColor(functionalColorToken: .bgAbsoluteBlackLight) }
  public static var bgAbsoluteBlackLighter: BezierColor { BezierColor(functionalColorToken: .bgAbsoluteBlackLighter) }
  public static var bgAbsoluteBlackLightest: BezierColor { BezierColor(functionalColorToken: .bgAbsoluteBlackLightest) }
  public static var bgAbsoluteBlackTransparent: BezierColor { BezierColor(functionalColorToken: .bgAbsoluteBlackTransparent) }

  // MARK: BackgroundAbsoluteWhite
  public static var bgAbsoluteWhiteDark: BezierColor { BezierColor(functionalColorToken: .bgAbsoluteWhiteDark) }
  public static var bgAbsoluteWhiteNormal: BezierColor { BezierColor(functionalColorToken: .bgAbsoluteWhiteNormal) }
  public static var bgAbsoluteWhiteLight: BezierColor { BezierColor(functionalColorToken: .bgAbsoluteWhiteLight) }
  public static var bgAbsoluteWhiteLighter: BezierColor { BezierColor(functionalColorToken: .bgAbsoluteWhiteLighter) }
  public static var bgAbsoluteWhiteLightest: BezierColor { BezierColor(functionalColorToken: .bgAbsoluteWhiteLightest) }
  public static var bgAbsoluteWhiteTransparent: BezierColor { BezierColor(functionalColorToken: .bgAbsoluteWhiteTransparent) }

  // MARK: Surface
  public static var surfaceLowest: BezierColor { BezierColor(functionalColorToken: .surfaceLowest) }
  public static var surfaceLower: BezierColor { BezierColor(functionalColorToken: .surfaceLower) }
  public static var surfaceNormal: BezierColor { BezierColor(functionalColorToken: .surfaceNormal) }

  // MARK: Shadow
  public static var shadowXlarge: BezierColor { BezierColor(functionalColorToken: .shadowXlarge) }
  public static var shadowLarge: BezierColor { BezierColor(functionalColorToken: .shadowLarge) }
  public static var shadowMedium: BezierColor { BezierColor(functionalColorToken: .shadowMedium) }
  public static var shadowSmall: BezierColor { BezierColor(functionalColorToken: .shadowSmall) }
  public static var shadowBase: BezierColor { BezierColor(functionalColorToken: .shadowBase) }
  public static var shadowBaseInner: BezierColor { BezierColor(functionalColorToken: .shadowBaseInner) }
  
  // MARK: Dim
  public static var dimBlackNormal: BezierColor { BezierColor(functionalColorToken: .dimBlackNormal) }
  public static var dimBlackLight: BezierColor { BezierColor(functionalColorToken: .dimBlackLight) }
}

//MARK: - SemanticColorToken
extension BezierColor {
  // MARK: PrimaryBackground
  public static var primaryBgNormal: BezierColor { BezierColor(semanticToken: .primaryBgNormal) }
  public static var primaryBgLight: BezierColor { BezierColor(semanticToken: .primaryBgLight) }
  public static var primaryBgLighter: BezierColor { BezierColor(semanticToken: .primaryBgLighter) }
  public static var primaryBgLightest: BezierColor { BezierColor(semanticToken: .primaryBgLightest) }
  public static var primaryBgDark: BezierColor { BezierColor(semanticToken: .primaryBgDark) }
  public static var primaryBgTransparent: BezierColor { BezierColor(semanticToken: .primaryBgTransparent) }

  // MARK: PrimaryForeground
  public static var primaryFgNormal: BezierColor { BezierColor(semanticToken: .primaryFgNormal) }
  public static var primaryFgLight: BezierColor { BezierColor(semanticToken: .primaryFgLight) }
  public static var primaryFgDark: BezierColor { BezierColor(semanticToken: .primaryFgDark) }

  // MARK: CriticalBackground
  public static var criticalBgDark: BezierColor { BezierColor(semanticToken: .criticalBgDark) }
  public static var criticalBgNormal: BezierColor { BezierColor(semanticToken: .criticalBgNormal) }
  public static var criticalBgLight: BezierColor { BezierColor(semanticToken: .criticalBgLight) }
  public static var criticalBgLighter: BezierColor { BezierColor(semanticToken: .criticalBgLighter) }
  public static var criticalBgLightest: BezierColor { BezierColor(semanticToken: .criticalBgLightest) }
  public static var criticalBgTransparent: BezierColor { BezierColor(semanticToken: .criticalBgTransparent) }

  // MARK: CriticalForeground
  public static var criticalFgNormal: BezierColor { BezierColor(semanticToken: .criticalFgNormal) }
  public static var criticalFgLight: BezierColor { BezierColor(semanticToken: .criticalFgLight) }
  public static var criticalFgDark: BezierColor { BezierColor(semanticToken: .criticalFgDark) }

  // MARK: WarningBackground
  public static var warningBgDark: BezierColor { BezierColor(semanticToken: .warningBgDark) }
  public static var warningBgNormal: BezierColor { BezierColor(semanticToken: .warningBgNormal) }
  public static var warningBgLight: BezierColor { BezierColor(semanticToken: .warningBgLight) }
  public static var warningBgLighter: BezierColor { BezierColor(semanticToken: .warningBgLighter) }
  public static var warningBgLightest: BezierColor { BezierColor(semanticToken: .warningBgLightest) }
  public static var warningBgTransparent: BezierColor { BezierColor(semanticToken: .warningBgTransparent) }

  // MARK: WarningForeground
  public static var warningFgNormal: BezierColor { BezierColor(semanticToken: .warningFgNormal) }
  public static var warningFgLight: BezierColor { BezierColor(semanticToken: .warningFgLight) }
  public static var warningFgDark: BezierColor { BezierColor(semanticToken: .warningFgDark) }

  // MARK: AccentBackground
  public static var accentBgDark: BezierColor { BezierColor(semanticToken: .accentBgDark) }
  public static var accentBgNormal: BezierColor { BezierColor(semanticToken: .accentBgNormal) }
  public static var accentBgLight: BezierColor { BezierColor(semanticToken: .accentBgLight) }
  public static var accentBgLighter: BezierColor { BezierColor(semanticToken: .accentBgLighter) }
  public static var accentBgLightest: BezierColor { BezierColor(semanticToken: .accentBgLightest) }
  public static var accentBgTransparent: BezierColor { BezierColor(semanticToken: .accentBgTransparent) }

  // MARK: AccentForeground
  public static var accentFgNormal: BezierColor { BezierColor(semanticToken: .accentFgNormal) }
  public static var accentFgLight: BezierColor { BezierColor(semanticToken: .accentFgLight) }
  public static var accentFgDark: BezierColor { BezierColor(semanticToken: .accentFgDark) }

  // MARK: SuccessBackground
  public static var successBgDark: BezierColor { BezierColor(semanticToken: .successBgDark) }
  public static var successBgNormal: BezierColor { BezierColor(semanticToken: .successBgNormal) }
  public static var successBgLight: BezierColor { BezierColor(semanticToken: .successBgLight) }
  public static var successBgLighter: BezierColor { BezierColor(semanticToken: .successBgLighter) }
  public static var successBgLightest: BezierColor { BezierColor(semanticToken: .successBgLightest) }
  public static var successBgTransparent: BezierColor { BezierColor(semanticToken: .successBgTransparent) }

  // MARK: SuccessForeground
  public static var successFgNormal: BezierColor { BezierColor(semanticToken: .successFgNormal) }
  public static var successFgLight: BezierColor { BezierColor(semanticToken: .successFgLight) }
  public static var successFgDark: BezierColor { BezierColor(semanticToken: .successFgDark) }
}

// MARK: - Bezier V1 SemanticColor Support
extension BezierColor {
  // MARK: - Background
  @available(*, deprecated, renamed: "bgWhiteAlphaTransparent", message: "Use `bgWhiteAlphaTransparent` instead.")
  public static var bgTransparent: BezierColor { BezierColor(functionalColorToken: .bgWhiteAlphaTransparent) }
  
  @available(*, deprecated, renamed: "bgWhiteHighest", message: "Use `bgWhiteHighest` instead.")
  public static var bgWhiteHigh: BezierColor { BezierColor(functionalColorToken: .bgWhiteHighest) }
  
  @available(*, deprecated, renamed: "bgWhiteHigher", message: "Use `bgWhiteHigher` instead.")
  public static var bgWhiteLow: BezierColor { BezierColor(functionalColorToken: .bgWhiteHigher) }

  @available(*, deprecated, renamed: "bgWhiteAlphaLighter", message: "Use `bgWhiteAlphaLighter` instead.")
  public static var bgWhiteDimDark: BezierColor { BezierColor(functionalColorToken: .bgWhiteAlphaLighter) }
  
  @available(*, deprecated, renamed: "bgWhiteAlphaLight", message: "Use `bgWhiteAlphaLight` instead.")
  public static var bgWhiteDimLight: BezierColor { BezierColor(functionalColorToken: .bgWhiteAlphaLight) }

  @available(*, deprecated, renamed: "bgGreyAlphaLight", message: "Use `bgGreyAlphaLight` instead.")
  public static var bgGreyDimLightest: BezierColor { BezierColor(functionalColorToken: .bgGreyAlphaLight) }
  
  @available(*, deprecated, renamed: "bgGreyAlphaDarkest", message: "Use `bgGreyAlphaDarkest` instead.")
  public static var bgGnb: BezierColor { BezierColor(functionalColorToken: .bgGreyAlphaDarkest) }
  
  @available(*, deprecated, renamed: "bgGreyAlphaDark", message: "Use `bgGreyAlphaDark` instead.")
  public static var bgNavi: BezierColor { BezierColor(functionalColorToken: .bgGreyAlphaDark) }
  
  @available(*, deprecated, renamed: "bgWhiteAlphaLightest", message: "Use `bgWhiteAlphaLightest` instead.")
  public static var bgHeaderFloat: BezierColor { BezierColor(functionalColorToken: .bgWhiteAlphaLightest) }
  
  @available(*, deprecated, renamed: "bgWhiteHigher", message: "Use `bgWhiteHigher` instead.")
  public static var bgHeader: BezierColor { BezierColor(functionalColorToken: .bgWhiteHigher) }
  
  @available(*, deprecated, renamed: "bgGreyAlphaDarker", message: "Use `bgGreyAlphaDarker` instead.")
  public static var bgLounge: BezierColor { BezierColor(functionalColorToken: .bgGreyAlphaDarker) }
  
  // MARK: - Text
  @available(*, deprecated, renamed: "fgBlackDarkest", message: "Use `fgBlackDarkest` instead.")
  public static var txtBlackDarkest: BezierColor { BezierColor(functionalColorToken: .fgBlackDarkest) }
  
  @available(*, deprecated, renamed: "fgBlackDarker", message: "Use `fgBlackDarker` instead.")
  public static var txtBlackDarker: BezierColor { BezierColor(functionalColorToken: .fgBlackDarker) }
  
  @available(*, deprecated, renamed: "fgBlackDark", message: "Use `fgBlackDark` instead.")
  public static var txtBlackDark: BezierColor { BezierColor(functionalColorToken: .fgBlackDark) }
  
  @available(*, deprecated, renamed: "fgWhiteNormal", message: "Use `fgWhiteNormal` instead.")
  public static var txtWhiteNormal: BezierColor { BezierColor(functionalColorToken: .fgWhiteNormal) }
  
  @available(*, deprecated, renamed: "fgBlackPure", message: "Use `fgBlackPure` instead.")
  public static var txtBlackPure: BezierColor { BezierColor(functionalColorToken: .fgBlackPure) }
  
  // MARK: - Background & Text - Absolute
  @available(*, deprecated, message: "Use `fgAbsoluteBlackDark` for icon and text colors, and `bgAbsoluteBlackDark` for background color instead.")
  public static var bgtxtAbsoluteBlackDark: BezierColor { BezierColor(functionalColorToken: .bgAbsoluteBlackDark) }
  
  @available(*, deprecated, message: "Use `fgAbsoluteBlackNormal` for icon and text colors, and `bgAbsoluteBlackNormal` for background color instead.")
  public static var bgtxtAbsoluteBlackNormal: BezierColor { BezierColor(functionalColorToken: .bgAbsoluteBlackNormal) }
  
  @available(*, deprecated, message: "Use `fgAbsoluteBlackLight` for icon and text colors, and `bgAbsoluteBlackLight` for background color instead.")
  public static var bgtxtAbsoluteBlackLight: BezierColor { BezierColor(functionalColorToken: .bgAbsoluteBlackLight) }
  
  @available(*, deprecated, message: "Use `fgAbsoluteBlackLighter` for icon and text colors, and `bgAbsoluteBlackLighter` for background color instead.")
  public static var bgtxtAbsoluteBlackLighter: BezierColor { BezierColor(functionalColorToken: .bgAbsoluteBlackLighter) }
  
  @available(*, deprecated, message: "Use `fgAbsoluteBlackLightest` for icon and text colors, and `bgAbsoluteBlackLightest` for background color instead.")
  public static var bgtxtAbsoluteBlackLightest: BezierColor { BezierColor(functionalColorToken: .bgAbsoluteBlackLightest) }
  
  @available(*, deprecated, message: "Use `fgAbsoluteWhiteDark` for icon and text colors, and `bgAbsoluteWhiteDark` for background color instead.")
  public static var bgtxtAbsoluteWhiteDark: BezierColor { BezierColor(functionalColorToken: .bgAbsoluteWhiteDark) }
  
  @available(*, deprecated, message: "Use `fgAbsoluteWhiteNormal` for icon and text colors, and `bgAbsoluteWhiteNormal` for background color instead.")
  public static var bgtxtAbsoluteWhiteNormal: BezierColor { BezierColor(functionalColorToken: .bgAbsoluteWhiteNormal) }
  
  @available(*, deprecated, message: "Use `fgAbsoluteWhiteLight` for icon and text colors, and `bgAbsoluteWhiteLight` for background color instead.")
  public static var bgtxtAbsoluteWhiteLight: BezierColor { BezierColor(functionalColorToken: .bgAbsoluteWhiteLight) }
  
  @available(*, deprecated, message: "Use `fgAbsoluteWhiteLighter` for icon and text colors, and `bgAbsoluteWhiteLighter` for background color instead.")
  public static var bgtxtAbsoluteWhiteLighter: BezierColor { BezierColor(functionalColorToken: .bgAbsoluteWhiteLighter) }
  
  @available(*, deprecated, message: "Use `fgAbsoluteWhiteLightest` for icon and text colors, and `bgAbsoluteWhiteLightest` for background color instead.")
  public static var bgtxtAbsoluteWhiteLightest: BezierColor { BezierColor(functionalColorToken: .bgAbsoluteWhiteLightest) }
  
  // MARK: - Shadow for elevation
  @available(*, deprecated, renamed: "shadowXlarge", message: "Use `shadowXlarge` instead.")
  public static var shdwXlarge: BezierColor { BezierColor(functionalColorToken: .shadowXlarge) }
  
  @available(*, deprecated, renamed: "shadowLarge", message: "Use `shadowLarge` instead.")
  public static var shdwLarge: BezierColor { BezierColor(functionalColorToken: .shadowLarge) }
  
  @available(*, deprecated, renamed: "shadowMedium", message: "Use `shadowMedium` instead.")
  public static var shdwMedium: BezierColor { BezierColor(functionalColorToken: .shadowMedium) }
  
  @available(*, deprecated, renamed: "shadowSmall", message: "Use `shadowSmall` instead.")
  public static var shdwSmall: BezierColor { BezierColor(functionalColorToken: .shadowSmall) }
  
  @available(*, deprecated, renamed: "shadowBase", message: "Use `shadowBase` instead.")
  public static var shdwBase: BezierColor { BezierColor(functionalColorToken: .shadowBase) }
  
  @available(*, deprecated, renamed: "shadowBaseInner", message: "Use `shadowBaseInner` instead.")
  public static var shdwBaseInner: BezierColor { BezierColor(functionalColorToken: .shadowBaseInner) }
  
  // MARK: - Border & Divider
  @available(*, deprecated, renamed: "bgBlackDark", message: "Use `bgBlackDark` instead.")
  public static var bdrBlackDark: BezierColor { BezierColor(functionalColorToken: .bgBlackDark) }
  
  @available(*, deprecated, renamed: "bgBlackLight", message: "Use `bgBlackLight` instead.")
  public static var bdrBlackLight: BezierColor { BezierColor(functionalColorToken: .bgBlackLight) }
  
  @available(*, deprecated, renamed: "bgBlackLightest", message: "Use `bgBlackLightest` instead.")
  public static var bdrBlackLightest: BezierColor { BezierColor(functionalColorToken: .bgBlackLightest) }
  
  @available(*, deprecated, renamed: "bgGreyLight", message: "Use `bgGreyLight` instead.")
  public static var bdrGreyLight: BezierColor { BezierColor(functionalColorToken: .bgGreyLight) }
  
  @available(*, deprecated, renamed: "bgWhiteHighest", message: "Use `bgWhiteHighest` instead.")
  public static var bdrWhite: BezierColor { BezierColor(functionalColorToken: .bgWhiteHighest) }
  
  // MARK: - Appendix, Blue
  @available(*, deprecated, message: "Use `fgBlueLightest` for icon and text colors, and `bgBlueLightest` for background color instead.")
  public static var bgtxtBlueLightest: BezierColor { BezierColor(functionalColorToken: .bgBlueLightest) }
  
  @available(*, deprecated, message: "Use `fgBlueLighter` for icon and text colors, and `bgBlueLighter` for background color instead.")
  public static var bgtxtBlueLighter: BezierColor { BezierColor(functionalColorToken: .bgBlueLighter) }
  
  @available(*, deprecated, message: "Use `fgBlueLight` for icon and text colors, and `bgBlueLight` for background color instead.")
  public static var bgtxtBlueLight: BezierColor { BezierColor(functionalColorToken: .bgBlueLight) }
  
  @available(*, deprecated, message: "Use `fgBlueNormal` for icon and text colors, and `bgBlueNormal` for background color instead.")
  public static var bgtxtBlueNormal: BezierColor { BezierColor(functionalColorToken: .bgBlueNormal) }
  
  @available(*, deprecated, message: "Use `fgBlueDark` for icon and text colors, and `bgBlueDark` for background color instead.")
  public static var bgtxtBlueDark: BezierColor { BezierColor(functionalColorToken: .bgBlueDark) }
  
  // MARK: - Appendix, Cobalt
  @available(*, deprecated, message: "Use `fgCobaltLightest` for icon and text colors, and `bgCobaltLightest` for background color instead.")
  public static var bgtxtCobaltLightest: BezierColor { BezierColor(functionalColorToken: .bgCobaltLightest) }
  
  @available(*, deprecated, message: "Use `fgCobaltLighter` for icon and text colors, and `bgCobaltLighter` for background color instead.")
  public static var bgtxtCobaltLighter: BezierColor { BezierColor(functionalColorToken: .bgCobaltLighter) }
  
  @available(*, deprecated, message: "Use `fgCobaltLight` for icon and text colors, and `bgCobaltLight` for background color instead.")
  public static var bgtxtCobaltLight: BezierColor { BezierColor(functionalColorToken: .bgCobaltLight) }
  
  @available(*, deprecated, message: "Use `fgCobaltNormal` for icon and text colors, and `bgCobaltNormal` for background color instead.")
  public static var bgtxtCobaltNormal: BezierColor { BezierColor(functionalColorToken: .bgCobaltNormal) }
  
  @available(*, deprecated, message: "Use `fgCobaltDark` for icon and text colors, and `bgCobaltDark` for background color instead.")
  public static var bgtxtCobaltDark: BezierColor { BezierColor(functionalColorToken: .bgCobaltDark) }
  
  // MARK: - Appendix, Teal
  @available(*, deprecated, message: "Use `fgTealLightest` for icon and text colors, and `bgTealLightest` for background color instead.")
  public static var bgtxtTealLightest: BezierColor { BezierColor(functionalColorToken: .bgTealLightest) }
  
  @available(*, deprecated, message: "Use `fgTealLighter` for icon and text colors, and `bgTealLighter` for background color instead.")
  public static var bgtxtTealLighter: BezierColor { BezierColor(functionalColorToken: .bgTealLighter) }
  
  @available(*, deprecated, message: "Use `fgTealLight` for icon and text colors, and `bgTealLight` for background color instead.")
  public static var bgtxtTealLight: BezierColor { BezierColor(functionalColorToken: .bgTealLight) }
  
  @available(*, deprecated, message: "Use `fgTealNormal` for icon and text colors, and `bgTealNormal` for background color instead.")
  public static var bgtxtTealNormal: BezierColor { BezierColor(functionalColorToken: .bgTealNormal) }
  
  @available(*, deprecated, message: "Use `fgTealDark` for icon and text colors, and `bgTealDark` for background color instead.")
  public static var bgtxtTealDark: BezierColor { BezierColor(functionalColorToken: .bgTealDark) }
  
  // MARK: - Appendix, Green
  @available(*, deprecated, message: "Use `fgGreenLightest` for icon and text colors, and `bgGreenLightest` for background color instead.")
  public static var bgtxtGreenLightest: BezierColor { BezierColor(functionalColorToken: .bgGreenLightest) }
  
  @available(*, deprecated, message: "Use `fgGreenLighter` for icon and text colors, and `bgGreenLighter` for background color instead.")
  public static var bgtxtGreenLighter: BezierColor { BezierColor(functionalColorToken: .bgGreenLighter) }
  
  @available(*, deprecated, message: "Use `fgGreenLight` for icon and text colors, and `bgGreenLight` for background color instead.")
  public static var bgtxtGreenLight: BezierColor { BezierColor(functionalColorToken: .bgGreenLight) }
  
  @available(*, deprecated, message: "Use `fgGreenNormal` for icon and text colors, and `bgGreenNormal` for background color instead.")
  public static var bgtxtGreenNormal: BezierColor { BezierColor(functionalColorToken: .bgGreenNormal) }
  
  @available(*, deprecated, message: "Use `fgGreenDark` for icon and text colors, and `bgGreenDark` for background color instead.")
  public static var bgtxtGreenDark: BezierColor { BezierColor(functionalColorToken: .bgGreenDark) }
  
  // MARK: - Appendix, Olive
  @available(*, deprecated, message: "Use `fgOliveLightest` for icon and text colors, and `bgOliveLightest` for background color instead.")
  public static var bgtxtOliveLightest: BezierColor { BezierColor(functionalColorToken: .bgOliveLightest) }
  
  @available(*, deprecated, message: "Use `fgOliveLighter` for icon and text colors, and `bgOliveLighter` for background color instead.")
  public static var bgtxtOliveLighter: BezierColor { BezierColor(functionalColorToken: .bgOliveLighter) }
  
  @available(*, deprecated, message: "Use `fgOliveLight` for icon and text colors, and `bgOliveLight` for background color instead.")
  public static var bgtxtOliveLight: BezierColor { BezierColor(functionalColorToken: .bgOliveLight) }
  
  @available(*, deprecated, message: "Use `fgOliveNormal` for icon and text colors, and `bgOliveNormal` for background color instead.")
  public static var bgtxtOliveNormal: BezierColor { BezierColor(functionalColorToken: .bgOliveNormal) }
  
  @available(*, deprecated, message: "Use `fgOliveDark` for icon and text colors, and `bgOliveDark` for background color instead.")
  public static var bgtxtOliveDark: BezierColor { BezierColor(functionalColorToken: .bgOliveDark) }
  
  // MARK: - Appendix, Yellow
  @available(*, deprecated, message: "Use `fgYellowLightest` for icon and text colors, and `bgYellowLightest` for background color instead.")
  public static var bgtxtYellowLightest: BezierColor { BezierColor(functionalColorToken: .bgYellowLightest) }
  
  @available(*, deprecated, message: "Use `fgYellowLighter` for icon and text colors, and `bgYellowLighter` for background color instead.")
  public static var bgtxtYellowLighter: BezierColor { BezierColor(functionalColorToken: .bgYellowLighter) }
  
  @available(*, deprecated, message: "Use `fgYellowLight` for icon and text colors, and `bgYellowLight` for background color instead.")
  public static var bgtxtYellowLight: BezierColor { BezierColor(functionalColorToken: .bgYellowLight) }
  
  @available(*, deprecated, message: "Use `fgYellowNormal` for icon and text colors, and `bgYellowNormal` for background color instead.")
  public static var bgtxtYellowNormal: BezierColor { BezierColor(functionalColorToken: .bgYellowNormal) }
  
  @available(*, deprecated, message: "Use `fgYellowDark` for icon and text colors, and `bgYellowDark` for background color instead.")
  public static var bgtxtYellowDark: BezierColor { BezierColor(functionalColorToken: .bgYellowDark) }
  
  // MARK: - Appendix, Orange
  @available(*, deprecated, message: "Use `fgOrangeLightest` for icon and text colors, and `bgOrangeLightest` for background color instead.")
  public static var bgtxtOrangeLightest: BezierColor { BezierColor(functionalColorToken: .bgOrangeLightest) }
  
  @available(*, deprecated, message: "Use `fgOrangeLighter` for icon and text colors, and `bgOrangeLighter` for background color instead.")
  public static var bgtxtOrangeLighter: BezierColor { BezierColor(functionalColorToken: .bgOrangeLighter) }
  
  @available(*, deprecated, message: "Use `fgOrangeLight` for icon and text colors, and `bgOrangeLight` for background color instead.")
  public static var bgtxtOrangeLight: BezierColor { BezierColor(functionalColorToken: .bgOrangeLight) }
  
  @available(*, deprecated, message: "Use `fgOrangeNormal` for icon and text colors, and `bgOrangeNormal` for background color instead.")
  public static var bgtxtOrangeNormal: BezierColor { BezierColor(functionalColorToken: .bgOrangeNormal) }
  
  @available(*, deprecated, message: "Use `fgOrangeDark` for icon and text colors, and `bgOrangeDark` for background color instead.")
  public static var bgtxtOrangeDark: BezierColor { BezierColor(functionalColorToken: .bgOrangeDark) }
  
  // MARK: - Appendix, Red
  @available(*, deprecated, message: "Use `fgRedLightest` for icon and text colors, and `bgRedLightest` for background color instead.")
  public static var bgtxtRedLightest: BezierColor { BezierColor(functionalColorToken: .bgRedLightest) }
  
  @available(*, deprecated, message: "Use `fgRedLighter` for icon and text colors, and `bgRedLighter` for background color instead.")
  public static var bgtxtRedLighter: BezierColor { BezierColor(functionalColorToken: .bgRedLighter) }
  
  @available(*, deprecated, message: "Use `fgRedLight` for icon and text colors, and `bgRedLight` for background color instead.")
  public static var bgtxtRedLight: BezierColor { BezierColor(functionalColorToken: .bgRedLight) }
  
  @available(*, deprecated, message: "Use `fgRedNormal` for icon and text colors, and `bgRedNormal` for background color instead.")
  public static var bgtxtRedNormal: BezierColor { BezierColor(functionalColorToken: .bgRedNormal) }
  
  @available(*, deprecated, message: "Use `fgRedDark` for icon and text colors, and `bgRedDark` for background color instead.")
  public static var bgtxtRedDark: BezierColor { BezierColor(functionalColorToken: .bgRedDark) }
  
  // MARK: - Appendix, Pink
  @available(*, deprecated, message: "Use `fgPinkLightest` for icon and text colors, and `bgPinkLightest` for background color instead.")
  public static var bgtxtPinkLightest: BezierColor { BezierColor(functionalColorToken: .bgPinkLightest) }
  
  @available(*, deprecated, message: "Use `fgPinkLighter` for icon and text colors, and `bgPinkLighter` for background color instead.")
  public static var bgtxtPinkLighter: BezierColor { BezierColor(functionalColorToken: .bgPinkLighter) }
  
  @available(*, deprecated, message: "Use `fgPinkLight` for icon and text colors, and `bgPinkLight` for background color instead.")
  public static var bgtxtPinkLight: BezierColor { BezierColor(functionalColorToken: .bgPinkLight) }
  
  @available(*, deprecated, message: "Use `fgPinkNormal` for icon and text colors, and `bgPinkNormal` for background color instead.")
  public static var bgtxtPinkNormal: BezierColor { BezierColor(functionalColorToken: .bgPinkNormal) }
  
  @available(*, deprecated, message: "Use `fgPinkDark` for icon and text colors, and `bgPinkDark` for background color instead.")
  public static var bgtxtPinkDark: BezierColor { BezierColor(functionalColorToken: .bgPinkDark) }
  
  // MARK: - Appendix, Purple
  @available(*, deprecated, message: "Use `fgPurpleLightest` for icon and text colors, and `bgPurpleLightest` for background color instead.")
  public static var bgtxtPurpleLightest: BezierColor { BezierColor(functionalColorToken: .bgPurpleLightest) }
  
  @available(*, deprecated, message: "Use `fgPurpleLighter` for icon and text colors, and `bgPurpleLighter` for background color instead.")
  public static var bgtxtPurpleLighter: BezierColor { BezierColor(functionalColorToken: .bgPurpleLighter) }
  
  @available(*, deprecated, message: "Use `fgPurpleLight` for icon and text colors, and `bgPurpleLight` for background color instead.")
  public static var bgtxtPurpleLight: BezierColor { BezierColor(functionalColorToken: .bgPurpleLight) }
  
  @available(*, deprecated, message: "Use `fgPurpleNormal` for icon and text colors, and `bgPurpleNormal` for background color instead.")
  public static var bgtxtPurpleNormal: BezierColor { BezierColor(functionalColorToken: .bgPurpleNormal) }
  
  @available(*, deprecated, message: "Use `fgPurpleDark` for icon and text colors, and `bgPurpleDark` for background color instead.")
  public static var bgtxtPurpleDark: BezierColor { BezierColor(functionalColorToken: .bgPurpleDark) }
  
  // MARK: - Appendix, Navy
  @available(*, deprecated, message: "Use `fgNavyLightest` for icon and text colors, and `bgNavyLightest` for background color instead.")
  public static var bgtxtNavyLightest: BezierColor { BezierColor(functionalColorToken: .bgNavyLightest) }
  
  @available(*, deprecated, message: "Use `fgNavyLighter` for icon and text colors, and `bgNavyLighter` for background color instead.")
  public static var bgtxtNavyLighter: BezierColor { BezierColor(functionalColorToken: .bgNavyLighter) }
  
  @available(*, deprecated, message: "Use `fgNavyLight` for icon and text colors, and `bgNavyLight` for background color instead.")
  public static var bgtxtNavyLight: BezierColor { BezierColor(functionalColorToken: .bgNavyLight) }
  
  @available(*, deprecated, message: "Use `fgNavyNormal` for icon and text colors, and `bgNavyNormal` for background color instead.")
  public static var bgtxtNavyNormal: BezierColor { BezierColor(functionalColorToken: .bgNavyNormal) }
  
  @available(*, deprecated, message: "Use `fgNavyDark` for icon and text colors, and `bgNavyDark` for background color instead.")
  public static var bgtxtNavyDark: BezierColor { BezierColor(functionalColorToken: .bgNavyDark) }
}

@_spi(color) public extension BezierColor {
  var lightColorTokenHex: String {
    self.bezierColor.lightColorToken.hex
  }
  
  var darkColorTokenHex: String {
    self.bezierColor.darkColorToken.hex
  }
}
