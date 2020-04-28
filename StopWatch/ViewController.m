//
//  ViewController.m
//  StopWatch
//
//  Created by Batuhan Güneş on 15.08.2019.
//  Copyright © 2019 Batuhan Güneş. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize timerLabel,startStopSegmented,resetButton;


- (void)viewDidLoad {
    [super viewDidLoad];
    
    //Değişkenlerimizin başlangıç değerlerini giriyoruz.
    startStopSegmented.selectedSegmentIndex = 1;
    timerLabel.text = @"00:00:00";
    running = NO;
    count = 0;
    
    resetButton.layer.cornerRadius = 45;    //reset butonumuzu yuvarlak görünmesini sağlıyoruz.
}


- (IBAction)startStopSegmentChangeValue:(id)sender {
    
    if(running == NO){
        running = YES;  //sayacın başladığını belirtiyoruz.
        startStopSegmented.selectedSegmentIndex = 0;    //segmented tıklandığında seçili segmentin indexini değiştirerek method içindeki olayların gerçekleşmeye başladığını görsel olarak kullanıcıya belirtiyoruz.
        
        if(myTimer == nil){
            myTimer = [NSTimer
                       scheduledTimerWithTimeInterval:0.01
                       target:self
                       selector:@selector(updateTimer)
                       userInfo:nil
                       repeats:YES];
        }
    }else{
        running = NO;   //sayacın durduğunu belirtiyoruz.
        [myTimer invalidate];
        myTimer = nil;
        startStopSegmented.selectedSegmentIndex = 1;
    }
}

//sayacı sıfırlıyoruz.
- (IBAction)resetButtonPushed:(id)sender {
    
    running = NO;
    [myTimer invalidate];
    myTimer = nil;
    startStopSegmented.selectedSegmentIndex = 1;
    count = 0;
    timerLabel.text = @"00:00:00";
}


- (void)updateTimer {
    
    count++;
    
    int minute = floor(count/100/60);
    int second = floor(count/100);
    int miliSecond = count % 100;
    
    //saniye 60 olduğunda sıfırlanmasını ve dakikanın 1 artmasını sağlar.
    if(second >= 60){
        second = second % 60;
    }
    
    timerLabel.text = [NSString stringWithFormat:@"%02d,%02d,%02d",minute,second,miliSecond];
}

@end
