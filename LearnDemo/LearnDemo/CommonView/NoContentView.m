//
//  NoContentView.m
//  MPLWade
//
//  Created by apple on 2018/5/9.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "NoContentView.h"
#import "Masonry.h"
#import "UIColor+AMCategory.h"

#define kImageSize 120

@interface NoContentView()<UIScrollViewDelegate>
@property(nonatomic, strong) UIImageView *imageView;
@property (nonatomic,strong) UILabel *topLabel;
@property (nonatomic,strong) UILabel *bottomLabel;
@end

@implementation NoContentView

#pragma mark - 构造方法

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        // UI搭建
        [self setUpUI];
    }
    return self;
}

#pragma mark - UI搭建
/** UI搭建 */
- (void)setUpUI{
    self.backgroundColor = [UIColor whiteColor];
    
    //------- 图片 -------//
    self.imageView = [[UIImageView alloc]init];
    [self addSubview:self.imageView];
    
    //------- 内容描述 -------//
    self.topLabel = [[UILabel alloc]init];
    [self addSubview:self.topLabel];
    self.topLabel.textAlignment = NSTextAlignmentCenter;
    self.topLabel.font = [UIFont systemFontOfSize:15];
    self.topLabel.textColor = [UIColor colorWithHexString:@"484848"];
    
    //------- 提示点击重新加载 -------//
    self.bottomLabel = [[UILabel alloc]init];
    [self addSubview:self.bottomLabel];
    self.bottomLabel.textAlignment = NSTextAlignmentCenter;
    self.bottomLabel.font = [UIFont systemFontOfSize:15];
    self.bottomLabel.textColor = [UIColor colorWithHexString:@"484848"];
    
    //------- 建立约束 -------//
    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self);
        make.centerY.mas_offset(-90);
        make.size.mas_equalTo(CGSizeMake(kImageSize, kImageSize));
    }];
    
    [self.topLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.imageView.mas_bottom).mas_offset(10);
        make.left.right.mas_offset(0);
        make.height.mas_equalTo(20);
    }];
    
    [self.bottomLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.topLabel.mas_bottom).mas_offset(5);
        make.left.right.mas_offset(0);
        make.height.mas_equalTo(20);
    }];
}
#pragma mark - 根据传入的值创建相应的UI
/** 根据传入的值创建相应的UI */
-(void)setType:(NoContentType)type{
    switch (type) {
        case NoContentTypeNetwork:{ // 没网
             [self setImage:@"noNetwork" topLabelText:NSLocalizedString(@"noNetwork", @"网络出现问题~") bottomLabelText:NSLocalizedString(@"tryAgain", @"点击重试")];
            break;
        }
        case NoContentTypeData:{//没有数据
             [self setImage:@"noData" topLabelText:NSLocalizedString(@"noData",@"暂时没有数据~") bottomLabelText:NSLocalizedString(@"reload", @"点击重新加载")];
            break;
        }
        case NoReportData:{ // 没有报告
            [self setImage:@"noReportData" topLabelText:NSLocalizedString(@"noReportData", @"暂无报告~") bottomLabelText:NSLocalizedString(@"reload", @"点击重新加载")];
            break;
        }
        case NoSurveyData:{//没有调研
            [self setImage:@"noSurveyData" topLabelText:NSLocalizedString(@"noSurveyData",@"暂无没有调研~") bottomLabelText:NSLocalizedString(@"reload", @"重新加载")];
            break;
        }
        case NoBeginQuestData:{//暂无发起问卷
            [self setImage:@"noBeginQuestData" topLabelText:NSLocalizedString(@"noBeginQuestData",@"暂无发起问卷~") bottomLabelText:NSLocalizedString(@"reload", @"重新加载")];
            break;
        }
        case NoSearchData:{//暂无搜索结果
            [self setImage:@"noSearchData" topLabelText:NSLocalizedString(@"noSearchData",@"暂无搜索结果~") bottomLabelText:NSLocalizedString(@"reload", @"重新加载")];
            break;
        }
        case NoFinishQuestData:{//暂无完成的问卷
            [self setImage:@"noFinishQuestData" topLabelText:NSLocalizedString(@"noFinishQuestData",@"暂无完成问卷~") bottomLabelText:NSLocalizedString(@"reload", @"重新加载")];
            break;
        }
        case NoBeignVoteData:{//暂无正在进行的投票
            [self setImage:@"noBeignVoteData" topLabelText:NSLocalizedString(@"noBeignVoteData",@"暂无正在进行的投票~") bottomLabelText:NSLocalizedString(@"reload", @"重新加载")];
            break;
        }
        case NoFinishVoteData:{//暂无完成的投票
            [self setImage:@"noFinishVoteData" topLabelText:NSLocalizedString(@"noFinishVoteData",@"暂无暂无完成投票~") bottomLabelText:NSLocalizedString(@"reload", @"重新加载")];
            break;
        }
        case WatingPanelResult:{//等待panel认证审核
            [self setImage:@"waitingPanelResult" topLabelText:NSLocalizedString(@"panelWatingTip", @"提交成功，Panel认证正在审核中") bottomLabelText:[NSString stringWithFormat:@"%@...",NSLocalizedString(@"TipWating", @"请耐心等待")]];
            break;
        }
        case NoRedPacketData:{ //暂无红包
            [self setImage:@"noRedPacket" topLabelText:NSLocalizedString(@"noRedPacketData",@"暂无红包~") bottomLabelText:NSLocalizedString(@"reload", @"重新加载")];
            break;
        }
        case NoRecieveRedPacketData:{ //暂无未领取红包
            [self setImage:@"noRedPacket" topLabelText:NSLocalizedString(@"noRedPaketReceive",@"您还没有未领取的红包哦") bottomLabelText:@""];
            break;
        }
        case NoRecieveRedPacketListData:{ //暂无未领取红包
            [self setImage:@"noRedPacket" topLabelText:NSLocalizedString(@"noRedPaketReceiveList",@"您还未收到任何红包哦") bottomLabelText:@""];
            break;
        }
        case NoSendRedPacketListData:{ //暂无未发送红包
            [self setImage:@"noRedPacket" topLabelText:NSLocalizedString(@"noSendRedPacketList",@"小伙伴还等你发红包呢") bottomLabelText:@""];
            break;
        }
        case NoInvitationListData:{ //暂无邀请好友列表
            [self setImage:@"noInvitaiton" topLabelText:NSLocalizedString(@"noInvitationList",@"立即邀请好友获得INBP") bottomLabelText:@""];
            break;
        }
        case NoMessageData:{//没有消息
            [self setImage:@"noMessage" topLabelText:NSLocalizedString(@"noMessage",@"暂时没有消息~") bottomLabelText:NSLocalizedString(@"reload", @"点击重新加载")];
            break;
        }
        default:
            break;
    }
}
#pragma mark - 设置图片和文字
/** 设置图片和文字 */
- (void)setImage:(NSString *)imageName topLabelText:(NSString *)topLabelText bottomLabelText:(NSString *)bottomLabelText{
    self.imageView.image = [UIImage imageNamed:imageName];
    self.topLabel.text = topLabelText;
    self.bottomLabel.text = bottomLabelText;
}

@end
