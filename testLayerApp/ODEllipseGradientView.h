//
//  ODEllipseView.h
//  testLayerApp
//
//  Created by Olivier Demolliens on 25/10/12.
//  Copyright (c) 2012 ostalgo. All rights reserved.
//

#import <Foundation/Foundation.h>

//View
#import "ODView.h"

//Component
@class ODGradientColor;

@interface ODEllipseGradientView : ODView

//Public Accessor
-(void)setEllipseColor:(ODGradientColor*)newEllipseColor;

@end
