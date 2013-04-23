//
//  ODFillColorComponent.m
//  testLayerApp
//
//  Created by Olivier Demolliens on 26/10/12.
//  Copyright (c) 2012 ostalgo. All rights reserved.
//

#import "ODFillColor.h"

@interface ODFillColor()

@end

@implementation ODFillColor
{
   
}


#pragma mark Memory management

-(void)dealloc
{
   [super dealloc];
}

#pragma mark static methods

+(void)addFillColorWithContext:(CGContextRef)context withRed:(float)red andGreen:(float)green andBlue:(float)blue withAlpha:(float)alpha
{
   CGFloat fileColor[] = {red,green,blue,alpha};
   CGContextSetFillColor(context, fileColor);
}

+(void)addFillColorWithContext:(CGContextRef)context withRGBRed:(float)red andRGBGreen:(float)green andRGBBlue:(float)blue withAlpha:(float)alpha
{
   CGContextSetRGBFillColor(context,red,green,blue,alpha);
}

@end
