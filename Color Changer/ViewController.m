//
//  ViewController.m
//  Color Changer
//
//  Created by Михаил Поддубный on 17.07.16.
//  Copyright © 2016 Михаил Поддубный. All rights reserved.
//

#import "ViewController.h"
#import "InputTextField.h"
#import "ColorChangingButton.h"
#import "SaveButton.h"
#import "OutputTableView.h"

#define kLeftInset 20
#define kTopInset 20
#define selfViewWidth self.view.frame.size.width

@interface ViewController () <InputTextFieldDelegate, ColorChangingButtonDelegate, SaveButtonDelegate, UITableViewDelegate, UITableViewDataSource>

@property IBOutlet InputTextField       *input;
@property IBOutlet ColorChangingButton  *redButton;
@property IBOutlet ColorChangingButton  *yellowButton;
@property IBOutlet ColorChangingButton  *greenButton;
@property IBOutlet SaveButton           *saveButton;
@property IBOutlet OutputTableView      *output;
@property          NSInteger            numberOfSaves;


@end

@implementation ViewController

#pragma mark - LifeCycle

- (void) viewWillLayoutSubviews {
    [self.input setFrame: CGRectMake(kLeftInset, kTopInset, selfViewWidth - 2 * kLeftInset, 50)];
    [self.redButton setFrame: CGRectMake(kLeftInset, self.input.frame.origin.y + self.input.frame.size.height + kTopInset, (selfViewWidth - 4 * kLeftInset) / 3, 50)];
    [self.yellowButton setFrame: CGRectMake(self.redButton.frame.origin.x + self.redButton.frame.size.width + kLeftInset, self.input.frame.origin.y + self.input.frame.size.height + kTopInset, (selfViewWidth - 4 * kLeftInset) / 3, 50)];
    [self.greenButton setFrame: CGRectMake(self.yellowButton.frame.origin.x + self.yellowButton.frame.size.width + kLeftInset, self.input.frame.origin.y + self.input.frame.size.height + kTopInset, (selfViewWidth - 4 * kLeftInset) / 3, 50)];
    [self.saveButton setFrame: CGRectMake(kLeftInset, self.redButton.frame.origin.y + self.redButton.frame.size.height + kTopInset, selfViewWidth - 2 * kLeftInset, 50)];
    [self.output setFrame: CGRectMake(kLeftInset, kTopInset + self.saveButton.frame.origin.y + self.saveButton.frame.size.height, selfViewWidth - 2 * kLeftInset, self.view.frame.size.height - self.saveButton.frame.origin.y - self.saveButton.frame.size.height - 2 * kTopInset)];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //Инициализация InputTextField *input
    self.input = [InputTextField new];
    [self.view addSubview: self.input];
    self.input.vcDelegate = (id) self;
    //Инициализация ColorChangingButton *redButton
    self.redButton = [[ColorChangingButton alloc] initWithButtonType: MyColorChangingButtonTypeRed];
    [self.view addSubview: self.redButton];
    self.redButton.vcDelegate = (id) self;
    //Инициализация ColorChangingButton *yellowButton
    self.yellowButton = [[ColorChangingButton alloc] initWithButtonType: MyColorChangingButtonTypeYellow];
    [self.view addSubview: self.yellowButton];
    self.yellowButton.vcDelegate = (id) self;
    //Инициализация ColorChangingButton *greenButton
    self.greenButton = [[ColorChangingButton alloc] initWithButtonType: MyColorChangingButtonTypeGreen];
    [self.view addSubview: self.greenButton];
    self.greenButton.vcDelegate = (id) self;
    //Инициализация SaveButton *saveButton
    self.saveButton = [SaveButton new];
    [self.view addSubview: self.saveButton];
    self.saveButton.vcDelegate = (id) self;
    //Инициализация OutputTableView *output
    self.output = [OutputTableView new];
    [self.view addSubview: self.output];
    self.numberOfSaves = 0;
    self.output.delegate = (id) self;
    self.output.dataSource = (id) self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - InputTextFieldDelegate Realisation

- (void) textEntered: (NSString *) enteredText {
    UITableViewCell *cell0 = [self tableView:self.output cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
    [cell0.textLabel setText: [cell0.textLabel.text stringByAppendingString:enteredText]];
    [self tableView:self.output cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
    [self.output reloadRowsAtIndexPaths: [NSArray arrayWithObject: [NSIndexPath indexPathForRow:0 inSection:0]] withRowAnimation:UITableViewRowAnimationFade];
}

#pragma mark - ColorChangingButtonDelegate Realisation

- (void) changeColor:(MyColorChangingButtonType)colorChangingButtonType {
    UIColor *color;
    UITableViewCell *cell0 = [self tableView: self.output cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
    switch (colorChangingButtonType) {
        case MyColorChangingButtonTypeRed:
            color = [UIColor redColor];
            break;
        case MyColorChangingButtonTypeYellow:
            color = [UIColor yellowColor];
            break;
        case MyColorChangingButtonTypeGreen:
            color = [UIColor greenColor];
            break;
    }
    if (cell0 != nil) {
        [cell0.textLabel setBackgroundColor: color];
    }
    //[self tableView:self.output cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]] ;
    [self.output reloadRowsAtIndexPaths: [NSArray arrayWithObject: [NSIndexPath indexPathForRow:0 inSection:0]] withRowAnimation:UITableViewRowAnimationFade];
}

#pragma mark - SaveButtonDelegate Realisation

- (void) saveChanges {
    [self.output beginUpdates];
    self.numberOfSaves ++;
    [self.output insertRowsAtIndexPaths:[NSArray arrayWithObject: [NSIndexPath indexPathForRow:1 inSection:0]] withRowAnimation:UITableViewRowAnimationFade];
    //[self tableView: self.output cellForRowAtIndexPath:[NSIndexPath indexPathForRow:1 inSection:0]];
    [self.output endUpdates];
}

#pragma mark - UITableViewDataSource Realisation

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.numberOfSaves + 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *simpleTableIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]
                initWithStyle:UITableViewCellStyleDefault
                reuseIdentifier:simpleTableIdentifier];
        if (!([indexPath isEqual: [NSIndexPath indexPathForRow:0 inSection:0]])) {
            cell.textLabel.text = [[[self tableView:self.output cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]] textLabel] text];
            cell.textLabel.backgroundColor = [[[self tableView:self.output cellForRowAtIndexPath: [NSIndexPath indexPathForRow:0 inSection:0]] textLabel] backgroundColor];
        }
    }
    return cell;
}

@end
