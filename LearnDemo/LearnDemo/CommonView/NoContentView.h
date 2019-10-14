//
//  NoContentView.h
//  MPLWade
//
//  Created by apple on 2018/5/9.
//  Copyright © 2018年 apple. All rights reserved.
//
//  无数据占位图
#import <UIKit/UIKit.h>
// 无数据占位图的类型
typedef NS_ENUM(NSInteger, NoContentType) {
    /** 无网络 */
    NoContentTypeNetwork = 0,
    /** 无数据 */
    NoContentTypeData   = 1,
    /*暂无报告*/
    NoReportData = 2,
    /*暂无调研*/
    NoSurveyData = 3,
    /*暂无发起问卷*/
    NoBeginQuestData = 4,
    /*暂无搜索结果*/
    NoSearchData = 5,
    /*暂无完成问卷*/
    NoFinishQuestData = 6,
    /*暂无正在进行的投票*/
    NoBeignVoteData = 7,
    /*暂无完成的投票*/
    NoFinishVoteData = 8,
    
    /* 等待panel认证审核 */
    WatingPanelResult = 9,
    
    /* 暂无红包 */
    NoRedPacketData = 10,
    /* 暂无未领取红包 */
    NoRecieveRedPacketData = 11,
    /* 暂无未领取红包列表 */
    NoRecieveRedPacketListData = 12,
    /* 暂无未发送的红包列表 */
    NoSendRedPacketListData = 13,
    
    /* 暂无邀请好友列表 */
    NoInvitationListData = 14,
    
    /** 暂无消息 */
    NoMessageData = 15,
};

@interface NoContentView : UIView
@property(nonatomic, assign) NoContentType type; /** 无数据占位图的类型 */
@end
