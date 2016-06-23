//
//  FISEventDetailViewController.m
//  tasksToday
//
//  Created by Shea Furey-King on 6/22/16.
//  Copyright © 2016 Joe Burgess. All rights reserved.
//

#import "FISEventDetailViewController.h"
#import "FISEventYearDetailViewController.h"

@interface FISEventDetailViewController ()

@end

@implementation FISEventDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self requestCalendarPermission];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)requestCalendarPermission
{
    EKEventStore *store = [[EKEventStore alloc] init];
    [store requestAccessToEntityType:EKEntityTypeEvent completion:^(BOOL granted, NSError *error) {
        
    }];
}

- (NSArray *)getNextYearsEvents
{
    
    EKEventStore *store = [[EKEventStore alloc] init];
    // Get the appropriate calendar
    NSCalendar *calendar = [NSCalendar currentCalendar];
//
//    
//    // Create the end date components
    NSDateComponents *oneYearFromNowComponents = [[NSDateComponents alloc] init];
    oneYearFromNowComponents.year = 1;
    NSDate *oneYearFromNow = [calendar dateByAddingComponents:oneYearFromNowComponents
                                                       toDate:[NSDate date]
                                                      options:0];
    
    // Create the predicate from the event store's instance method
    NSPredicate *predicate = [store predicateForEventsWithStartDate:[NSDate date]
                                                            endDate:oneYearFromNow
                                                          calendars:nil];
    
    // Fetch all events that match the predicate
    NSArray *events = [store eventsMatchingPredicate:predicate];
    //Trying to work out bug below. Above was code given in lab.
    

    NSLog(@"STORE NEXT YEAR: %@", store);
    NSLog(@"events array NEXT YEAR: %@", events);
    
        return events;
    
}

- (NSArray *)getLastYearsEvents
{
    
    EKEventStore *store = [[EKEventStore alloc] init];
    // Get the appropriate calendar
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    // Create the start date components
    
    // Create the end date components
    NSDateComponents *oneYearFromNowComponents = [[NSDateComponents alloc] init];
    oneYearFromNowComponents.year = -1;
    NSDate *oneYearFromNow = [calendar dateByAddingComponents:oneYearFromNowComponents
                                                       toDate:[NSDate date]
                                                      options:0];
    
    // Create the predicate from the event store's instance method
    NSPredicate *predicate = [store predicateForEventsWithStartDate:oneYearFromNow
                                                            endDate:[NSDate date]
                                                          calendars:nil];
    
    // Fetch all events that match the predicate
    NSArray *events = [store eventsMatchingPredicate:predicate];
    NSLog(@"STORE LAST YEAR: %@", store);
    NSLog(@"events array LAST YEAR: %@", events);
    return events;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    FISEventYearDetailViewController *detailVC = (FISEventYearDetailViewController *)segue.destinationViewController;
    
    NSLog(@"prepareForSegue: %@", segue.identifier);
    if ([segue.identifier isEqualToString:@"lastYear"]){
        //detailVC.eventText = @"Last year!!";
        NSArray *events = [self getLastYearsEvents];
        //NSString *eventsToShow;
        
        for (EKEvent *event in events) {
            detailVC.eventText = [NSString stringWithFormat:@"%@\n", event.title];
            
            
            NSLog(@"%@ \n", event);
            NSLog(@"Is this what we want? %@", events);
        }
        
        
    } else if ([segue.identifier isEqualToString:@"nextYear"]) {
        //detailVC.eventText = @"Next year!!";
        
        NSArray *events = [self getNextYearsEvents];
        
        for (EKEvent *event in events) {
            NSLog(@"%@ \n", event);
            detailVC.eventText = [NSString stringWithFormat:@"%@\n", event.title];
            
            
        }
    }
    
    
    
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
