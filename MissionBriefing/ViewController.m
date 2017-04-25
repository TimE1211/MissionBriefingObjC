//
//  ViewController.m
//  MissionBriefing
//
//  Created by Timothy Hang on 4/24/17.
//  Copyright © 2017 Timothy Hang. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *greetingLabel;
@property (weak, nonatomic) IBOutlet UITextView *briefingTextView;
@property (weak, nonatomic) IBOutlet UITextField *agentUserTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;

@end

@implementation ViewController

- (void)viewDidLoad
{
  [super viewDidLoad];
  // Do any additional setup after loading the view, typically from a nib.
  
  self.greetingLabel.text = @"";
  self.briefingTextView.text = @"";
}


- (void)didReceiveMemoryWarning
{
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

- (IBAction)authenticateAgent:(UIButton *)sender
{
  [self signInAgent];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
  BOOL rc = NO;
  
  if (![textField.text isEqualToString:@""])
  {
    if (self.agentUserTextField)
    {
      [self.passwordTextField becomeFirstResponder];
    }
    else if (self.passwordTextField)
    {
      rc = YES;
      [self signInAgent];
    }
  }
  return rc;
}

- (void)signInAgent
{

  if ([self.agentUserTextField isFirstResponder])
  {
    [self.agentUserTextField resignFirstResponder];
  }
  if ([self.passwordTextField isFirstResponder])
  {
    [self.passwordTextField resignFirstResponder];
  }
  
  UIColor *backgroundColor;
    
  if (![self.agentUserTextField.text isEqualToString:@""] && ![self.passwordTextField.text isEqualToString:@""])
  {
    NSString *fullName = self.agentUserTextField.text;
    NSArray *fullNameArr = [fullName componentsSeparatedByString:@" "];
    NSString *lastName = [fullNameArr objectAtIndex: 1];
    
    self.greetingLabel.text = [NSString stringWithFormat:@"Good evening, Agent %@", lastName];

    self.briefingTextView.text = [NSString stringWithFormat:@"This mission will be an arduous one, fraught with peril. You will cover much strange and unfamiliar territory. Should you choose to accept this mission, Agent %@" "you will certainly be disavowed, but you will be doing your country a great service. This message will self destruct in 5 seconds.", lastName];

    
    backgroundColor = [[UIColor alloc] initWithRed:(0.585) green:0.78 blue:0.188 alpha:1];
  }
  else
  {
    backgroundColor = [[UIColor alloc] initWithRed:(0.78) green:0.188 blue:0.188 alpha:1];
  }
  
  [self.view setBackgroundColor:backgroundColor];
}


@end
