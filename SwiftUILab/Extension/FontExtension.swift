//
//  FontExtension.swift
//  SwiftUILab
//
//  Created by Kamrul Hasan on 1/8/23.
//

import Foundation
import SwiftUI

extension Font.TextStyle{
    var size:CGFloat{
        switch self {
            case .largeTitle: return 60
            case .title: return 48
            case .title2: return 34
            case .title3: return 24
            case .headline, .body: return 18
            case .subheadline, .callout: return 16
            case .footnote: return 14
            case .caption: return 12
            case .caption2: return 10
            @unknown default: return 8
        }
    }
}


extension Font {
    static let largeTitle = Font.custom("Roboto-Regular", size: Font.TextStyle.largeTitle.size, relativeTo: .caption)

    
    static let title = Font.custom("Roboto-Regular", size: Font.TextStyle.title.size, relativeTo: .caption)
    static let titleRegular = Font.custom("Roboto-Regular", size: Font.TextStyle.title.size, relativeTo: .caption)
    static let titleLight = Font.custom("Roboto-Light", size: Font.TextStyle.title.size, relativeTo: .caption)
    static let titleThin = Font.custom("Roboto-Thin", size: Font.TextStyle.title.size, relativeTo: .caption)
    static let titleItalic = Font.custom("Roboto-Italic", size: Font.TextStyle.title.size, relativeTo: .caption)
    static let titleMedium = Font.custom("Roboto-Medium", size: Font.TextStyle.title.size, relativeTo: .caption)
    static let titleBold = Font.custom("Roboto-Bold", size: Font.TextStyle.title.size, relativeTo: .caption)
    
    static let title2 = Font.custom("Roboto-Regular", size: Font.TextStyle.title2.size, relativeTo: .caption)
    static let title2Regular = Font.custom("Roboto-Regular", size: Font.TextStyle.title2.size, relativeTo: .caption)
    static let title2Light = Font.custom("Roboto-Light", size: Font.TextStyle.title2.size, relativeTo: .caption)
    static let title2Thin = Font.custom("Roboto-Thin", size: Font.TextStyle.title2.size, relativeTo: .caption)
    static let title2Italic = Font.custom("Roboto-Italic", size: Font.TextStyle.title2.size, relativeTo: .caption)
    static let title2Medium = Font.custom("Roboto-Medium", size: Font.TextStyle.title2.size, relativeTo: .caption)
    static let title2Bold = Font.custom("Roboto-Bold", size: Font.TextStyle.title2.size, relativeTo: .caption)
    
    static let title3 = Font.custom("Roboto-Regular", size: Font.TextStyle.title3.size, relativeTo: .caption)
    static let title3Regular = Font.custom("Roboto-Regular", size: Font.TextStyle.title3.size, relativeTo: .caption)
    static let title3Light = Font.custom("Roboto-Light", size: Font.TextStyle.title3.size, relativeTo: .caption)
    static let title3Thin = Font.custom("Roboto-Thin", size: Font.TextStyle.title3.size, relativeTo: .caption)
    static let title3Italic = Font.custom("Roboto-Italic", size: Font.TextStyle.title3.size, relativeTo: .caption)
    static let title3Medium = Font.custom("Roboto-Medium", size: Font.TextStyle.title3.size, relativeTo: .caption)
    static let title3Bold = Font.custom("Roboto-Bold", size: Font.TextStyle.title3.size, relativeTo: .caption)
    
    static let headline = Font.custom("Roboto-Regular", size: Font.TextStyle.headline.size, relativeTo: .caption)
    static let headlineRegular = Font.custom("Roboto-Regular", size: Font.TextStyle.headline.size, relativeTo: .caption)
    static let headlineLight = Font.custom("Roboto-Light", size: Font.TextStyle.headline.size, relativeTo: .caption)
    static let headlineThin = Font.custom("Roboto-Thin", size: Font.TextStyle.headline.size, relativeTo: .caption)
    static let headlineItalic = Font.custom("Roboto-Italic", size: Font.TextStyle.headline.size, relativeTo: .caption)
    static let headlineMedium = Font.custom("Roboto-Medium", size: Font.TextStyle.headline.size, relativeTo: .caption)
    static let headlineBold = Font.custom("Roboto-Bold", size: Font.TextStyle.headline.size, relativeTo: .caption)
    
    static let subheadline = Font.custom("Roboto-Regular", size: Font.TextStyle.subheadline.size, relativeTo: .caption)
    static let subheadlineRegular = Font.custom("Roboto-Regular", size: Font.TextStyle.subheadline.size, relativeTo: .caption)
    static let subheadlineLight = Font.custom("Roboto-Light", size: Font.TextStyle.subheadline.size, relativeTo: .caption)
    static let subheadlineThin = Font.custom("Roboto-Thin", size: Font.TextStyle.subheadline.size, relativeTo: .caption)
    static let subheadlineItalic = Font.custom("Roboto-Italic", size: Font.TextStyle.subheadline.size, relativeTo: .caption)
    static let subheadlineMedium = Font.custom("Roboto-Medium", size: Font.TextStyle.subheadline.size, relativeTo: .caption)
    static let subheadlineBold = Font.custom("Roboto-Bold", size: Font.TextStyle.subheadline.size, relativeTo: .caption)
    
    static let callout = Font.custom("Roboto-Regular", size: Font.TextStyle.callout.size, relativeTo: .caption)
    static let calloutRegular = Font.custom("Roboto-Regular", size: Font.TextStyle.callout.size, relativeTo: .caption)
    static let calloutLight = Font.custom("Roboto-Light", size: Font.TextStyle.callout.size, relativeTo: .caption)
    static let calloutThin = Font.custom("Roboto-Thin", size: Font.TextStyle.callout.size, relativeTo: .caption)
    static let calloutItalic = Font.custom("Roboto-Italic", size: Font.TextStyle.callout.size, relativeTo: .caption)
    static let calloutMedium = Font.custom("Roboto-Medium", size: Font.TextStyle.callout.size, relativeTo: .caption)
    static let calloutBold = Font.custom("Roboto-Bold", size: Font.TextStyle.callout.size, relativeTo: .caption)
    
    static let caption = Font.custom("Roboto-Regular", size: Font.TextStyle.caption.size, relativeTo: .caption)
    static let captionRegular = Font.custom("Roboto-Regular", size: Font.TextStyle.caption.size, relativeTo: .caption)
    static let captionLight = Font.custom("Roboto-Light", size: Font.TextStyle.caption.size, relativeTo: .caption)
    static let captionThin = Font.custom("Roboto-Thin", size: Font.TextStyle.caption.size, relativeTo: .caption)
    static let captionItalic = Font.custom("Roboto-Italic", size: Font.TextStyle.caption.size, relativeTo: .caption)
    static let captionMedium = Font.custom("Roboto-Medium", size: Font.TextStyle.caption.size, relativeTo: .caption)
    static let captionBold = Font.custom("Roboto-Bold", size: Font.TextStyle.caption.size, relativeTo: .caption)
    
    static let caption2 = Font.custom("Roboto-Regular", size: Font.TextStyle.caption2.size, relativeTo: .caption)
    static let caption2Regular = Font.custom("Roboto-Regular", size: Font.TextStyle.caption2.size, relativeTo: .caption)
    static let caption2Light = Font.custom("Roboto-Light", size: Font.TextStyle.caption2.size, relativeTo: .caption)
    static let caption2Thin = Font.custom("Roboto-Thin", size: Font.TextStyle.caption2.size, relativeTo: .caption)
    static let caption2Italic = Font.custom("Roboto-Italic", size: Font.TextStyle.caption2.size, relativeTo: .caption)
    static let caption2Medium = Font.custom("Roboto-Medium", size: Font.TextStyle.caption2.size, relativeTo: .caption)
    static let caption2Bold = Font.custom("Roboto-Bold", size: Font.TextStyle.caption2.size, relativeTo: .caption)
    
}
