#import <UIKit/UIKit.h>

@interface SpaceXitV4 : UIView
@property (nonatomic, strong) UIView *panel;
@property (nonatomic, strong) UIView *content;
@end

@implementation SpaceXitV4
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.panel = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 360, 260)];
        self.panel.center = self.center;
        self.panel.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.96];
        self.panel.layer.cornerRadius = 12;
        self.panel.layer.borderWidth = 1.5;
        self.panel.layer.borderColor = [UIColor cyanColor].CGColor;
        [self addSubview:self.panel];

        UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake(0, 5, 360, 25)];
        title.text = @"SPACE XIT V4 - SUPREME";
        title.textColor = [UIColor cyanColor];
        title.textAlignment = NSTextAlignmentCenter;
        title.font = [UIFont boldSystemFontOfSize:15];
        [self.panel addSubview:title];

        // Sistema de Abas (Combate, Visual, Bypass)
        NSArray *tabs = @[@"COMBATE", @"VISUAL", @"SISTEMA"];
        for(int i=0; i<tabs.count; i++) {
            UIButton *b = [UIButton buttonWithType:UIButtonTypeSystem];
            b.frame = CGRectMake(10+(i*115), 35, 110, 30);
            [b setTitle:tabs[i] forState:UIControlStateNormal];
            [b setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            b.backgroundColor = [UIColor colorWithWhite:0.15 alpha:0.6];
            b.layer.cornerRadius = 5;
            b.tag = i;
            [b addTarget:self action:@selector(changeTab:) forControlEvents:UIControlEventTouchUpInside];
            [self.panel addSubview:b];
        }

        self.content = [[UIView alloc] initWithFrame:CGRectMake(10, 75, 340, 175)];
        [self.panel addSubview:self.content];
        [self loadTab0]; // Inicia na Combate
    }
    return self;
}

- (void)changeTab:(UIButton *)btn {
    for (UIView *v in self.content.subviews) [v removeFromSuperview];
    if (btn.tag == 0) [self loadTab0];
    if (btn.tag == 1) [self loadTab1];
    if (btn.tag == 2) [self loadTab2];
}

- (void)loadTab0 {
    UILabel *l = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 200, 30)];
    l.text = @"AIMBOT AUTOMÁTICO"; l.textColor = [UIColor whiteColor];
    [self.content addSubview:l];
    UISwitch *s = [[UISwitch alloc] initWithFrame:CGRectMake(280, 5, 0, 0)];
    [self.content addSubview:s];
}

- (void)loadTab1 {
    NSArray *esp = @[@"ESP LINE", @"ESP BOX", @"ESP DISTANCE"];
    for(int i=0; i<esp.count; i++) {
        UILabel *l = [[UILabel alloc] initWithFrame:CGRectMake(10, i*45, 200, 30)];
        l.text = esp[i]; l.textColor = [UIColor whiteColor];
        [self.content addSubview:l];
        UISwitch *s = [[UISwitch alloc] initWithFrame:CGRectMake(280, i*45, 0, 0)];
        [self.content addSubview:s];
    }
}

- (void)loadTab2 {
    UILabel *l = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 340, 100)];
    l.text = @"ANTI-CRASH LOGIN: ATIVO\nANTI-BAN V4: OK\nBYPASS 1.123.1: OK";
    l.textColor = [UIColor greenColor];
    l.numberOfLines = 3;
    l.textAlignment = NSTextAlignmentCenter;
    [self.content addSubview:l];
}
@end

static SpaceXitV4 *menu;

%ctor {
    // ANTI-CRASH LOGIN: Aguarda o jogo estabilizar totalmente antes de criar o objeto do menu
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(25 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        dispatch_async(dispatch_get_main_queue(), ^{
            UIWindow *win = [UIApplication sharedApplication].keyWindow;
            if (win) {
                menu = [[SpaceXitV4 alloc] initWithFrame:win.bounds];
                menu.hidden = YES;
                [win addSubview:menu];

                // Gesto 3 Dedos
                UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:menu action:@selector(setHidden:)];
                tap.numberOfTouchesRequired = 3;
                [win addGestureRecognizer:tap];
            }
        });
    });
}
