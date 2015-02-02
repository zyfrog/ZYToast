//
//  Toast.h
//  ToastDemo
//
//  Created by Xinling on 26/1/15.
//  Copyright (c) 2015 Xinling. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, ZYToastHorizontalGravity)
{
    ZYToastHorizontalGravityTop,
    ZYToastHorizontalGravityCenter,
    ZYToastHorizontalGravityBottom,
};

typedef NS_ENUM(NSInteger, ZYToastVerticalGravity)
{
    ZYToastVerticalGravityLeft,
    ZYToastVerticalGravityCenter,
    ZYToastVerticalGravityRight,
};


struct ZYToastGravity {
    ZYToastHorizontalGravity x;
    ZYToastVerticalGravity y;
};
typedef struct ZYToastGravity ZYToastGravity;

ZYToastGravity ToastGravityMake(ZYToastHorizontalGravity x, ZYToastVerticalGravity y);

@interface ZYToast : UIView
+ (ZYToast *)showWithContent:(NSString *)content gravity:(ZYToastGravity)gravity;
- (void)setIndicateImage:(UIImage *)indicate;
@end
