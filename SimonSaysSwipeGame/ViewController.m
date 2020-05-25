//
//  ViewController.m
//  SimonSaysSwipeGame
//
//  Created by Vladan Randjelovic on 25/05/2020.
//  Copyright © 2020 Vladan Randjelovic. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.simonLabel.layer.cornerRadius = 20;
    self.simonLabel.clipsToBounds = YES;
    
    timeValue = 20;
    scoreValue = 0;
    gameMode = 0;
    
    self.timeLabel.text = [NSString stringWithFormat:@"Time: %i", timeValue];
    self.scoreLabel.text = [NSString stringWithFormat:@"Score: %i", scoreValue];
    
    
    self.swipeLeft = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipes:)];
    self.swipeRight = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipes:)];
    self.swipeUp = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipes:)];
    self.swipeDown = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipes:)];
    
    self.swipeLeft.direction = UISwipeGestureRecognizerDirectionLeft;
    self.swipeRight.direction = UISwipeGestureRecognizerDirectionRight;
    self.swipeUp.direction = UISwipeGestureRecognizerDirectionUp;
    self.swipeDown.direction = UISwipeGestureRecognizerDirectionDown;
    
    [self.view addGestureRecognizer:self.swipeLeft];
    [self.view addGestureRecognizer:self.swipeRight];
    [self.view addGestureRecognizer:self.swipeUp];
    [self.view addGestureRecognizer:self.swipeDown];
}

-(void)handleSwipes:(UISwipeGestureRecognizer *)sender {
    
    if (gameMode == 1) {
        
        switch (sender.direction) {
            case UISwipeGestureRecognizerDirectionLeft:
                [simonTimer invalidate];
                if ([self.simonLabel.text isEqualToString:@"Simon Says Swipe Left"]) {
                    scoreValue += 1;
                    self.scoreLabel.text = [NSString stringWithFormat: @"Score: %i", scoreValue];
                } else {
                    scoreValue -= 1;
                    self.scoreLabel.text = [NSString stringWithFormat: @"Score: %i", scoreValue];
                }
                break;
            case UISwipeGestureRecognizerDirectionRight:
                [simonTimer invalidate];
                if ([self.simonLabel.text
                        isEqualToString:@"Simon Says Swipe Right"]) {
                  scoreValue += 1;
                  self.scoreLabel.text =
                      [NSString stringWithFormat:@"Score: %i", scoreValue];
                } else {
                  scoreValue -= 1;
                  self.scoreLabel.text =
                      [NSString stringWithFormat:@"Score: %i", scoreValue];
                }
                break;
            case UISwipeGestureRecognizerDirectionUp:
                [simonTimer invalidate];
                if ([self.simonLabel.text isEqualToString:@"Simon Says Swipe Up"]) {
                  scoreValue += 1;
                  self.scoreLabel.text =
                      [NSString stringWithFormat:@"Score: %i", scoreValue];
                } else {
                  scoreValue -= 1;
                  self.scoreLabel.text =
                      [NSString stringWithFormat:@"Score: %i", scoreValue];
                }
                break;
            case UISwipeGestureRecognizerDirectionDown:
                [simonTimer invalidate];
                if ([self.simonLabel.text isEqualToString:@"Simon Says Swipe Down"]) {
                  scoreValue += 1;
                  self.scoreLabel.text =
                      [NSString stringWithFormat:@"Score: %i", scoreValue];
                } else {
                  scoreValue -= 1;
                  self.scoreLabel.text =
                      [NSString stringWithFormat:@"Score: %i", scoreValue];
                }
                break;
        }
    }
    
    
}

- (IBAction)startGame:(id)sender {
    
    if (timeValue == 20) {
        
        gameTimer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(updateCounter) userInfo:nil repeats:YES];
        
        [self simonSays];
        gameMode = 1;
    }
    
}

-(void)updateCounter {
    
    timeValue -= 1;
    self.timeLabel.text = [NSString stringWithFormat:@"Time: %i", timeValue];
    
    if (timeValue == 0) {
        [gameTimer invalidate];
        [simonTimer invalidate];
        gameMode = 0;
    }
}

-(void)simonSays {

  NSArray *simonSayings = @[
    @"Simon Says Swipe Left", @"Simon Says Swipe Right",
    @"Simon Says Swipe Up", @"Simon Says Swipe Down",
    @"Swipe Left", @"Swipe Right",
    @"Swipe Up", @"Swipe Down"];
    
    int randomSaying = arc4random() % simonSayings.count;
    self.simonLabel.text = simonSayings[randomSaying];
    
    simonTimer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(simonSays) userInfo:nil repeats:NO];
}

@end
