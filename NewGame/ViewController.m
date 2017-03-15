//
//  ViewController.m
//  NewGame
//
//  Created by Prajakta Vishwas Sonawane on 3/13/17.
//  Copyright © 2017 Prajakta Vishwas Sonawane. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    NSTimer *timer;
    int x1,y1;
    float time;
}
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    time=3;
    
    // Do any additional setup after loading the view, typically from a nib.
    timer=[NSTimer scheduledTimerWithTimeInterval:time target:self selector:@selector(moveImage:) userInfo:nil repeats:YES];
}

-(void)moveImage:(id)sender
{
    
    int smallest = 10;
    x1 = smallest + arc4random() % (300);
    y1 = smallest + arc4random() % (450);

    CGPoint loc1;
    loc1.x = x1;
    loc1.y = y1;
    movingImg.center=loc1;
    NSLog(@"Timer Fired------: %d %d",x1,y1);
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *tch = [[event allTouches] anyObject];
    CGPoint loc=[tch locationInView:tch.view];
    touchImg.center=loc;
    NSLog(@"Timer Fired: %f %f",loc.x, loc.y);
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Level Change" message:@"You are now moving to nextlevel" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    if(CGPointEqualToPoint(movingImg.center,touchImg.center))
    {
        [alert show ];
        time=time-0.05;
        
        if(time<=1)
        {
            alert.message=@"The game is over";
            [alert show];
            
        }
        else
        {
            timer=[NSTimer scheduledTimerWithTimeInterval:time target:self selector:@selector(moveImage:) userInfo:nil repeats:YES];
        }
    }
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self touchesBegan:touches withEvent:event];
}

-(void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
