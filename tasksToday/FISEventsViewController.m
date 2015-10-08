//
//  FISEventsViewController.m
//  tasksToday
//
//  Created by Joe Burgess on 6/19/14.
//  Copyright (c) 2014 Joe Burgess. All rights reserved.
//

#import "FISEventsViewController.h"
#import <EventKit/EventKit.h>

@interface FISEventsViewController ()
@property (strong, nonatomic) IBOutlet UITextView *textView;

@end

@implementation FISEventsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSMutableString *result = [[NSMutableString alloc] init];
    for (EKEvent *event in self.events) {
        [result appendString:event.title];
        if (event != [self.events lastObject]) {
            [result appendString:@"\n"];
        }
    }
    self.textView.text = result;


    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
