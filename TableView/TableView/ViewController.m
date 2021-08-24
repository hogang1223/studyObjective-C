//
//  ViewController.m
//  TableView
//
//  Created by stocktong on 2021/08/23.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.a = [[NSMutableArray alloc] init];
    for (NSInteger i=0; i<=100; i++){
        [self.a addObject:[NSNumber numberWithInteger:i]];
    }
    
    // Do any additional setup after loading the view.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.a count];
}

- (UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath{
    
    static NSString *identifier = @"intNumCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];

    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    
    cell.textLabel.text = [[self.a objectAtIndex:indexPath.row]stringValue];

    
    return cell;
}

@end
