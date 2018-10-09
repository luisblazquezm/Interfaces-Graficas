//
//  Model.h
//  Tablas
//
//  Created by Luis Blazquez Miñambres on 6/10/18.
//  Copyright © 2018 Luis Blazquez Miñambres. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface Model : NSObject
{
    NSMutableArray *anArrayLeft, *anArrayRight;
}

@property (nonatomic) NSMutableArray *anArrayLeft;
@property (nonatomic) NSMutableArray *anArrayRight;

@end
