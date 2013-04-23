//
//  ODEllipse.h
//  testLayerApp
//
//  Created by Olivier Demolliens on 28/10/12.
//  Copyright (c) 2012 ostalgo. All rights reserved.
//

#import <Foundation/Foundation.h>

//Component
#import "ODColorComponent.h"
#import "ODGradientColor.h"

@interface ODEllipse : NSObject
{
   
}

+(void)addEllipseInRect:(CGRect)newRect withContext:(CGContextRef)context;
+(void)addEllipseInRect:(CGRect)newRect withContext:(CGContextRef)c withGradient:(ODGradientColor*)gradientColor;
+(void)addEllipseInRect:(CGRect)newRect withContext:(CGContextRef)c withColor:(ODColorComponent*)colorComponent;
@end
