//
//  customcellclass.m
//  Proretention1.1
//
//  Created by Admin on 21/05/13.
//  Copyright (c) 2013 sandip sayaji kote. All rights reserved.
//

#import "customcellclass.h"

@implementation customcellclass
@synthesize lbl1,lbl2;
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
