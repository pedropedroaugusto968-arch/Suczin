#import <UIKit/UIKit.h>

@interface SpaceXitMenu : UIView
@property (nonatomic, strong) UIView *panel;
@end

@implementation SpaceXitMenu
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.panel = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 350, 250)];
        self.panel.center = self.center;
        self.panel.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.95];
        self.panel.layer.cornerRadius = 12;
        self.panel.layer.borderColor = [UIColor cyanColor].CGColor;
        self.panel.layer.borderWidth = 1.5;
        [self addSubview:self.panel];

        UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake(0, 10, 350, 30)];
        title.text = @"SPACE XIT V4 - ANTI-CRASH";
        title.textColor = [UIColor cyanColor];
        title.textAlignment = NSTextAlignmentCenter;
        [self.panel addSubview:title];
        
        UILabel *info = [[UILabel alloc] initWithFrame:CGRectMake(10, 80, 330, 100)];
        info.text = @"STATUS: 1.123.1 OK\nLOGIN SAFE: ATIVO\n\nUSE 3 DEDOS PARA ABRIR";
        info.textColor = [UIColor whiteColor];
        info.numberOfLines = 4;
        info.textAlignment = NSTextAlignmentCenter;
        [self.panel addSubview:info];
    }
    return self;
}
@end

static SpaceXitMenu *menu;

%ctor {
    // ANTI-CRASH: Espera 30 segundos para garantir que o login (FB/Google) terminou
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(30 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        dispatch_async(dispatch_get_main_queue(), ^{
            UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
            if (keyWindow) {
                menu = [[SpaceXitMenu alloc] initWithFrame:keyWindow.bounds];
                menu.hidden = YES;
                [keyWindow addSubview:menu];

                UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:menu action:@selector(setHidden:)];
                tap.numberOfTouchesRequired = 3;
                [keyWindow addGestureRecognizer:tap];
            }
        });
    });
}
