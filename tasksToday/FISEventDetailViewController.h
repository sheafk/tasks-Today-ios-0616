//
//  FISEventDetailViewController.h
//  tasksToday
//
//  Created by Shea Furey-King on 6/22/16.
//  Copyright © 2016 Joe Burgess. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <EventKit/EventKit.h>

@interface FISEventDetailViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIButton *nextYearButton;

@property (weak, nonatomic) IBOutlet UIButton *lastYearButton;

@property EKEvent *event;

- (void)requestCalendarPermission;
- (NSArray *)getNextYearsEvents;
- (NSArray *)getLastYearsEvents;


@end
