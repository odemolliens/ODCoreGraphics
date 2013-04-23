//
//  ODColorComponent.h
//  testLayerApp
//
//  Created by Olivier Demolliens on 26/10/12.
//  Copyright (c) 2012 ostalgo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ODColorComponent : NSObject
{
   
}

//Constructor
- (id)init;
- (id)initWithRed:(float)red andGreen:(float)green andBlue:(float)blue withAlpha:(float)alpha;
- (id)initWithRGBRed:(float)red andRGBGreen:(float)green andRGBBlue:(float)blue withAlpha:(float)alpha;

//Color
-(NSNumber*)redColor;
-(NSNumber*)greenColor;
-(NSNumber*)blueColor;

//Alpha
-(NSNumber*)alphaRatio;

@end
