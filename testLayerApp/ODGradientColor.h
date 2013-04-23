//
//  ODEllipseColor.h
//  testLayerApp
//
//  Created by Olivier Demolliens on 26/10/12.
//  Copyright (c) 2012 ostalgo. All rights reserved.
//
//  Quartzcore: CGGradientCreateWithColorComponents

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, ODGradientDraw) {
   ODGradientDrawBeforeStartLocation = (1 << 0),
   ODGradientDrawAfterEndLocation  = (1 << 1),
};
@interface ODGradientColor : NSObject
{
   
}

//Static
+(CGGradientRef)gradientWithColor:(ODGradientColor*)gradientColor;

//Constructor
- (id)init;
- (id)initWithLocationGradientList:(NSArray*)lGl andColorGradient:(NSArray*)cGl andPathList:(NSArray*)pL;
- (id)initWithMutableLocationGradientList:(NSMutableArray*)lGl andMutableColorGradient:(NSMutableArray*)cGl andPathList:(NSMutableArray*)pL;

//Public accessor

//-Count
-(NSInteger)locationGradientListCount;
-(NSInteger)colorGradientListCount;

//-List
-(NSArray*)locationList;
-(NSArray*)colorGradientList;
-(NSArray*)pathGradientList;

//CompletionUtil

//-LocationGradient
-(void)addLocationGradientWithCGFloat:(CGFloat)floatNumber;
-(void)addLocationGradientWithNSNumber:(NSNumber*)floatNSNumber;

//-ColorGradient
-(void)addColorGradientWithRed:(CGFloat)red andGreen:(CGFloat)green andBlue:(CGFloat)blue withAlpha:(CGFloat)alpha;
-(void)addColorGradientWithRGBRed:(CGFloat)red andRGBGreen:(CGFloat)green andRGBBlue:(CGFloat)blue withAlpha:(CGFloat)alpha;

//-PathGradient
-(void)addPathWithStart:(CGPoint)pStart andEnd:(CGPoint)pEnd andDrawMode:(ODGradientDraw*)drawMode;

@end
