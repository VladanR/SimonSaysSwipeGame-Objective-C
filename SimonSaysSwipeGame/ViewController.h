//
//  ViewController.h
//  SimonSaysSwipeGame
//
//  Created by Vladan Randjelovic on 25/05/2020.
//  Copyright © 2020 Vladan Randjelovic. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController {
    
    NSTimer *gameTimer;
    NSTimer *simonTimer;
    
    int gameMode;
    int timeValue;
    int scoreValue;
    
}

@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *simonLabel;
@property (weak, nonatomic) IBOutlet UIButton *startButton;

@property (nonatomic, strong) UISwipeGestureRecognizer *swipeLeft;
@property (nonatomic, strong) UISwipeGestureRecognizer *swipeRight;
@property (nonatomic, strong) UISwipeGestureRecognizer *swipeUp;
@property (nonatomic, strong) UISwipeGestureRecognizer *swipeDown;

- (IBAction)startGame:(id)sender;

@end

