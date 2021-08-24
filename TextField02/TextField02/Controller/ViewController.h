//
//  ViewController.h
//  TextField02
//
//  Created by stocktong on 2021/08/24.
//

#import <UIKit/UIKit.h>
#import "PopupViewController.h"

@interface ViewController : UIViewController<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UILabel *lblText;
@property (weak, nonatomic) IBOutlet UITextField *tfInput;
- (IBAction)actionAlert:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *btnAlert;
- (IBAction)tfEditting:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *btnClear;
- (IBAction)actionClear:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *btnXib;
- (IBAction)actionXib:(id)sender;


// popView
@property (nonatomic, strong) UIView *popView;
@property (nonatomic, strong) UILabel * lblPop;

// xib
@property(strong, nonatomic) PopupViewController *popupViewController;


@end

