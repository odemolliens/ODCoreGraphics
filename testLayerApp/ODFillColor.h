//
//  ODFillColorComponent.h
//  testLayerApp
//
//  Created by Olivier Demolliens on 26/10/12.
//  Copyright (c) 2012 ostalgo. All rights reserved.
//
//  Quartzcore: CGContextSetRGBFillColor

#import <Foundation/Foundation.h>

#import "ODColorComponent.h"

@interface ODFillColor : ODColorComponent
{
   
}

//Static
+(void)addFillColorWithContext:(CGContextRef)context withRed:(float)red andGreen:(float)green andBlue:(float)blue withAlpha:(float)alpha;
+(void)addFillColorWithContext:(CGContextRef)context withRGBRed:(float)red andRGBGreen:(float)green andRGBBlue:(float)blue withAlpha:(float)alpha;

@end
