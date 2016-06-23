//
//  FISEventYearDetailViewController.m
//  tasksToday
//
//  Created by Shea Furey-King on 6/22/16.
//  Copyright © 2016 Joe Burgess. All rights reserved.
//

#import "FISEventYearDetailViewController.h"

@interface FISEventYearDetailViewController ()

//@property (weak, nonatomic) IBOutlet UITextView *textViewButton;

@end

@implementation FISEventYearDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.textViewButton.text = self.eventText;
    
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
