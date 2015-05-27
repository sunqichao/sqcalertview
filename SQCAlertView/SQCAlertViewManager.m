//
//  SQCAlertViewManager.m
//  SQCAlertViewDemo
//
//  Created by sun on 15/5/27.
//  Copyright (c) 2015年 sunqichao. All rights reserved.
//

#import "SQCAlertViewManager.h"

@implementation SQCAlertViewManager



+ (void)showAlertViewWithLeftYESTitle_:(NSString*)title
                               message:(NSString*)message
                    confirmButtonTitle:(NSString *)confirmButtonTitle
                    confirmButtonBlock:(void (^)(void))confirmButtonBlock
                     cancelButtonTitle:(NSString *)cancelButtonTitle
                     cancelButtonBlock:(void (^)(void))cancelButtonBlock;
{
    SQCBlockAlertView *alert = [[SQCBlockAlertView alloc] initWithTitle:title message:message delegate:nil cancelButtonTitle:cancelButtonTitle otherButtonTitles:confirmButtonTitle, nil];
    [alert setBlockForOk:confirmButtonBlock];
    [alert setBlockForCancel:cancelButtonBlock];
    [alert show];
}

+ (void)showAlertViewWithRightYESTitle_:(NSString*)title
                                message:(NSString*)message
                     confirmButtonTitle:(NSString *)confirmButtonTitle
                     confirmButtonBlock:(void (^)(void))confirmButtonBlock
                      cancelButtonTitle:(NSString *)cancelButtonTitle
                      cancelButtonBlock:(void (^)(void))cancelButtonBlock;
{
    SQCBlockAlertView *alert = [[SQCBlockAlertView alloc] initWithTitle:title message:message delegate:nil cancelButtonTitle:confirmButtonTitle otherButtonTitles:cancelButtonTitle, nil];
    [alert setBlockForOk:cancelButtonBlock];
    [alert setBlockForCancel:confirmButtonBlock];
    [alert show];
}


@end






@interface SQCBlockAlertView ()  <UIAlertViewDelegate>

@property (nonatomic, strong) NSMutableDictionary *buttonBlocks;
@property (nonatomic, weak) id<UIAlertViewDelegate> otherDelegate;

@end

@implementation SQCBlockAlertView

-(void)show
{
    self.otherDelegate = self.delegate;
    self.delegate = self;
    [super show];
}

- (void)setBlockForOk:(SQCAlertViewBlock)blockForOk
{
    [self setBlock:blockForOk atButtonIndex:1];
}

- (SQCAlertViewBlock)blockForOk
{
    return [[self buttonBlocks] objectForKey:@1];
}

- (void)setBlockForCancel:(SQCAlertViewBlock)blockForCancel
{
    [self setBlock:blockForCancel atButtonIndex:0];
}

- (SQCAlertViewBlock)blockForCancel
{
    return [self.buttonBlocks objectForKey:@0];
}

- (void)setBlock:(SQCAlertViewBlock)block atButtonIndex:(NSInteger)buttonIndex
{
    if (!self.buttonBlocks) {
        self.buttonBlocks = [NSMutableDictionary dictionary];
    }
    
    if (block) {
        SQCAlertViewBlock temp = [block copy];
        [self.buttonBlocks setObject:temp forKey:[NSNumber numberWithInteger:buttonIndex]];
    }
}

- (SQCAlertViewBlock)blockAtButtonIndex:(NSInteger)buttonIndex
{
    return [self.buttonBlocks objectForKey:[NSNumber numberWithInteger:buttonIndex]];
}

// Called when a button is clicked. The view will be automatically dismissed after this call returns
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    SQCAlertViewBlock block = [self blockAtButtonIndex:buttonIndex];
    if (block) {
        block();
    }
    
    if ([self.otherDelegate respondsToSelector:@selector(alertView:clickedButtonAtIndex:)]) {
        [self.otherDelegate alertView:alertView clickedButtonAtIndex:buttonIndex];
    }
}

- (void)willPresentAlertView:(UIAlertView *)alertView
{
    if (self.title == nil) {
        self.title = @"";
    }
    if ([self.otherDelegate respondsToSelector:@selector(willPresentAlertView:)]) {
        [self.otherDelegate willPresentAlertView:alertView];
    }
}

- (void)didPresentAlertView:(UIAlertView *)alertView
{
    if ([self.otherDelegate respondsToSelector:@selector(didPresentAlertView:)]) {
        [self.otherDelegate didPresentAlertView:alertView];
    }
}

- (void)alertView:(UIAlertView *)alertView willDismissWithButtonIndex:(NSInteger)buttonIndex
{
    if ([self.otherDelegate respondsToSelector:@selector(alertView:willDismissWithButtonIndex:)]) {
        [self.otherDelegate alertView:alertView willDismissWithButtonIndex:buttonIndex];
    }
}

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    if ([self.otherDelegate respondsToSelector:@selector(alertView:didDismissWithButtonIndex:)]) {
        [self.otherDelegate alertView:alertView didDismissWithButtonIndex:buttonIndex];
    }
}

// Called after edits in any of the default fields added by the style
- (BOOL)alertViewShouldEnableFirstOtherButton:(UIAlertView *)alertView
{
    if ([self.otherDelegate respondsToSelector:@selector(alertViewShouldEnableFirstOtherButton:)]) {
        return [self.otherDelegate alertViewShouldEnableFirstOtherButton:alertView];
    }
    return YES;
}

@end
