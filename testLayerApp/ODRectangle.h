//
//  ODRectangle.h
//  testLayerApp
//
//  Created by Olivier Demolliens on 28/10/12.
//  Copyright (c) 2012 ostalgo. All rights reserved.
//

#import <Foundation/Foundation.h>

//Component
#import "ODColorComponent.h"
#import "ODGradientColor.h"


@interface ODRectangle : NSObject

+(void)addRectangle:(CGRect)newRect withContext:(CGContextRef)c withCornerRadius:(NSNumber*)cornerRadius withColor:(ODColorComponent*)colorComponent;

+(void)addRectangle:(CGRect)newRect withContext:(CGContextRef)c withCornerRadius:(NSNumber*)cornerRadius withGradient:(ODGradientColor*)gradientColor;

@end
