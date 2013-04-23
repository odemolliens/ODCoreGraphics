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

@interface ODStrokeColor : ODColorComponent
{
   
}

- (id)initWithLineWitdh:(float)lineWidth andRed:(float)red andGreen:(float)green andBlue:(float)blue withAlpha:(float)alpha;
- (id)initWithLineWitdh:(float)lineWidth andRGBRed:(float)red andRGBGreen:(float)green andRGBBlue:(float)blue withAlpha:(float)alpha;

-(NSNumber*)lineWidth;

//Static
+(void)addStrokeColorWithContext:(CGContextRef)context withRed:(float)red andGreen:(float)green andBlue:(float)blue withAlpha:(float)alpha;
+(void)addStrokeColorWithContext:(CGContextRef)context withRGBRed:(float)red andRGBGreen:(float)green andRGBBlue:(float)blue withAlpha:(float)alpha;

@end
