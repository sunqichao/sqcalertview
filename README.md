/**
 *  写这个提示view的目的
 *  1.是为了方便回调，省去了设置delegate和复写delegate方法的时间，可直接再block回调中写点击按钮的处理逻辑代码
 *  2.是为了复合用户的操纵，对于大多数人来说  YES  在右边比较好点击，当然也有点击左边了，所以提供了两种方法
 */

@interface SQCAlertViewManager : NSObject

/**
 *  弹出框  YES在左边   NO在右边
 *
 *  @param title              提示标题
 *  @param message            提示的描述
 *  @param confirmButtonTitle 确定按钮
 *  @param confirmButtonBlock 确定后回调的block
 *  @param cancelButtonTitle  取消按钮
 *  @param cancelButtonBlock  取消后回调的block
 */
+ (void)showAlertViewWithLeftYESTitle_:(NSString*)title
                               message:(NSString*)message
                    confirmButtonTitle:(NSString *)confirmButtonTitle
                    confirmButtonBlock:(void (^)(void))confirmButtonBlock
                     cancelButtonTitle:(NSString *)cancelButtonTitle
                     cancelButtonBlock:(void (^)(void))cancelButtonBlock;


/**
 *  弹出框  YES在右边   NO在左边
 *
 *  @param title              提示标题
 *  @param message            提示的描述
 *  @param confirmButtonTitle 确定按钮
 *  @param confirmButtonBlock 确定后回调的block
 *  @param cancelButtonTitle  取消按钮
 *  @param cancelButtonBlock  取消后回调的block
 */
+ (void)showAlertViewWithRightYESTitle_:(NSString*)title
                               message:(NSString*)message
                    confirmButtonTitle:(NSString *)confirmButtonTitle
                    confirmButtonBlock:(void (^)(void))confirmButtonBlock
                     cancelButtonTitle:(NSString *)cancelButtonTitle
                     cancelButtonBlock:(void (^)(void))cancelButtonBlock;
@end
