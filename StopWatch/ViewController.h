//
//  ViewController.h
//  StopWatch
//
//  Created by Batuhan Güneş on 15.08.2019.
//  Copyright © 2019 Batuhan Güneş. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
{
    NSTimer *myTimer;
    BOOL running;       //saymaya devam edip etmediğini kontrol ediyoruz.
    int count;          //Timerden gelen verinin tutulması için bir değişken
}

@property (weak, nonatomic) IBOutlet UILabel *timerLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *startStopSegmented;
@property (weak, nonatomic) IBOutlet UIButton *resetButton;

- (IBAction)startStopSegmentChangeValue:(id)sender;
- (IBAction)resetButtonPushed:(id)sender;

- (void)updateTimer;

@end

