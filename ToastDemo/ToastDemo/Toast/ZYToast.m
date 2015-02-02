//
//  Toast.m
//  ToastDemo
//
//  Created by Xinling on 26/1/15.
//  Copyright (c) 2015 Xinling. All rights reserved.
//

#import "ZYToast.h"

ZYToastGravity ToastGravityMake(ZYToastHorizontalGravity x, ZYToastVerticalGravity y)
{
    ZYToastGravity toast;
    toast.x = x;
    toast.y = y;
    return toast;
}


@interface ZYToast ()
@property (nonatomic, strong) UIImageView * indicateImageView;
@property (nonatomic, strong) UILabel     * contentLabel;
@end

@implementation ZYToast

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if ( self )
    {
        self.contentLabel = [[UILabel alloc] init];
        self.contentLabel.font = [UIFont systemFontOfSize:13];
        self.contentLabel.textColor = [UIColor whiteColor];
        self.backgroundColor = [UIColor colorWithWhite:0 alpha:0.7];
        self.layer.cornerRadius = 3;
        self.contentLabel.numberOfLines = 0;
        self.layer.shadowColor = [UIColor colorWithWhite:0 alpha:0.5].CGColor;
        self.layer.shadowOpacity = 0.3;
        [self addSubview:self.contentLabel];
        
        self.indicateImageView = [[UIImageView alloc] init];
        self.indicateImageView.layer.contentsGravity = kCAGravityCenter;
        [self addSubview:self.indicateImageView];
        
        self.contentLabel.translatesAutoresizingMaskIntoConstraints = NO;
        self.indicateImageView.translatesAutoresizingMaskIntoConstraints = NO;
        [self addConstraints:[NSLayoutConstraint
                              constraintsWithVisualFormat:@"H:|-10-[imageView]-5-[contentLabel]-10-|"
                              options:NSLayoutFormatAlignAllTop|NSLayoutFormatAlignAllBottom
                              metrics:nil
                              views:@{@"imageView":self.indicateImageView,@"contentLabel":self.contentLabel}]];
        [self addConstraints:[NSLayoutConstraint
                              constraintsWithVisualFormat:@"V:|-10-[contentLabel]-10-|"
                              options:0
                              metrics:nil
                              views:@{@"contentLabel":self.contentLabel}]];
    }
    return self;
}

- (void)setContent:(NSString *)content
{
    self.contentLabel.text = content;
}

- (void)setIndicateImage:(UIImage *)indicate
{
    self.indicateImageView.image = indicate;
}


- (void)setPositionWithGravity:(ZYToastGravity)gravity inView:(UIView *)view
{
    self.translatesAutoresizingMaskIntoConstraints = NO;
    switch ( gravity.x )
    {
        case ZYToastHorizontalGravityTop:
        {
            [view addConstraint:[NSLayoutConstraint
                                 constraintWithItem:self
                                 attribute:NSLayoutAttributeTop
                                 relatedBy:NSLayoutRelationEqual
                                 toItem:view
                                 attribute:NSLayoutAttributeTop
                                 multiplier:1
                                 constant:30]];
            break;
        }
        case ZYToastHorizontalGravityCenter:
        {
            [view addConstraint:[NSLayoutConstraint
                                 constraintWithItem:self
                                 attribute:NSLayoutAttributeCenterY
                                 relatedBy:NSLayoutRelationEqual
                                 toItem:view
                                 attribute:NSLayoutAttributeCenterY
                                 multiplier:1
                                 constant:0]];
            break;
        }
        case ZYToastHorizontalGravityBottom:
        {
            [view addConstraint:[NSLayoutConstraint
                                 constraintWithItem:self
                                 attribute:NSLayoutAttributeBottom
                                 relatedBy:NSLayoutRelationEqual
                                 toItem:view
                                 attribute:NSLayoutAttributeBottom
                                 multiplier:1
                                 constant:-20]];
            break;
        }
        default:
            break;
    }
    
    switch (gravity.y)
    {
        case ZYToastVerticalGravityLeft:
        {
            [view addConstraint:[NSLayoutConstraint
                                 constraintWithItem:self
                                 attribute:NSLayoutAttributeLeft
                                 relatedBy:NSLayoutRelationEqual
                                 toItem:view
                                 attribute:NSLayoutAttributeLeft
                                 multiplier:1
                                 constant:20]];
            break;
        }
        case ZYToastVerticalGravityCenter:
        {
            [view addConstraint:[NSLayoutConstraint
                                 constraintWithItem:self
                                 attribute:NSLayoutAttributeCenterX
                                 relatedBy:NSLayoutRelationEqual
                                 toItem:view
                                 attribute:NSLayoutAttributeCenterX
                                 multiplier:1
                                 constant:0]];
            break;
        }
        case ZYToastVerticalGravityRight:
        {
            [view addConstraint:[NSLayoutConstraint
                                 constraintWithItem:self
                                 attribute:NSLayoutAttributeRight
                                 relatedBy:NSLayoutRelationEqual
                                 toItem:view
                                 attribute:NSLayoutAttributeRight
                                 multiplier:1
                                 constant:-20]];
            break;
        }
        default:
            break;
    }
}


+ (ZYToast *)showWithContent:(NSString *)content gravity:(ZYToastGravity)gravity
{
    ZYToast* toast = [[ZYToast alloc] initWithFrame:[UIScreen mainScreen].bounds];
    [toast setContent:content];
    toast.contentLabel.text = content;
    
    UIWindow* window = [UIApplication sharedApplication].keyWindow;
    [window addSubview:toast];
    
    [toast setPositionWithGravity:gravity inView:window];
    
    [UIView animateWithDuration:0.3 delay:1.5 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        toast.alpha = 0;
    } completion:^(BOOL finished) {
        [toast removeFromSuperview];
    }];
    
    return toast;
}


@end
