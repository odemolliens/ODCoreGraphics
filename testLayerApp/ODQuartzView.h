//
//  ODQuartzView.h
//  testLayerApp
//
//  Created by Olivier Demolliens on 26/10/12.
//  Copyright (c) 2012 ostalgo. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ODQuartzView <NSObject>

//After load nib
-(void)awakeFromNib;

//Draw
-(void)drawRect:(CGRect)rect;

@end
