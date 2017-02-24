//
//  WMexamAnswerCellTableViewCell.m
//  WM_DriverAssistant
//
//  Created by lei wang on 2017/2/24.
//  Copyright © 2017年 王雷. All rights reserved.
//

#import "WMexamAnswerCellTableViewCell.h"

@interface WMexamAnswerCellTableViewCell ()

@property (weak, nonatomic) IBOutlet UIButton *btAnswerIndex;

@end

@implementation WMexamAnswerCellTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    _labelAnserIndex.layer.borderWidth = 1.0;
    _labelAnserIndex.layer.borderColor = [UIColor darkGrayColor].CGColor;
    _labelAnserIndex.clipsToBounds = YES;
    _labelAnserIndex.layer.cornerRadius = _labelAnserIndex.bounds.size.width/2;
    
    _labelAnswerContent.numberOfLines = 0; //允许多行显示
    
}


- (instancetype)initWithTableview:(UITableView *)tableview
{
    if (self = [super init]) {
        static NSString *cellID = @"WMexamAnswerCellTableViewCell";
        
        self = [tableview dequeueReusableCellWithIdentifier:cellID];
        if (nil == self) {
            self = [[[NSBundle mainBundle] loadNibNamed:@"WMexamAnswerCellTableViewCell" owner:nil options:nil] firstObject];
        }
    }
    return self;
}

+ (instancetype)answerCellWithTableView:(UITableView *)tableview
{
    return [[self alloc] initWithTableview:tableview];
}

- (void)setIsRightAnswer:(BOOL)isRightAnswer
{
    _isRightAnswer = isRightAnswer;
    
    self.btAnswerIndex.hidden = NO;
    
    if (_isRightAnswer) {
        [self.btAnswerIndex setImage:[UIImage imageNamed:@"anserRight"] forState:UIControlStateNormal];
    } else {
        [self.btAnswerIndex setImage:[UIImage imageNamed:@"answerWrong"] forState:UIControlStateNormal];
    }
}

@end
