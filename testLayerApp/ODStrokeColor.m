//
//  ODFillColorComponent.m
//  testLayerApp
//
//  Created by Olivier Demolliens on 26/10/12.
//  Copyright (c) 2012 ostalgo. All rights reserved.
//

#import "ODStrokeColor.h"

@interface ODStrokeColor()

@end

@implementation ODStrokeColor
{
   float lineWidth_;
}

- (id)initWithLineWitdh:(float)lineWidth andRed:(float)red andGreen:(float)green andBlue:(float)blue withAlpha:(float)alpha
{
   self = [super initWithRed:red andGreen:green andBlue:blue withAlpha:alpha];
   if (self) {
      lineWidth_ = lineWidth;
   }
   return self;
}

- (id)initWithLineWitdh:(float)lineWidth andRGBRed:(float)red andRGBGreen:(float)green andRGBBlue:(float)blue withAlpha:(float)alpha
{
   self = [super initWithRGBRed:red andRGBGreen:green andRGBBlue:blue withAlpha:alpha];
   if (self) {
      lineWidth_ = lineWidth;
   }
   return self;
}

-(NSNumber*)lineWidth
{
   return [NSNumber numberWithFloat:lineWidth_];
}


#pragma mark Memory management

-(void)dealloc
{
   [super dealloc];
}

#pragma mark static methods

+(void)addStrokeColorWithContext:(CGContextRef)context withRed:(float)red andGreen:(float)green andBlue:(float)blue withAlpha:(float)alpha
{
   CGFloat strokeColor[] = {red,green,blue,alpha};
   CGContextSetStrokeColor(context, strokeColor);
}

+(void)addStrokeColorWithContext:(CGContextRef)context withRGBRed:(float)red andRGBGreen:(float)green andRGBBlue:(float)blue withAlpha:(float)alpha
{
   CGContextSetRGBStrokeColor(context,red,green,blue,alpha);
}

@end
