//
//  newscustomcell.h
//  Proretention1.1
//
//  Created by Admin on 18/06/13.
//  Copyright (c) 2013 sandip sayaji kote. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface newscustomcell : UITableViewCell
{
    IBOutlet UILabel *headinglabel, *contentlabel, *datelabel;
    
}
@property (nonatomic, retain) IBOutlet UILabel *headinglabel;
@property (nonatomic, retain) IBOutlet UILabel *contentlabel;
@property (nonatomic, retain) IBOutlet UILabel *datelabel;
@property (nonatomic, retain) IBOutlet UIImageView *newsimage;
@property (nonatomic, retain) IBOutlet UIImageView *communityimage;
@property (nonatomic, retain) IBOutlet UIImageView *communityalert;
@property (nonatomic, retain) IBOutlet UILabel *namelabel;
@property (nonatomic, retain) IBOutlet UILabel *departmentlabel;
@property (nonatomic, retain) IBOutlet UILabel *rolelabel;

//My Contacts
@property (nonatomic, retain) IBOutlet UILabel *mycaontactname;
@property (nonatomic, retain) IBOutlet UIImageView *mycontactprofile;
@property (nonatomic, retain) IBOutlet UIImageView *mycontactstatus;

//My Contacts Table
@property (nonatomic, retain) IBOutlet UIImageView *chatimage;
@property (nonatomic, retain) IBOutlet UIImageView *chaticon;
@property (nonatomic, retain) IBOutlet UILabel *namelbl;
@property (nonatomic, retain) IBOutlet UILabel *departmentlbl;
@property (nonatomic, retain) IBOutlet UILabel *rolelbl;
@end
