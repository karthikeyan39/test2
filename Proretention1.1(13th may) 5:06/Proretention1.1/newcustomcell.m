//
//  newcustomcell.m
//  Proretention1.1
//
//  Created by Admin on 20/06/13.
//  Copyright (c) 2013 sandip sayaji kote. All rights reserved.
//

#import "newcustomcell.h"

@implementation newcustomcell
@synthesize ticketlabel;
@synthesize namelabel;
@synthesize datelabel;
@synthesize timelabel;
@synthesize subjectlabel;
@synthesize firstnamelabel;
@synthesize statuslabel;
@synthesize descriptionlabel;
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
