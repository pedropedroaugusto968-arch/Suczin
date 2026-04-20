#import <UIKit/UIKit.h>

@interface SXPanel : UIView
@property (nonatomic, strong) UISlider *fovSlider;
@end

@implementation SXPanel
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.9];
        self.layer.cornerRadius = 20;
        self.layer.borderColor = [UIColor cyanColor].CGColor;
        self.layer.borderWidth = 2;

        UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake(0, 10, frame.size.width, 30)];
        title.text = @"SPACE XIT V4";
        title.textColor = [UIColor cyanColor];
        title.textAlignment = NSTextAlignmentCenter;
        [self addSubview:title];

        // Botão Fechar
        UIButton *close = [UIButton buttonWithType:UIButtonTypeClose];
        close.frame = CGRectMake(frame.size.width - 40, 10, 30, 30);
        [close addTarget:self action:@selector(hide) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:close];

        // Opções Simples
        NSArray *items = @[@"AIMBOT AUTO", @"ESP LINE", @"BYPASS 1.123"];
        for(int i=0; i<items.count; i++) {
            UILabel *lab = [[UILabel alloc] initWithFrame:CGRectMake(20, 60+(i*40), 200, 30)];
            lab.text = items[i]; lab.textColor = [UIColor whiteColor];
            [self addSubview:lab];
            UISwitch *s = [[UISwitch alloc] initWithFrame:CGRectMake(frame.size.width-70, 60+(i*40), 0, 0)];
            [self addSubview:s];
        }
    }
    return self;
}
- (void)hide { self.hidden = YES; }
@end

static SXPanel *menu;

%ctor {
    [[NSNotificationCenter defaultCenter] addObserverForName:UIApplicationDidFinishLaunchingNotification object:nil queue:[NSOperationQueue mainQueue] usingBlock:^(NSNotification *n) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(10 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            UIWindow *win = [UIApplication sharedApplication].keyWindow;
            menu = [[SXPanel alloc] initWithFrame:CGRectMake(0,0,350,250)];
            menu.center = win.center;
            menu.hidden = YES;
            [win addSubview:menu];

            // GESTO: Segurar com 2 dedos por 2 segundos para abrir
            UILongPressGestureRecognizer *hold = [[UILongPressGestureRecognizer alloc] initWithTarget:menu action:@selector(setHidden:)];
            hold.numberOfTouchesRequired = 2;
            hold.minimumPressDuration = 2.0;
            [win addGestureRecognizer:hold];
        });
    }];
}

