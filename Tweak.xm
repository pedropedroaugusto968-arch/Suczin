#import <UIKit/UIKit.h>

// --- INTERFACE DO MENU PROFISSIONAL ---
@interface SpaceXitV4 : UIView
@property (nonatomic, strong) UIView *mainPanel;
@property (nonatomic, strong) UIView *contentArea;
@property (nonatomic, strong) UILabel *statusLabel;
@end

@implementation SpaceXitV4

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        // Configuração do Painel (Design FFH4X)
        self.mainPanel = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 380, 280)];
        self.mainPanel.center = self.center;
        self.mainPanel.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.95];
        self.mainPanel.layer.cornerRadius = 15;
        self.mainPanel.layer.borderWidth = 2;
        self.mainPanel.layer.borderColor = [UIColor cyanColor].CGColor;
        [self addSubview:self.mainPanel];

        // Título Principal
        UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake(0, 10, 380, 25)];
        title.text = @"SPACE XIT V4 - SUPREME";
        title.textColor = [UIColor cyanColor];
        title.textAlignment = NSTextAlignmentCenter;
        title.font = [UIFont boldSystemFontOfSize:16];
        [self.mainPanel addSubview:title];

        // Sistema de Abas (Navegação)
        NSArray *tabs = @[@"COMBATE", @"VISUAL", @"SISTEMA"];
        for (int i = 0; i < tabs.count; i++) {
            UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
            btn.frame = CGRectMake(10 + (i * 120), 45, 115, 35);
            [btn setTitle:tabs[i] forState:UIControlStateNormal];
            [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            btn.backgroundColor = [UIColor colorWithWhite:0.2 alpha:0.5];
            btn.layer.cornerRadius = 8;
            btn.tag = i;
            [btn addTarget:self action:@selector(tabSelected:) forControlEvents:UIControlEventTouchUpInside];
            [self.mainPanel addSubview:btn];
        }

        // Área de Conteúdo Dinâmico
        self.contentArea = [[UIView alloc] initWithFrame:CGRectMake(10, 90, 360, 180)];
        [self.mainPanel addSubview:self.contentArea];
        
        [self loadCombate]; // Inicia na aba de combate
    }
    return self;
}

- (void)tabSelected:(UIButton *)sender {
    // Limpa a área antes de trocar
    for (UIView *sub in self.contentArea.subviews) [sub removeFromSuperview];
    
    if (sender.tag == 0) [self loadCombate];
    else if (sender.tag == 1) [self loadVisual];
    else if (sender.tag == 2) [self loadSistema];
}

- (void)loadCombate {
    UILabel *l = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 200, 30)];
    l.text = @"AIMBOT AUTOMÁTICO"; l.textColor = [UIColor whiteColor];
    [self.contentArea addSubview:l];
    
    UISwitch *sw = [[UISwitch alloc] initWithFrame:CGRectMake(280, 5, 0, 0)];
    sw.onTintColor = [UIColor cyanColor];
    [self.contentArea addSubview:sw];
}

- (void)loadVisual {
    NSArray *esp = @[@"ESP LINHA", @"ESP BOX 3D", @"ESP DISTÂNCIA"];
    for (int i = 0; i < esp.count; i++) {
        UILabel *l = [[UILabel alloc] CGRectMake:10 y:10 + (i * 45) width:200 height:30];
        l.text = esp[i]; l.textColor = [UIColor whiteColor];
        [self.contentArea addSubview:l];
        
        UISwitch *sw = [[UISwitch alloc] initWithFrame:CGRectMake(280, 5 + (i * 45), 0, 0)];
        sw.onTintColor = [UIColor greenColor];
        [self.contentArea addSubview:sw];
    }
}

- (void)loadSistema {
    UITextView *info = [[UITextView alloc] initWithFrame:CGRectMake(0, 0, 360, 180)];
    info.text = @"SPACE XIT V4\n\nANTI-CRASH LOGIN: ATIVO\nBYPASS FB/GOOGLE: OK\nDEV: @eoo_gomes3\n\nCOMO USAR:\nToque com 3 dedos para fechar.";
    info.textColor = [UIColor cyanColor];
    info.backgroundColor = [UIColor clearColor];
    info.editable = NO;
    info.font = [UIFont systemFontOfSize:14];
    [self.contentArea addSubview:info];
}

@end

// Helper para facilitar criação de labels
@interface UILabel (Helper)
- (instancetype)CGRectMake:(CGFloat)x y:(CGFloat)y width:(CGFloat)w height:(CGFloat)h;
@end

static SpaceXitV4 *menuV4;

// --- CONSTRUTOR COM FOCO ANTI-CRASH ---
%ctor {
    // PROTEÇÃO CRÍTICA: Espera 35 segundos para o jogo processar o login (FB/Google/Convidado)
    // Se injetar no momento do clique, o iOS derruba o app por conflito de Thread
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(35 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        dispatch_async(dispatch_get_main_queue(), ^{
            UIWindow *window = [UIApplication sharedApplication].keyWindow;
            if (window) {
                menuV4 = [[SpaceXitV4 alloc] initWithFrame:window.bounds];
                menuV4.hidden = YES; // Começa escondido
                [window addSubview:menuV4];

                // Ativação por Gesto: 3 Dedos / 3 Toques
                UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:menuV4 action:@selector(setHidden:)];
                tap.numberOfTouchesRequired = 3;
                [window addGestureRecognizer:tap];
            }
        });
    });
}
