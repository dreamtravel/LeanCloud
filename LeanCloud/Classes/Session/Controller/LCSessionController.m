//
//  LCSessionController.m
//  LeanCloud
//
//  Created by Mac on 15/11/17.
//  Copyright © 2015年 Macmini. All rights reserved.
//

#import "LCSessionController.h"
#import "LCMessage.h"
#import "LCMessageFrame.h"
#import "LCMessageCell.h"

@interface LCSessionController () <UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate>

@property (nonatomic, strong) NSMutableArray *messageFrames;
@property (weak, nonatomic) IBOutlet UIView *bottomView;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UITextField *inputField;

@end

@implementation LCSessionController

#pragma mark - 懒加载数据
- (NSMutableArray *)messageFrames {
    if (_messageFrames == nil) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"messages.plist" ofType:nil];
        NSArray *arrayDict = [NSArray arrayWithContentsOfFile:path];
        NSMutableArray *arrayModels = [NSMutableArray array];
        for (NSDictionary *dict in arrayDict) {
            LCMessage *model = [LCMessage messageWithDict:dict];
            LCMessageFrame *modelFrame = [[LCMessageFrame alloc] init];
            //判断当前模型的消息发送时间是否和上一个模型的发送时间一致，如果一致则做个标记
            LCMessage *lastMessage = (LCMessage *)[[arrayModels lastObject] message];
            model.hideTime = [model.time isEqualToString:lastMessage.time];
            
            modelFrame.message = model;
            [arrayModels addObject:modelFrame];
        }
        _messageFrames = arrayModels;
    }
    return _messageFrames;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // 设置界面
    [self setupUI];

    //监听键盘弹出事件
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillChangeFrame:)
                               name:UIKeyboardWillChangeFrameNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidChangeFrame:)
                               name:UIKeyboardDidChangeFrameNotification object:nil];
}

- (void)setupUI {
    // 取消分割线
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    // 设置背景颜色
    self.tableView.backgroundColor = [UIColor colorWithRed:224/255.0 green:224/255.0 blue:224/255.0 alpha:1.0];
    UIImage *image = [UIImage imageNamed:@"tabbar_bg"];
    UIImage *newImage = [image stretchableImageWithLeftCapWidth:image.size.width * 0.5 topCapHeight:image.size.height * 0.5];
    self.bottomView.backgroundColor = [UIColor colorWithPatternImage:newImage];
    // 设置cell不可被选中
    self.tableView.allowsSelection = NO;
    // 设置文本框左边距
    UIView *leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 5, 5)];
    self.inputField.leftView = leftView;
    self.inputField.leftViewMode = UITextFieldViewModeAlways;
    self.inputField.returnKeyType = UIReturnKeySend;
    
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    if (self.messageFrames.count == 0)
        return ;
    // 滚动到最下方
    NSIndexPath *lastRowIdxPath = [NSIndexPath indexPathForItem:self.messageFrames.count - 1 inSection:0];
    [self.tableView scrollToRowAtIndexPath:lastRowIdxPath atScrollPosition:UITableViewScrollPositionTop animated:NO];
    
}

#pragma mark - Table View DataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.messageFrames.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    LCMessageCell *cell = [LCMessageCell cellWithTableView:tableView];
    cell.messageFrame = self.messageFrames[indexPath.row];
    return cell;
}

#pragma mark - Table View Delegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [self.messageFrames[indexPath.row] rowHeight];
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    [self.view endEditing:YES];
}

#pragma mark - Text Field Delegate
// 用户点击了return(发送)按钮
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    // 获取输入文本
    NSString *text = textField.text;
    [self sendMessageWithText:text withType:LCMessageTypeSelf];
    // 获取网络数据
    [self getNetworkSessionData:text];
    NSLog(@"%@", textField.text);
    textField.text = nil;
    return YES;
}

- (void)getNetworkSessionData:(NSString *)sendText {
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    parameters[@"key"] = @"0d271b9d40e49124ade400a11a8b34c4";                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
    parameters[@"info"] = sendText;
    [manager GET:@"http://www.tuling123.com/openapi/api" parameters:parameters success:^(NSURLSessionDataTask *task, id responseObject) {
        NSString *text = responseObject[@"text"];
        [self sendMessageWithText:text withType:LCMessageTypeYour];
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        NSString *text = @"网络错误";
        [self sendMessageWithText:text withType:LCMessageTypeYour];
    }];
}
// 发送信息处理
- (void)sendMessageWithText:(NSString *)text withType:(LCMessageType)type {
    // 创建一个数据模型和frame模型
    LCMessage *model = [[LCMessage alloc] init];
    NSDate *nowDate = [NSDate date];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"今天 HH:mm";
    model.time = [formatter stringFromDate:nowDate];
    model.type = type;
    model.text = text;
    LCMessageFrame *frameModel = [[LCMessageFrame alloc] init];
    LCMessageFrame *lastMessageFrame = [self.messageFrames lastObject];
    if ([model.time isEqualToString:lastMessageFrame.message.time]) {
        model.hideTime = YES;
    } else {
        model.hideTime = NO;
    }
    frameModel.message = model;
    // 将frame模型加到集合中
    [self.messageFrames addObject:frameModel];
    // 刷新数据
    [self.tableView reloadData];
    // 滚动
    NSIndexPath *lastRowIdxPath = [NSIndexPath indexPathForItem:self.messageFrames.count - 1 inSection:0];
    [self.tableView scrollToRowAtIndexPath:lastRowIdxPath atScrollPosition:UITableViewScrollPositionTop animated:YES];
}

#pragma mark - Notification Respond Method
// 键盘即将显示
- (void)keyboardWillChangeFrame:(NSNotification *)notiInfo {
    CGRect keyboardRect = [notiInfo.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];

    CGFloat keyboardY = keyboardRect.origin.y;

    [UIView animateWithDuration:0.25 animations:^{
        self.view.transform = CGAffineTransformMakeTranslation(0, keyboardY - [UIScreen mainScreen].bounds.size.height);
    }];
}

// 键盘显示完毕
- (void)keyboardDidChangeFrame:(NSNotification *)notiInfo {
    if (self.messageFrames.count == 0)
        return ;
    NSIndexPath *lastRowIdxPath = [NSIndexPath indexPathForItem:self.messageFrames.count - 1 inSection:0];
    [self.tableView scrollToRowAtIndexPath:lastRowIdxPath atScrollPosition:UITableViewScrollPositionTop animated:YES];
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
