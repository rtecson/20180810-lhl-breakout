//
//  MyView.m
//  Test
//
//  Created by Roland on 2018-08-10.
//  Copyright © 2018 Lighthouse Labs. All rights reserved.
//

#import "MyView.h"

@implementation MyView

// This init method is usually called when you create a MyView object programmatically
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self != nil) {
        // Do my own initialization
        [self initialSetup];
    }
    return self;
}

// This init method is called by iOS when it's creating a MyView object from the storyboard (or basically from a NIB)
- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self != nil) {
        // Do my own initialization
        [self initialSetup];
    }
    return self;
}

- (void)initialSetup {
    // Initialize my properties, do some initial stuff
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
