//
//  NewsViewController.m
//  Proretention1.1
//
//  Created by Admin on 18/06/13.
//  Copyright (c) 2013 sandip sayaji kote. All rights reserved.
//

#import "NewsViewController.h"
#import "newscustomcell.h"
#import "NewLoginViewController.h"
#import "AppDelegate.h"
#import "StaffViewController.h"
@interface NewsViewController ()

@end

@implementation NewsViewController
@synthesize alertbutton, pressbutton;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [toolbar1 setBackgroundImage:[UIImage imageNamed:@"headerbarnew.png"] forToolbarPosition:UIToolbarPositionAny barMetrics:UIBarMetricsDefault];
    newstable.layer.borderWidth= 2;
    newstable.layer.borderColor = [[UIColor lightGrayColor] CGColor];
    newstable.layer.cornerRadius = 8;
    
    detailedview.layer.borderWidth= 2;
    detailedview.layer.borderColor = [[UIColor lightGrayColor] CGColor];
    detailedview.layer.cornerRadius = 8;
    
    newstable.dataSource = self;
    newstable.delegate  =self;
    newsarray =  [[NSMutableArray alloc ] initWithObjects:@"Next generation of designers showcase their work",@"Fine artist celebrates success after rekindling her love of art",@"Lifetime achievement award for visiting professor",@"Hundreds of guests wowed by Jubilee performance",@"North London art students’ work goes on public display", nil];
    imagearray = [NSMutableArray arrayWithObjects:@"newsimages1.jpg",@"newsimages2.jpg",@"nonews.png",@"newsimages3.jpg", @"newsimages4.jpg",  nil];
    detailedarray = [[NSMutableArray alloc]initWithObjects:@"Upcoming designers from our University will show off their work at the Old Truman Brewery on London’s famous Brick Lane from 8-10 June 2013.More than 500 final-year artists and designers in disciplines including photography, fashion, animation, product design, interior architecture, fine art and illustration will display their final year projects at the trendy east London venue.The four-day event titled “Laboratory” will see over 5000 visitors come through the door to discover the latest talent in art and design.John will be exhibiting his football inspired illustrations that have been shortlisted and highly commended for the Macmillan Children’s Book Illustratio",@"Fine artist Kelly Moore will see her second solo exhibition open this weekend in Glasgow after rekindling her love of art only five years ago when her daughter began studying the subject.After running a successful physiotherapy practice in London for 19 years and being at the peak of her career, Kelly relinquished the comfort and stability of the familiar pattern of steady work and  found her artistic ‘calling’ reawakened by her daughter.Five years ago, with support of her family, Kelly set about a complete career change and decided to study for both an undergraduate and postgraduate degree in Fine Art at Middlesex University and the emerging artist is now gaining a large following.University student Kelly Moore who grew up in Glasgow said:  “'It was when my teenage daughter Alex started to take life drawing classes that I felt inspired to start to draw again.  And now she has also recently achieved a degree in illustration from ABC University.”Her exhibition titled Still Sounds Scotland Street 2013 will run from Saturday 1 June - 11 August 2013 at the Scotland Street School Museum.  Kelly’s mixed media installation includes textile prints, photographs, video and sound, and offers a unique insight into the lives of the former pupils of Scotland Street School, local residents and Clydeside shipyard workers.It examines the period the school was open, from the early 1900's to the late seventies. It is one of the latest exhibitions by Scottish artist Margaret Moore, exploring history and heritage in the context of an increasingly globalised world.",@"Professor James, Visiting Professor at the University’s Institute for Work Based Learning, will receive a Lifetime Achievement Award at the British Psychological Society’s Annual Conference, to be held in April 2010.The British Psychological Society Awards were established in 2006, to recognise distinctive and exemplary contributions to psychological knowledge. The Lifetime Achievement Award is presented in recognition of outstanding personal achievements and significant contributions to the advancement of psychological knowledge. Professor Lane has been credited with bringing about ‘the professionalisation of counselling psychology’.As Research Director of the International Centre for the Study of Coaching (ICSC) at Middlesex, Professor Lane has made significant contributions to leading-edge research in education, coaching and management issues. He also set up structures for specialised awards in psychotherapy for the European Federation of Psychologists Associations, which were recently adopted by 34 countries.",@"University's Quadrangle was transformed into a top class concert venue last night, with hundreds of guests attending two performances arranged to celebrate the Queen's Jubilee.Performers including world renowned soprano Dame Emma Kirkby wowed the audience in Henry Purcell's 'Dido and Aeneas', joined by The Baroque Collective, led by Julia Bishop, the Singers and the Dance Ensemble. The dances were performed with original choreography by Louise Kelsey.The BBC singers then combined with the University's choir for the second work, Carl Orff's 'Carmina Burana'. This was directed by Adrian Peacock from BBC Music. The One Voice Children’s Choir from Barnet Music Service, whose members are drawn from primary and secondary schools across the Borough of Barnet, also took part.", @"Some of London’s best up and coming artists will be showcasing work which tackles issues like women’s rights in Afghanistan and art as a form of protest in Britain, at an exhibition to be launched in Hendon.For the first time the university students will be able to showcase their work in the £80m Grove building, University’s state-of-the-art centre for creative courses.The work of the Fine Art students from across north London aims to challenge established views, presenting a simulating and inventive response to the world. Final year Fine Art and Critical Theory student Harriet Dopson said: “It will be a really exciting show, there is no formal brief so all the work is self led which produces some outstanding results. Myself and the other students on the course have used an exciting range of media to produce their work as we respond and question the world around us.The students will also be running a workshop giving the public an opportunity to take part in and discuss the exhibition.Admission is free.",nil];
    datearray = [[NSMutableArray alloc]initWithObjects:@"3 Seconds ago",@"5 Minutes ago",@"2 Hours 30 Minutes ago",@"1 Day ago",@"3 Days ago", nil];
    alphbetarray = [NSArray arrayWithObjects:@"A",@"B",@"C", nil];
    headinglabel.text = [newsarray objectAtIndex:0];
    contentlabel.text = [detailedarray objectAtIndex:0];
    smallimage.image =[UIImage imageNamed:[imagearray objectAtIndex:0]];
    newsimageview.image = [UIImage imageNamed:[imagearray objectAtIndex:0]];
    contentview.text = [detailedarray objectAtIndex:0];
    
//    NSSortDescriptor *srt = [NSSortDescriptor sortDescriptorWithKey:nil ascending:YES];
//    [newsarray sortUsingDescriptors:[NSMutableArray arrayWithObject:srt]];
}

-(void)dealloc
{
    backtologin = nil;
    profileactionview = nil;
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [newsarray count];
    return [imagearray count];
    return  [detailedarray count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"SimpleTableCell";
    
    newscustomcell *cell = (newscustomcell *)[tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    if (cell == nil)
    {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"newscustomcell1" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    if( [indexPath row] % 2)
        cell.contentView.backgroundColor = [[UIColor alloc]initWithRed:208.0/255.0 green:227.0/255.0 blue:242.0/255.0 alpha:1];
    else
        cell.contentView.backgroundColor = [[UIColor alloc]initWithRed:193.0/255.0 green:206.0/255.0 blue:217.0/255.0 alpha:1] ;
    cell.selectionStyle = UITableViewCellSelectionStyleBlue;
    cell.headinglabel.text = [newsarray objectAtIndex:indexPath.row];
    cell.newsimage.image = [UIImage imageNamed:[imagearray objectAtIndex:indexPath.row]];
    cell.contentlabel.text = [detailedarray objectAtIndex:indexPath.row];
    cell.datelabel.text = [datearray objectAtIndex:indexPath.row];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0)
    {
        headinglabel.text = [newsarray objectAtIndex:0];
        contentlabel.text = [detailedarray objectAtIndex:0];
        smallimage.image =[UIImage imageNamed:[imagearray objectAtIndex:0]];
        newsimageview.image = [UIImage imageNamed:[imagearray objectAtIndex:0]];
        contentview.text = [detailedarray objectAtIndex:0];
    }
    if (indexPath.row == 1)
    {
        headinglabel.text = [newsarray objectAtIndex:1];
        newsimageview.image = [UIImage imageNamed:[imagearray objectAtIndex:1]];
        contentview.text = [detailedarray objectAtIndex:1];
    }
    if (indexPath.row == 2)
    {
        headinglabel.text = [newsarray objectAtIndex:2];
        newsimageview.image = [UIImage imageNamed:[imagearray objectAtIndex:2]];
        contentview.text = [detailedarray objectAtIndex:2];
    }
    if (indexPath.row == 3)
    {
        headinglabel.text = [newsarray objectAtIndex:3];
        newsimageview.image = [UIImage imageNamed:[imagearray objectAtIndex:3]];
        contentview.text = [detailedarray objectAtIndex:3];
    }
    if (indexPath.row == 4)
    {
        headinglabel.text = [newsarray objectAtIndex:4];
        newsimageview.image = [UIImage imageNamed:[imagearray objectAtIndex:4]];
        contentview.text = [detailedarray objectAtIndex:4];
    }

}
//-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
//{
//    return [alphbetarray objectAtIndex:section];
//}
//-(NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView
//{
//    return alphbetarray;
//}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView == newstable)
    {
        return 120;
    }
    return 1;
}
-(IBAction)backtohome
{
    AppDelegate *ap = (AppDelegate *)[[UIApplication sharedApplication]delegate];
    if (ap.stafforstudent)
    {
        StaffViewController *staffview = [[StaffViewController alloc]initWithNibName:@"StaffViewController" bundle:nil];
        [self presentViewController:staffview animated:NO completion:nil];
    }
    else
    {
        [self dismissViewControllerAnimated:NO completion:nil];
    }
}
-(IBAction)alertaction:(id)sender
{
    alarm.hidden = NO;
    pressbutton.hidden = NO;
    alertbutton.hidden = YES;
    alarm.animationImages = [NSArray arrayWithObjects:
                             [UIImage imageNamed:@"a1.png"],[UIImage imageNamed:@"a2.png"],[UIImage imageNamed:@"a3.png"],[UIImage imageNamed:@"a4.png"],[UIImage imageNamed:@"a5.png"],[UIImage imageNamed:@"a6.png"],[UIImage imageNamed:@"a7.png"],nil];
    [alarm setAnimationRepeatCount:0];
    
    alarm.animationDuration = 1;
    
    [alarm startAnimating];
    
    NSURL *buttonURL = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"soundfile" ofType:@"mp3"]];
    
    AudioServicesCreateSystemSoundID((__bridge CFURLRef)buttonURL, &SoundID);
    
    AudioServicesPlaySystemSound(SoundID);
    
}

-(IBAction)alertoff:(id)sender
{
    alarm.hidden = YES;
    pressbutton.hidden = YES;
    alertbutton.hidden = NO;
    AudioServicesRemoveSystemSoundCompletion(SoundID);
    AudioServicesDisposeSystemSoundID(SoundID);
    [alarm stopAnimating];
}
-(IBAction)profileactionsheet
{
    AppDelegate *ap = (AppDelegate *)[[UIApplication sharedApplication]delegate];
    if (ap.stafforstudent)
    {
        actionSheet =[[UIActionSheet alloc]initWithTitle:@" John Smith" delegate:self cancelButtonTitle:nil destructiveButtonTitle:@"" otherButtonTitles:nil, nil];
        [actionSheet showFromRect:CGRectMake(954, -10, 50, 75) inView:self.view animated:YES];
        UIButton *btns2 =[[actionSheet subviews]objectAtIndex:1];
        btns2.showsTouchWhenHighlighted = YES;
        [btns2 setBackgroundImage:[UIImage imageNamed:@"action3.png"] forState:UIControlStateNormal];
    }
    else
    {
        actionSheet =[[UIActionSheet alloc]initWithTitle:@"Aaron Davidson" delegate:self cancelButtonTitle:nil destructiveButtonTitle:@"" otherButtonTitles:@"", nil];
        [actionSheet showFromRect:CGRectMake(964, -10, 50, 75) inView:self.view animated:YES];
        UIButton *btn = [[actionSheet subviews] objectAtIndex:1];
        btn.showsTouchWhenHighlighted = YES;
        UIButton *btns2 =[[actionSheet subviews]objectAtIndex:2];
        btns2.showsTouchWhenHighlighted = YES;
        [btn setBackgroundImage:[UIImage imageNamed:@"action1.png"] forState:UIControlStateNormal];
        [btns2 setBackgroundImage:[UIImage imageNamed:@"action3.png"] forState:UIControlStateNormal];

    }
}
-(void)actionSheet:(UIActionSheet *)actionSheet1 clickedButtonAtIndex:(NSInteger)buttonIndex
{
    AppDelegate *ap = (AppDelegate *)[[UIApplication sharedApplication]delegate];
    if (ap.stafforstudent)
    {
        if( buttonIndex >=0)
        {
            if (buttonIndex == 0)
            {
                backtologin = [[NewLoginViewController alloc]initWithNibName:@"NewLoginViewController" bundle:nil];
                [self presentViewController:backtologin animated:NO completion:nil];
            }
        }
    }
    else
    {
        if( buttonIndex >=0)
        {
            if (buttonIndex == [ actionSheet destructiveButtonIndex])
            {
                profileactionview = [[MyprofileViewController alloc]initWithNibName:@"MyprofileViewController" bundle:nil];
                [self presentViewController:profileactionview animated:NO completion:nil];
            }
            if (buttonIndex == 1)
            {
                backtologin = [[NewLoginViewController alloc]initWithNibName:@"NewLoginViewController" bundle:nil];
                [self presentViewController:backtologin animated:NO completion:nil];
            }
        }

    }
}

-(IBAction)facetimecall
{
    NSURL *url = [NSURL URLWithString:@"facetime://babu0301@gmail.com"];
    [[UIApplication sharedApplication] openURL:url];
   // NSURLRequest *httpReq = [NSURLRequest requestWithURL:url];
}

@end
