###前言，还记得上个版本的高仿京东吗？经过这次的修改和维护已经版本更新，本人花了一段的时间进行整理和完善，本篇的文章也加了很多的介绍，更能帮到很多人以及充实自己，这里稍微多说一下，内容比较多，我们不着急，首页我们看看项目结构和目录

![Snip20160704_1.png](http://upload-images.jianshu.io/upload_images/1754828-76e80e2b2045387b.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

- 这是整个项目的结构

![Snip20160704_2.png](http://upload-images.jianshu.io/upload_images/1754828-e68ab040de3cd2bc.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
- 所有的东西本人也划分好了，文件夹也包装好了
- 好了，我开始讲了内容了

*在启动类里面我们看看引导页吧，这个引导页并不是本人做的，而是从cocoaChina找的，特效比较好，十分美观，代码我看着都想吐*

![1.gif](http://upload-images.jianshu.io/upload_images/1754828-de097efb3ef0c864.gif?imageMogr2/auto-orient/strip)

- 这个就是引导页的效果，比普通的引导页好多了，动画设计非常生动

```
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    //判断是不是第一次启动应用
    if(![[NSUserDefaults standardUserDefaults] boolForKey:@"firstLaunch"])
    {
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"firstLaunch"];
        NSLog(@"第一次启动");
        //如果是第一次启动的话进入用户引导页面
        
        /**
            这个引导页不是本人写的，觉得普通引导页没有看头，自己去论坛找了一个比较牛X的引导页
            有兴趣的同学可以去看看代码，我是没有认真去看，数学没有过关，这个引导页难度比较高
         **/
        
        GuideViewController *userGuideViewController = [[GuideViewController alloc] init];
        
        self.window.rootViewController = userGuideViewController;
        
        [userGuideViewController release];
    }else{
        NSLog(@"不是第一次启动");
        self.window.rootViewController = [[JDTabBarController alloc] init];
        //这里最好释放一下内存
        [JDTabBarController release];
        
    }
    
    self.window.backgroundColor=[UIColor whiteColor];
    
    [self.window makeKeyAndVisible];
  
    return YES;
}
```

- 这个是启动页的内容介绍，在沙盒中进行判断

- 看看引导页吧，引导页比较复杂，本人都没有弄懂，难度有点高
- 引导页

```
#pragma mark --- UIImageView显示gif动画
- (void)tomAnimationWithName:(NSString *)name count:(NSInteger)count
{
    // 如果正在动画，直接退出
    if ([imgView isAnimating]) return;
    // 动画图片的数组
    NSMutableArray *arrayM = [NSMutableArray array];
    // 添加动画播放的图片
    for (int i = 0; i < count; i++) {
        // 图像名称
        NSString *imageName = [NSString stringWithFormat:@"%@%d.png", name, i+1];
        // ContentsOfFile需要全路径
        NSString *path = [[NSBundle mainBundle] pathForResource:imageName ofType:nil];
        UIImage *image = [UIImage imageWithContentsOfFile:path];
        [arrayM addObject:image];
    }
    // 设置动画数组
    imgView.animationImages = arrayM;
    // 重复1次
    imgView.animationRepeatCount = 0;
    // 动画时长
    imgView.animationDuration = imgView.animationImages.count * 0.05;
    // 开始动画
    [imgView startAnimating];
}

#pragma mark --- 旋转动画
- (void)rotate360DegreeWithImageView:(UIImageView *)imageView
{
    CABasicAnimation *animation = [ CABasicAnimation
                                   animationWithKeyPath: @"transform" ];
    animation.fromValue = [NSValue valueWithCATransform3D:CATransform3DIdentity];
    //围绕Z轴旋转，垂直与屏幕
    animation.toValue = [ NSValue valueWithCATransform3D:
                         CATransform3DMakeRotation(M_PI, 0.0, 0.0, 1.0) ];
    animation.duration = 5;
    //旋转效果累计，先转180度，接着再旋转180度，从而实现360旋转
    animation.cumulative = YES;
    animation.repeatCount = MAXFLOAT;
    //在图片边缘添加一个像素的透明区域，去图片锯齿
    CGRect imageRrect = CGRectMake(0, 0,imageView.frame.size.width, imageView.frame.size.height);
    UIGraphicsBeginImageContext(imageRrect.size);
    [imageView.image drawInRect:CGRectMake(1,1,imageView.frame.size.width-2,imageView.frame.size.height-2)];
    imageView.image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    [imageView.layer addAnimation:animation forKey:nil];
}
```
- 这个三个方法，里面的东西特多，也不太好讲，这里过吧，我也讲不来

```
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor colorWithWhite:0.152 alpha:1.000];
    
    [self setupScrollView];
    
    [self setupPageControl];
    
    [self createUI];
}
```

####——————————引导页就这样介绍吧———————————
-  还有四大控件的`首页` `分类` `购物车` `我`
我这里重点介绍
# 首页

![首页.gif](http://upload-images.jianshu.io/upload_images/1754828-51de40e7d877bf0f.gif?imageMogr2/auto-orient/strip)

- 首页中的导航栏的编写

```
- (void)setupNavigationItem {

    //设置导航栏的颜色
    [self.navigationController.navigationBar setBarTintColor:[UIColor colorWithRed:27/255.0 green:74/255.0 blue:70/255.0 alpha:1.000]];
    
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem BarButtonItemWithImageName:@"ico_camera_7" highImageName:nil title:@"扫一扫" target:self action:@selector(camera)];
    
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem BarButtonItemWithImageName:@"HomePage_Message" highImageName:nil title:@"消息中心" target:self action:@selector(message)];
    
    //将搜索条放在一个UIView上
    SearchBarView *searchView = [[SearchBarView alloc]initWithFrame:CGRectMake(0, 7, self.view.frame.size.width-120, 30)];
    searchView.delegate=self;
    
    
    self.navigationItem.titleView = searchView;
    
}
```
- 如图介绍

![Snip20160704_6.png](http://upload-images.jianshu.io/upload_images/1754828-68fb410698412e88.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

####首页中的cell

```
/// cell类介绍
@property (nonatomic, strong) NSString *className;

/// 标题 - 如“我的订单”，对不同种cell进行不同设置时，通过 其对应的 cellConfig.title 进行判断
@property (nonatomic, strong) NSString *title;

/// 显示数据模型的方法
@property (nonatomic, assign) SEL showInfoMethod;

/// cell高度
@property (nonatomic, assign) CGFloat heightOfCell;

/// 预留属性detail
@property (nonatomic, strong) NSString *detail;

/// 预留属性remark
@property (nonatomic, strong) NSString *remark;
```

`.m文件实现的方法`

```
/// 根据cellConfig生成cell，重用ID为cell类名
- (UITableViewCell *)cellOfCellConfigWithTableView:(UITableView *)tableView
                                         dataModel:(id)dataModel
{
    Class cellClass = NSClassFromString(self.className);
    
    
    // 重用cell
    NSString *cellID = self.className;
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[cellClass alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellID];
    }
    
    // 设置cell
    if (self.showInfoMethod && [cell respondsToSelector:self.showInfoMethod]) {
        [cell performSelector:self.showInfoMethod withObject:dataModel];
    }
    
    return cell;
}
```
`homeViewController`
```

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    JHCellConfig *cellConfig = self.dataArray[indexPath.section][indexPath.row];
    
    return cellConfig.heightOfCell;
}
```
- 这里说明一下，内容看起来比较简单，但是实际写的话有难度的，不懂得话可以百度，思路就是这样，自己可以动手研究一下，说了很多不动手也是白扯

# 分类页面
- 先来一张动态效果图片

![](http://upload-images.jianshu.io/upload_images/1754828-9422552415c919bd.gif?imageMogr2/auto-orient/strip)

- 这个页面数据都是死的用加载plist的方法

```
- (void)viewDidLoad {
    [super viewDidLoad];
    
    //设置导航栏
    [self setupNavigationItem];
    
    //初始化数据
    [self initData];
    
    //初始化分类菜单
    [self initCategoryMenu];
    
}
```

- 在 `initData`加载一些数据

`initData`的方法实现就是

```
- (void)initData{
    
    _list=[NSMutableArray arrayWithCapacity:0];
    
    NSString *path=[[NSBundle mainBundle] pathForResource:@"Category" ofType:@"plist"];
    NSArray *array=[NSArray arrayWithContentsOfFile:path];
    /**
     *  构建需要数据 2层或者3层数据 (ps 2层也当作3层来处理)
     */
    
    for (int i=0; i<[array count]; i++) {
        
        CategoryMeunModel * meun=[[CategoryMeunModel alloc] init];
        meun.menuName=[array objectAtIndex:i][@"menuName"];
        meun.nextArray=[array objectAtIndex:i][@"topMenu"];
        NSMutableArray * sub=[NSMutableArray arrayWithCapacity:0];
        
        for ( int j=0; j <[meun.nextArray count]; j++) {
            
            CategoryMeunModel * meun1=[[CategoryMeunModel alloc] init];
            meun1.menuName=[meun.nextArray objectAtIndex:j][@"topName"];
            meun1.nextArray=[meun.nextArray objectAtIndex:j][@"typeMenu"];
            
            
            
            NSMutableArray *zList=[NSMutableArray arrayWithCapacity:0];
            for ( int k=0; k <[meun1.nextArray count]; k++) {
                CategoryMeunModel * meun2=[[CategoryMeunModel alloc] init];
                meun2.menuName=[meun1.nextArray objectAtIndex:k][@"typeName"];
                meun2.urlName=[meun1.nextArray objectAtIndex:k][@"typeImg"];
                [zList addObject:meun2];
            }
            
            
            meun1.nextArray=zList;
            [sub addObject:meun1];
        }
        
        
        meun.nextArray=sub;
        [_list addObject:meun];
    }
}

```
- 这些数据都在model里面

```

#pragma mark - 属性

@property(assign,nonatomic) int Id;//菜单ID
@property(copy,nonatomic) NSString * menuName;//菜单名
@property(copy,nonatomic) NSString * urlName;//菜单图片名


/**
 *  下一级菜单
 */
@property(strong,nonatomic) NSArray * nextArray;

/**
 *  菜单层数
 */
@property(assign,nonatomic) NSInteger meunNumber;

@property(assign,nonatomic) float offsetScorller;

#pragma mark - 方法
#pragma mark 根据字典初始化对象
-(CategoryMeunModel *)initWithDictionary:(NSDictionary *)dic;

#pragma mark 初始化对象（静态方法）
+(CategoryMeunModel *)statusWithDictionary:(NSDictionary *)dic;
```

- 在点击分类中的某个跳转到商品信息里面
`CommodityTableViewController`这个类里面是UITableViewController的实现方法，同样都是加载plist文件

```
#pragma mark 加载数据
-(void)initData{
    
    NSString *path=[[NSBundle mainBundle] pathForResource:@"Commodity" ofType:@"plist"];
    NSArray *array=[NSArray arrayWithContentsOfFile:path];
    _commodity=[[NSMutableArray alloc]init];
    [array enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        [_commodity addObject:[CommodityModel commodityWithDictionary:obj]];
    }];
}
```
- 再此点击cell的任何一行来到商品详情页面
- 或者活商品类，我这样讲可能有点乱，看动态效果图

![页面跳转.gif](http://upload-images.jianshu.io/upload_images/1754828-5841194f164e2acf.gif?imageMogr2/auto-orient/strip)

- 这个页面连续跳转两次页面，连续都是加载两次plist文件

- `CommodityTableViewCell`都是加载cell

![Snip20160704_7.png](http://upload-images.jianshu.io/upload_images/1754828-8594b8ec198c99c5.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

```
#pragma mark返回每行的单元格
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *cellIdentifier=@"Cell";
    CommodityTableViewCell * cell=[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if(cell==nil){
        cell=[[NSBundle mainBundle] loadNibNamed:@"CommodityTableViewCell" owner:self options:nil][0];
    }
    
    CommodityModel *commodity =_commodity[indexPath.row];
    
    cell.commodityImg.image=[UIImage imageNamed:commodity.commodityImageUrl];
    cell.commodityName.text=commodity.commodityName;
    cell.commodityPrice.text=[NSString stringWithFormat:@"￥%@",commodity.commodityPrice];
    cell.commodityZX.image=[UIImage imageNamed:commodity.commodityZX];
    cell.commodityPraise.text=commodity.praise;
    
    return cell;
}
```
####———————外加筛选知识和商品详情————————

`在点击分类中有一个筛选和商品详情的页面`

分别是  `RightMenuTableViewController`和   `DetailsViewController`

- 这两个页面特意放在后续内容加上介绍，分类前面开头说一些页面的跳转方式，这里加行的内容

- 点击筛选的页面还是用UITableView的方法加载

```
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellIdentifier];
    }
    
    if (indexPath.section==0) {
        if (indexPath.row==0) {
            cell.detailTextLabel.textColor=JDColor(240, 97, 98);
            cell.textLabel.text = @"配送至";
            cell.detailTextLabel.text=@"广东深圳市南山区";
            cell.accessoryView=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"my_list_arrow"]];
        }
    } else if(indexPath.section==1){
        NSArray *titles = @[@"京东配送", @"仅看有货", @"货到付款"];
        cell.textLabel.text = titles[indexPath.row];
        if (indexPath.row==0) {
            self.autoPeiSongSwitch.frame = CGRectMake(self.tableView.frame.size.width - (self.autoPeiSongSwitch.frame.size.width + 10), (cell.contentView.frame.size.height - self.autoPeiSongSwitch.frame.size.height) / 2, self.autoPeiSongSwitch.frame.size.width, self.autoPeiSongSwitch.frame.size.height);
            [cell.contentView addSubview:self.autoPeiSongSwitch];
        }else if(indexPath.row==1){
            self.autoYouHuoSwitch.frame = CGRectMake(self.tableView.frame.size.width - (_autoYouHuoSwitch.frame.size.width + 10), (cell.contentView.frame.size.height - _autoYouHuoSwitch.frame.size.height) / 2, _autoYouHuoSwitch.frame.size.width, _autoYouHuoSwitch.frame.size.height);
            _autoYouHuoSwitch.on=YES;
            [cell.contentView addSubview:_autoYouHuoSwitch];
        }else if(indexPath.row==2){
            self.autoFukuanSwitch.frame = CGRectMake(self.tableView.frame.size.width - (_autoFukuanSwitch.frame.size.width + 10), (cell.contentView.frame.size.height - _autoFukuanSwitch.frame.size.height) / 2, _autoFukuanSwitch.frame.size.width, _autoFukuanSwitch.frame.size.height);
            [cell.contentView addSubview:_autoFukuanSwitch];
        }
        
        
        
    }else if (indexPath.section==2){
        NSArray *titles = @[@"品牌", @"价格", @"网络",@"系统",@"热点",@"屏幕尺寸",@"机身颜色",@"购买方式",@"大家说"];
        cell.textLabel.text = titles[indexPath.row];
        cell.detailTextLabel.text=@"全部";
        cell.accessoryView=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"my_list_arrow"]];
    }
    
    return cell;
}

```

- 就是这么简单

- 这里布局问题是一个难点，最好用宏的定义去定义宽度和高度，这样计算起来比较方便
- 还有一个就是比较复杂的商品详情，点击加入购物车和点击关注的我这里一起讲好了

#商品详情+购物车

- 商品详情的页面中有点像首页
- 其实数据都是死的，都是固定的UITableViewcell

![Snip20160704_12.png](http://upload-images.jianshu.io/upload_images/1754828-dd7f1e1cd0c43f9b.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

![Snip20160704_13.png](http://upload-images.jianshu.io/upload_images/1754828-015948ff2ae91446.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

![Snip20160704_11.png](http://upload-images.jianshu.io/upload_images/1754828-6327a21eb2116572.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

![Snip20160704_10.png](http://upload-images.jianshu.io/upload_images/1754828-d05888375fce3080.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

- 这几张图片都是cell加载的

```
- (void)initView{
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    [self.view addSubview:self.tableView];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.tableHeaderView =[self addHeaderView];
    
    UIView * view =[[UIView alloc]initWithFrame:CGRectMake(0, self.view.height-60, self.view.width, 60)];
    view.backgroundColor=rgba(0, 0, 0, 0.8);
    [self.view addSubview:view];
    
    UIButton * addCart =[UIButton createButtonWithFrame:CGRectMake(view.size.width-160, 0, 160, view.size.height) Title:@"加入购物车" Target:self Selector:@selector(addCartClick)];
    [addCart.titleLabel setFont:[UIFont systemFontOfSize:20]];
    [addCart setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [addCart setBackgroundColor:JDColor(255, 100, 98)];
    [view addSubview:addCart];
    
    
    UIView * view1=[[UIView alloc]initWithFrame:CGRectMake(0, 0, view.size.width-addCart.size.width, view.size.height)];
    [view addSubview:view1];
    UIButton * focus =[UIButton createButtonWithImage:@"wareb_focus" Title:@"关注" Target:self Selector:@selector(addfollowClick)];
    [focus setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    focus.imageEdgeInsets = UIEdgeInsetsMake(0, 30, 20, 0);
    focus.titleEdgeInsets = UIEdgeInsetsMake(40,-35, 0, 0);
    [view1 addSubview:focus];
    
    UIButton * cart =[UIButton createButtonWithImage:@"btn_ware_buy_h" Title:@"购物车" Target:self Selector:@selector(cartClick)];
    [cart setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    cart.imageEdgeInsets = UIEdgeInsetsMake(0, 30, 20, 0);
    cart.titleEdgeInsets = UIEdgeInsetsMake(40,-35, 0, 0);
    [view1 addSubview:cart];
    [MasonyUtil equalSpacingView:@[focus,cart]
                       viewWidth:view1.size.width/2
                      viewHeight:view1.size.height
                  superViewWidth:view1.size.width];
}

```
- 页面下三个按钮都是自定义写的，分别创建三个UIView，在UIView加上UIbutton三个按钮，最好分别对着三个按钮和视图位置设定一下
- 至于弹出的都是第三方`MBProgressHUDDelegate`
- 还有一些数据都在在model里面

```
/**
 *   本类相当于将tableView中cell所需的基本信息存储下来，以便放到数组中管理
 *   改变不同类型cell的顺序、增删时，极为方便，只需改变VC中数据源数组即可，无需在多个tableView代理方法中逐个修改
 */
@interface CellConfig : NSObject

/// cell类名
@property (nonatomic, strong) NSString *className;

/// 标题 - 如“我的订单”，对不同种cell进行不同设置时，通过 其对应的 cellConfig.title 进行判断
@property (nonatomic, strong) NSString *title;

/// 显示数据模型的方法
@property (nonatomic, assign) SEL showInfoMethod;

/// cell高度
@property (nonatomic, assign) CGFloat heightOfCell;

/// 预留属性detail
@property (nonatomic, strong) NSString *detail;

/// 预留属性remark
@property (nonatomic, strong) NSString *remark;
//
@property (nonatomic, assign) BOOL cellType;

/**
 * @brief 便利构造器
 *
 * @param className:类名
 * @param title:标题，可用做cell直观的区分
 * @param showInfoMethod:此类cell用来显示数据模型的方法， 如@selector(showInfo:)
 * @param heightOfCell:此类cell的高度
 *
 *
 */

+ (instancetype)cellConfigWithClassName:(NSString *)className
                                  title:(NSString *)title
                         showInfoMethod:(SEL)showInfoMethod
                           heightOfCell:(CGFloat)heightOfCell
                               cellType:(BOOL) cellType;

/// 根据cellConfig生成cell，重用ID为cell类名
- (UITableViewCell *)cellOfCellConfigWithTableView:(UITableView *)tableView
                                         dataModel:(id)dataModel
                             cellForRowAtIndexPath:(NSIndexPath *)indexPath;
```

```
@property (nonatomic,assign) long long Id;//商品id
@property (nonatomic, strong) NSString *detailsName;//商品名称
@property (nonatomic, strong) NSString *detailsActivity;//商品活动
@property (nonatomic, strong) NSString *detailsPrice;//商品价钱
@property (nonatomic, strong) NSString *detailsImgZX;//专项图片
@property (nonatomic, strong) NSString *detailsTxtZX;//专项文字
@property (nonatomic, strong) NSString *detailsSelect;//选择
@property (nonatomic, strong) NSString *detailsAddress;//地址
@property (nonatomic, strong) NSString *detailsPraise;//评价
@property (nonatomic, strong) NSString *detailsPerson;//人数

```

- 点击商品详情中的加入购物车，就会来到购物车的页面

![Snip20160704_14.png](http://upload-images.jianshu.io/upload_images/1754828-b7991f278fd5c563.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
- 这是购物车中的页面，还是一样用UITableViewcontroler的方法实现

- 这里的下拉刷新我就不多提了，李明杰老师亲自写的第三方框架

```
-(void)initView{
    
    _buttomView =[UIView new];
    _buttomView.backgroundColor=rgba(0, 0, 0, 0.8);
    [self.view addSubview:_buttomView];
    [_buttomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(self.view.frame.size.width, 44));
        make.bottom.mas_equalTo(self.view.mas_bottom);
    }];
    
    UIButton * selectedBtn=[[UIButton alloc]initWithFrame:CGRectMake(10, 0, 60, 44)];
    [selectedBtn setImage:[UIImage imageNamed:@"syncart_round_check2" ] forState:UIControlStateNormal];
    selectedBtn.titleLabel.font=[UIFont systemFontOfSize:14];
    [selectedBtn setTitle:@"全选" forState:UIControlStateNormal];
    [_buttomView addSubview:selectedBtn];
    
    price=[[UILabel alloc]initWithFrame:CGRectMake(70, 0, 150, 44)];
    price.textColor=[UIColor whiteColor];
    price.font=[UIFont systemFontOfSize:18];
    price.text=@"合计:￥4783.00";
    [_buttomView addSubview:price];
    UIButton * addCart =[UIButton createButtonWithFrame:CGRectMake(self.view.width-120, 0, 140, 44) Title:@"去结算" Target:self Selector:@selector(jieShuanClick)];
    [addCart.titleLabel setFont:[UIFont systemFontOfSize:20]];
    [addCart setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [addCart setBackgroundColor:JDColor(255, 100, 98)];
    [_buttomView addSubview:addCart];
}

```
- 这就代码就是用Masonrg的框架使用在ViewDidLoad中使用这个方法
```
 //初始化数据
    [self initData];
    self.tableView.tableFooterView=[self addFooterBar];
```

- 在购物车中点击结算来到结算页面

![Snip20160704_15.png](http://upload-images.jianshu.io/upload_images/1754828-aab3f21e9936f295.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

- 头部是自定义的

```
- (UIView*)addHeaderBar{
    
    UIView *headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.width, 115)];
    
    UIImageView * addressBg=[[UIImageView alloc]initWithFrame:CGRectMake(0, 15, headerView.size.width, headerView.size.height-15)];
    addressBg.image=[UIImage imageNamed:@"address_info_bg"];
    
    [headerView addSubview:addressBg];
    
    UIImageView * nameImg=[[UIImageView alloc]initWithFrame:CGRectMake(5, 20, 20, 20)];
    nameImg.contentMode =  UIViewContentModeCenter;
    nameImg.image=[UIImage imageNamed:@"address_name_icon"];
    
    [addressBg addSubview:nameImg];
    
    UILabel * name =[[UILabel alloc]initWithFrame:CGRectMake(30, 20, self.view.frame.size.width-100, 20)];
    name.text=@"醉看红尘这场梦";
    [addressBg addSubview:name];
    
    UIImageView * phoneImg=[[UIImageView alloc]initWithFrame:CGRectMake(150, 20, 20, 20)];
    phoneImg.contentMode =  UIViewContentModeCenter;
    phoneImg.image=[UIImage imageNamed:@"address_phone_icon"];
    [addressBg addSubview:phoneImg];
    
    UILabel * phone =[[UILabel alloc]initWithFrame:CGRectMake(175, 20, self.view.frame.size.width-100, 20)];
    phone.text=@"159****5336";
    [addressBg addSubview:phone];
    
    UILabel * address = [[UILabel alloc]initWithFrame:CGRectMake(10, 50, headerView.size.width-30, 40)];
    address.font=[UIFont systemFontOfSize:14];
    address.textColor=[UIColor darkGrayColor];
    address.numberOfLines =2;
    address.text=@"广东省 深圳市 南山区";
    [addressBg addSubview:address];
    
    UIImageView * moreImg =[[UIImageView alloc]initWithFrame:CGRectMake(headerView.size.width-30, 0, 30, headerView.size.height)];
    moreImg.contentMode =  UIViewContentModeCenter;
    moreImg.image=[UIImage imageNamed:@"address_more_icon"];
    [addressBg addSubview:moreImg];
    return headerView;
}

```

*这个并不是cell，而是自己自定义上去的HeadView视图*

- 重头部开始到后结尾才是cell

```
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier=@"Cell";
    UITableViewCell * cell=[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if(cell==nil){
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellIdentifier];
    }
    
    switch (indexPath.section) {
        case 0:
            if (indexPath.row==0) {
                cell.imageView.image = [[UIImage imageWithName:@"C_0"] scaleImageWithSize:CGSizeMake(60, 60)];
                UIView * view=[[UIView alloc]initWithFrame:CGRectMake(80, 0, 190, 80)];
                UILabel *name=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, view.size.width, view.size.height-20)];
                name.text= @"苹果（Apple）iPhone6 (A1586)16GB金色 移动联通电信4G手机";
                name.numberOfLines=2;
                name.textColor=JDColor(147, 147, 147);
                name.font=[UIFont systemFontOfSize:15];
                [view addSubview:name];
                UILabel *count=[[UILabel alloc]initWithFrame:CGRectMake(0, view.size.height-35, view.size.width, 20)];
                count.textColor=JDColor(79, 79, 79);
                count.text= [NSString stringWithFormat:@"x%i",_count];
                count.font=[UIFont systemFontOfSize:15];
                [view addSubview:count];
                [cell.contentView addSubview:view];
                cell.detailTextLabel.text=[NSString stringWithFormat:@"￥%.2f",_money];
                cell.detailTextLabel.textColor=JDColor(255, 100, 98);
                cell.detailTextLabel.font = [UIFont systemFontOfSize:15];
            }
            
            break;
        case 1:
            if (indexPath.row==0) {
                cell.textLabel.text=@"支付配送";
                UILabel *peixong=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, self.tableView.frame.size.width-30, 80)];
                peixong.font=[UIFont systemFontOfSize:15];
                peixong.text=@"在线支付\n京东快递\n2015-7-1(周三) 09:00-15:00";
                peixong.textAlignment = NSTextAlignmentRight;
                peixong.numberOfLines = 0;
                [cell.contentView addSubview:peixong];
            }else if (indexPath.row==1){
                cell.textLabel.text=@"发票信息";
                
                UILabel *xinxi=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, self.tableView.frame.size.width-30, 80)];
                xinxi.font=[UIFont systemFontOfSize:15];
                xinxi.text=@"纸质发票\n个人\n非图书商品-明细";
                xinxi.textAlignment = NSTextAlignmentRight;
                xinxi.numberOfLines = 0;
                [cell.contentView addSubview:xinxi];
            }
            cell.textLabel.textColor=JDColor(147, 147, 147);
            cell.textLabel.font = [UIFont systemFontOfSize:15];
            cell.detailTextLabel.textColor=JDColor(79, 79, 79);
            cell.detailTextLabel.font = [UIFont systemFontOfSize:15];
            break;
        case 2:
            if (indexPath.row==0) {
                cell.textLabel.text=@"京东卡/E卡";
                cell.detailTextLabel.text=@"未使用";
                UILabel * wukeyong=[[UILabel alloc]initWithFrame:CGRectMake(100, 15, 40, 20)];
                wukeyong.textAlignment = NSTextAlignmentCenter;
                wukeyong.backgroundColor=[UIColor redColor];
                wukeyong.font = [UIFont systemFontOfSize:11];
                wukeyong.textColor=[UIColor whiteColor];
                wukeyong.text=@"无可用";
                [cell.contentView addSubview:wukeyong];
            }else if (indexPath.row==1){
                cell.textLabel.text=@"京豆";
                //cell.detailTextLabel.text=@"可用400京豆，抵￥4.00";
                self.autoSwitch.frame = CGRectMake(self.tableView.frame.size.width - (_autoLoginSwitch.frame.size.width + 10), (cell.contentView.frame.size.height - _autoLoginSwitch.frame.size.height) / 2, _autoLoginSwitch.frame.size.width, _autoLoginSwitch.frame.size.height);
                [cell.contentView addSubview:_autoLoginSwitch];
                
                
                UILabel * jingdou=[[UILabel alloc]initWithFrame:CGRectMake(60, 15, 150, 20)];
                jingdou.font = [UIFont systemFontOfSize:12];
                jingdou.text=@"可用400京豆,抵￥4.00";
                [cell.contentView addSubview:jingdou];
            }
            cell.textLabel.textColor=JDColor(147, 147, 147);
            cell.textLabel.font = [UIFont systemFontOfSize:15];
            cell.detailTextLabel.textColor=JDColor(79, 79, 79);
            cell.detailTextLabel.font = [UIFont systemFontOfSize:15];
            break;
            
        default:
            break;
    }
    
    if (indexPath.section!=2 || indexPath.row!=1) {
        cell.accessoryView=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"address_more_icon"]];
    }
    
    return cell;
}

```
- 这些都是cell加载的写死的数据，反正看到的都是死数据
- 介绍这么多的东西，结尾介绍一下我的个人中心

##我的

![个人中心.gif](http://upload-images.jianshu.io/upload_images/1754828-39dba33f31dd26a1.gif?imageMogr2/auto-orient/strip)

- 页面中的东西蛮多的，这里慢慢介绍
- 个人中心页面是`HeadView+UITableView`
```
-(UIImageView*)addNoHeaderBar{
    UIImageView *header = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.view.width, 180)];
    header.userInteractionEnabled = YES;
    header.image = [UIImage imageNamed:@"my_unlogin_bg"];
    
    //未登录按钮光圈
    BTRippleButtton *unLoginBtnBg = [[BTRippleButtton alloc]
                                     initWithImage:[UIImage imageNamed:@"unlogin_head_n"]
                                     andFrame:CGRectMake(self.view.width/2-90/2, 20, 90, 90)
                                     onCompletion:^(BOOL success) {
                                         
                                         [self showLoginView];
                                         
                                     }];
    
    [unLoginBtnBg setRippeEffectEnabled:NO];
    [header addSubview:unLoginBtnBg];
    //头部卡片
    UIImageView *bgView = [UIImageView new];
    bgView.image=[UIImage imageNamed:@"head_extra_bg"];
    [header addSubview:bgView];
    
    [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(self.view.frame.size.width, 50));
        make.bottom.mas_equalTo(header.mas_bottom);
    }];
    UIButton *view1 = [UIButton new];
    view1.titleLabel.font =[UIFont boldSystemFontOfSize:14 ];
    [view1 setTitle:@"关注的商品" forState:UIControlStateNormal];
    [bgView addSubview:view1];
    
    UIButton *view2 = [UIButton new];
    view2.titleLabel.font =[UIFont boldSystemFontOfSize:14 ];
    [view2 setTitle:@"关注的店铺" forState:UIControlStateNormal];
    [bgView addSubview:view2];
    
    UIButton *view3 = [UIButton new];
    view3.titleLabel.font =[UIFont boldSystemFontOfSize:14 ];
    [view3 setTitle:@"浏览记录" forState:UIControlStateNormal];
    [bgView addSubview:view3];
    
    [MasonyUtil equalSpacingView:@[view1,view2,view3]
                       viewWidth:(self.view.frame.size.width/3)-1
                      viewHeight:50
                  superViewWidth:self.view.frame.size.width];
    
    return header;
}
```

```
#pragma mark返回每行的单元格
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier=@"UITableViewCellIdentifierKey";
    
    //首先根据标示去缓存池取
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    //如果缓存池没有取到则重新创建并放到缓存池中
    if(!cell){
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellIdentifier];
    }
    switch (indexPath.section) {
        case 0:
            cell.textLabel.text = @"我的订单";
            cell.imageView.image = [UIImage imageNamed:@"my_order_icon"];
            cell.detailTextLabel.text=@"查看全部订单";
            break;
        case 1:
            cell.textLabel.text = @"我的钱包";
            cell.imageView.image = [UIImage imageNamed:@"my_wallet_icon"];
            cell.detailTextLabel.text=@"小金库、白条等";
            break;
        case 2:
            cell.textLabel.text = @"我的服务";
            cell.imageView.image = [UIImage imageNamed:@"my_service_icon"];
            cell.detailTextLabel.text=@"预约、营业厅等";
            break;
        case 3:
            cell.textLabel.text = @"意见反馈";
            cell.imageView.image = [UIImage imageNamed:@"my_feedback_icon"];
            break;
        case 4:
            cell.textLabel.text = @"猜你喜欢";
            cell.imageView.image = [UIImage imageNamed:@"my_guess_icon"];
            break;
        default:
            break;
    }
    
    if(indexPath.section!=4){
        cell.accessoryView=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"my_list_arrow"]];
    }
    
    return cell;
}
```


![](http://upload-images.jianshu.io/upload_images/1754828-fd7a00ad8feb283c.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

- 这是新加的个人中心控制器的内容，本人多加了很多的东西，个人介绍和关于作者

## 登录
![登录.gif](http://upload-images.jianshu.io/upload_images/1754828-ab4e042d2a70f0c3.gif?imageMogr2/auto-orient/strip)
##结束语
- 这个项目整理之后内容比较多，我这里只能简单的介绍，也有很多的细节没有处理好，代码的话还在修改和更新中，也有其他人在模仿
- 代码的话过一段时间上传到GIthub中，公司很多要忙的事情，还有我准备下期的swift项目讲解和介绍
