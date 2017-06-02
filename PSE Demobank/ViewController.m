//
//  ViewController.m
//  PSE Demobank
//
//  Created by Nicolas Loira on 6/1/17.
//  Copyright © 2017 Khipu SpA. All rights reserved.
//

#import "ViewController.h"

#import "UIViewController+Utils.h"
#import "RDHExpandingPickerView.h"
#import <khenshin/khenshin.h>

@interface ViewController ()

@property (strong, nonatomic) NSDictionary* authorizers;
@property (strong, nonatomic) NSDictionary* userTypes;

@property (weak, nonatomic) IBOutlet RDHExpandingPickerView *authorizerPicker;
@property (weak, nonatomic) IBOutlet RDHExpandingPickerView *userTypePicker;

@property (weak, nonatomic) IBOutlet UITextField *ecus;
@property (weak, nonatomic) IBOutlet UITextField *amount;
@property (weak, nonatomic) IBOutlet UITextField *subject;
@property (weak, nonatomic) IBOutlet UITextField *commerce;
@property (weak, nonatomic) IBOutlet UITextField *email;
@property (weak, nonatomic) IBOutlet UITextField *returnURL;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
