#import <UIKit/UIKit.h>

@interface SXPanel : UIView
@end

@implementation SXPanel
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.9];
        self.layer.cornerRadius = 15;
        self.layer.borderColor = [UIColor cyanColor].CGColor;
        self.layer.borderWidth = 2;

        UILabel *t = [[UILabel alloc] initWithFrame:CGRectMake(0, 10, frame.size.width, 30)];
        t.text = @"SPACE XIT V4";
        t.textColor = [UIColor cyanColor];
        t.textAlignment = NSTextAlignmentCenter;
        [self addSubview:t];

        UIButton *btn = [UIButton buttonWithType:UIButtonTypeClose];
        btn.frame = CGRectMake(frame.size.width - 40, 10, 30, 30);
        [btn addTarget:self action:@selector(setHidden:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:btn];
        
        UILabel *info = [[UILabel alloc] initWithFrame:CGRectMake(0, 100, frame.size.width, 50)];
        info.text = @"SEGURE COM 2 DEDOS\nPARA ABRIR O MENU";
        info.textColor = [UIColor whiteColor];
        info.numberOfLines = 2;
        info.textAlignment = NSTextAlignmentCenter;
        [self addSubview:info];
    }
    return self;
}
@end

static SXPanel *menu;

%ctor {
    [[NSNotificationCenter defaultCenter] addObserverForName:UIApplicationDidFinishLaunchingNotification object:nil queue:[NSOperationQueue mainQueue] usingBlock:^(NSNotification *n) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(15 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            UIWindow *win = [UIApplication sharedApplication].keyWindow;
            menu = [[SXPanel alloc] initWithFrame:CGRectMake(0,0,300,200)];
            menu.center = win.center;
            menu.hidden = YES;
            [win addSubview:menu];

            UILongPressGestureRecognizer *hold = [[UILongPressGestureRecognizer alloc] initWithTarget:menu action:@selector(setHidden:)];
            hold.numberOfTouchesRequired = 2;
            hold.minimumPressDuration = 2.0;
            [win addGestureRecognizer:hold];
        });
    }];
}
