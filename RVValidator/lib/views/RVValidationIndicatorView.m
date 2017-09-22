//
//  RVValidationIndicatorView.m
//  RVValidator
//
//  Created by Badchoice on 22/9/17.
//  Copyright © 2017 Revo. All rights reserved.
//

#import "RVValidationIndicatorView.h"

@implementation RVValidationIndicatorView

+(RVValidationIndicatorView*)make{
    UIView* indicator                = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 7, 7)];
    indicator.backgroundColor        = [UIColor redColor];
    indicator.layer.cornerRadius     = indicator.layer.bounds.size.width/2;
    indicator.layer.masksToBounds    = YES;
    
    RVValidationIndicatorView* view = [[RVValidationIndicatorView alloc] initWithFrame:CGRectMake(0, 0, 14, 7)];
    [view addSubview:indicator];
    return view;
}

@end
