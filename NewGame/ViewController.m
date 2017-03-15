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
    
    time=1;
   
    timer=[NSTimer scheduledTimerWithTimeInterval:time target:self selector:@selector(moveImage:) userInfo:nil repeats:YES];
}

-(void)moveImage:(id)sender
{
    
    int smallest = 10;
    x1 = smallest + arc4random() % (300);
    y1 = smallest + arc4random() % (450);

    CGPoint loc1;
    loc1.x = x1;
    //133;
    //x1;
    loc1.y = y1;
    //120;
    //y1;
    movingImg.center=loc1;
    NSLog(@"Timer Fired: %d %d",x1,y1);
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *tch = [[event allTouches] anyObject];
    CGPoint loc=[tch locationInView:tch.view];
//    loc.x = 133;
//    loc.y = 120;
    touchImg.center=loc;
    NSLog(@"Timer Fired: %f %f",loc.x, loc.y);
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Level Change" message:@"You are now moving to nextlevel" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    if(CGPointEqualToPoint(movingImg.center,touchImg.center))
    {
        [alert show ];
        alert.tag = 1;
        time=time-0.05;
        
        if(time<=0.8)
        {
            alert.message=@"The game is over";
            [alert show];
            alert.tag = 2;
            
        }
        else
        {
            timer=[NSTimer scheduledTimerWithTimeInterval:time target:self selector:@selector(moveImage:) userInfo:nil repeats:YES];
        }
    }
}
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (alertView.tag == 2)
    {
        [self performSegueWithIdentifier:@"completedgamevcsegue" sender:self];
        //Do something
    }
    else
    {
        //Do something else
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
