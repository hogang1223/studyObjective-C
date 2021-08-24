//
//  ViewController.h
//  TextField
//
//  Created by stocktong on 2021/08/23.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UILabel *lblText;
@property (weak, nonatomic) IBOutlet UITextField *tfInput;
- (IBAction)actionOK:(id)sender;

@end

