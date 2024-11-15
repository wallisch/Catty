/**
 *  Copyright (C) 2010-2024 The Catrobat Team
 *  (http://developer.catrobat.org/credits)
 *
 *  This program is free software: you can redistribute it and/or modify
 *  it under the terms of the GNU Affero General Public License as
 *  published by the Free Software Foundation, either version 3 of the
 *  License, or (at your option) any later version.
 *
 *  An additional term exception under section 7 of the GNU Affero
 *  General Public License, version 3, is available at
 *  (http://developer.catrobat.org/license_additional_term)
 *
 *  This program is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
 *  GNU Affero General Public License for more details.
 *
 *  You should have received a copy of the GNU Affero General Public License
 *  along with this program.  If not, see http://www.gnu.org/licenses/.
 */

#import "UIUtil.h"
#import "UIDefines.h"
#import "Util.h"
#import "iOSCombobox.h"
#import "ScriptCollectionViewController.h"
#import "Pocket_Code-Swift.h"

@implementation UIUtil

+ (UIContextualAction*)moreContextualActionWithHandler:(row_action_block_t)handler {
    UIContextualAction *moreAction = [UIContextualAction contextualActionWithStyle:UIContextualActionStyleNormal
                                                                           title:kLocalizedMore
                                                                         handler:handler];
    moreAction.backgroundColor = UIColor.globalTint;
    return moreAction;
}

+ (UIContextualAction*)deleteContextualActionWithHandler:(row_action_block_t)handler {
    UIContextualAction *deleteAction = [UIContextualAction contextualActionWithStyle:UIContextualActionStyleDestructive
                                                                            title:kLocalizedDelete
                                                                          handler:handler];
    deleteAction.backgroundColor = UIColor.destructiveTint;
    return deleteAction;
}

+ (UILabel*)newDefaultBrickLabelWithFrame:(CGRect)frame {
    return [self newDefaultBrickLabelWithFrame:frame AndText:nil andRemainingSpace:UIDefines.brickInputFieldMaxWidth];
}

+ (UILabel*)newDefaultBrickLabelWithFrame:(CGRect)frame AndText:(NSString*)text
                        andRemainingSpace:(NSInteger)remainingSpace
{
    UILabel *label = [[UILabel alloc] initWithFrame:frame];
    label.textColor = UIColor.whiteColor;
    label.font = [UIFont fontWithName:@"Helvetica-Bold" size:UIDefines.brickLabelFontSize];
    if (text) {
        label.text = text;
        // adapt size to fit text
        [label sizeToFit];
        if (label.frame.size.width >= remainingSpace) {
            label.frame = CGRectMake(label.frame.origin.x, label.frame.origin.y, remainingSpace, label.frame.size.height);
            label.numberOfLines = 1;
            [label setAdjustsFontSizeToFitWidth:YES];
            label.lineBreakMode = NSLineBreakByTruncatingTail;
            label.minimumScaleFactor = 14./label.font.pointSize;
        } else {
            label.numberOfLines = 1;
            label.lineBreakMode = NSLineBreakByTruncatingTail;
            [label setAdjustsFontSizeToFitWidth:YES];
            label.minimumScaleFactor = 14./label.font.pointSize;
        }
        CGRect labelFrame = label.frame;
        labelFrame.size.height = frame.size.height;
        label.frame = labelFrame;
    }
    return label;
}

+ (iOSCombobox*)newDefaultBrickComboBoxWithFrame:(CGRect)frame AndItems:(NSArray*)items {
    iOSCombobox *comboBox = [[iOSCombobox alloc] initWithFrame:frame];
    [comboBox setValues:items];
    return comboBox;
}

@end
