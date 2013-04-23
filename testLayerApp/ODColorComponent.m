//
//  ODColorComponent.m
//  testLayerApp
//
//  Created by Olivier Demolliens on 26/10/12.
//  Copyright (c) 2012 ostalgo. All rights reserved.
//

#import "ODColorComponent.h"

@interface ODColorComponent()

@end

@implementation ODColorComponent
{
   float red_;
   float green_;
   float blue_;
   float alpha_;
}

#pragma mark Constructor

- (id)init
{
   self = [super init];
   if (self) {
      red_ = 1;
      green_ = 1;
      blue_= 1;
      alpha_ = 1;
   }
   return self;
}

- (id)initWithRed:(float)red andGreen:(float)green andBlue:(float)blue withAlpha:(float)alpha
{
   self = [super init];
   if (self) {
      red_ = red;
      green_ = green;
      blue_= blue;
      alpha_ = alpha;
   }
   return self;
}

- (id)initWithRGBRed:(float)red andRGBGreen:(float)green andRGBBlue:(float)blue withAlpha:(float)alpha
{
   self = [super init];
   if (self) {
      red_ = red/255;
      green_ = green/255;
      blue_= blue/255;
      alpha_ = alpha/255;
   }
   return self;
}

#pragma mark Public accessor

-(NSNumber*)redColor
{
   return [NSNumber numberWithFloat:red_];
}

-(NSNumber*)greenColor
{
   return [NSNumber numberWithFloat:green_];
}

-(NSNumber*)blueColor
{
   return [NSNumber numberWithFloat:blue_];
}

-(NSNumber*)alphaRatio
{
   return [NSNumber numberWithFloat:alpha_];
}

#pragma mark Memory management

-(void)dealloc
{
   [super dealloc];
}

@end
