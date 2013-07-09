//
//  newscustomcell.m
//  Proretention1.1
//
//  Created by Admin on 18/06/13.
//  Copyright (c) 2013 sandip sayaji kote. All rights reserved.
//

#import "newscustomcell.h"

@implementation newscustomcell

@synthesize headinglabel, contentlabel, datelabel, newsimage;
@synthesize communityalert, communityimage, namelabel, departmentlabel, rolelabel;
@synthesize mycaontactname,mycontactprofile,mycontactstatus;
@synthesize chaticon,chatimage,namelbl,departmentlbl,rolelbl;

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
}

@end
