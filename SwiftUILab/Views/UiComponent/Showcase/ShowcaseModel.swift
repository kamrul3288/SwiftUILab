//
//  ToolTipsHighlight.swift
//  SwiftUILab
//
//  Created by Kamrul Hasan on 3/9/23.
//

import SwiftUI

//----------Step 1 create showcase model------------------
struct ShowcaseModel: Identifiable, Equatable{
    var id:UUID = .init()
    var anchor:Anchor<CGRect>
    var title:String
    var cornerRadius:CGFloat
    var style:RoundedCornerStyle = .continuous
    var scale:CGFloat = 1
}
