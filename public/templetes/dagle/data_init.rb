
Cms::Site.create!(
  :name    => dagle,
  :template         => 'dagle',
  :domain        => 'dagle',
  :description  => 'dagle',
  :is_published   => true,
)
Cms::Channel.create!(
  :site_id    => 1,
  :parent_id    => nil,
  :title        => '首页',
  :short_title  => 'index',
  :properties   => nil,
  :tmp_index    => 'temp_index.html.erb',
  :tmp_detail   => 'temp_detail.html.erb',
  :keywords     => 'nil',
  :description  => '这里是首页的栏目描述',
  :image_path   => 'nil'
  :content      => 'nil'
)
Cms::Channel.create!(
  :site_id    => 1,
  :parent_id    => nil,
  :title        => '新闻列表',
  :short_title  => 'news',
  :properties   => nil,
  :tmp_index    => 'temp_news_list.html.erb',
  :tmp_detail   => 'temp_detail.html.erb',
  :keywords     => 'nil',
  :description  => '这里是新闻的栏目描述',
  :image_path   => 'nil'
  :content      => 'nil'
)
Cms::Channel.create!(
  :site_id    => 4,
  :parent_id    => nil,
  :title        => '首页',
  :short_title  => 'index',
  :properties   => nil,
  :tmp_index    => 'temp_index.html.erb',
  :tmp_detail   => 'temp_detail.html.erb',
  :keywords     => 'nil',
  :description  => 'nil',
  :image_path   => 'nil'
  :content      => 'nil'
)
Cms::Channel.create!(
  :site_id    => 4,
  :parent_id    => nil,
  :title        => '桌面端',
  :short_title  => 'desk',
  :properties   => ,
  :tmp_index    => 'temp_index_desk.html.erb',
  :tmp_detail   => 'temp_detail.html.erb',
  :keywords     => '',
  :description  => '',
  :image_path   => ''
  :content      => ''
)
Cms::Channel.create!(
  :site_id    => 4,
  :parent_id    => nil,
  :title        => '手机端',
  :short_title  => 'mobile',
  :properties   => ,
  :tmp_index    => 'temp_index_mobile.html.erb',
  :tmp_detail   => 'temp_detail.html.erb',
  :keywords     => '',
  :description  => '',
  :image_path   => ''
  :content      => ''
)
Cms::Channel.create!(
  :site_id    => 4,
  :parent_id    => 4,
  :title        => '更新日志',
  :short_title  => 'log',
  :properties   => ,
  :tmp_index    => 'temp_log_list.html.erb',
  :tmp_detail   => 'temp_news_detail.html.erb',
  :keywords     => '更新日志',
  :description  => '',
  :image_path   => ''
  :content      => ''
)
Cms::Channel.create!(
  :site_id    => 4,
  :parent_id    => nil,
  :title        => '博客',
  :short_title  => 'blog',
  :properties   => ,
  :tmp_index    => 'temp_news_list.html.erb',
  :tmp_detail   => 'temp_news_detail.html.erb',
  :keywords     => '博客',
  :description  => '',
  :image_path   => ''
  :content      => ''
)
Cms::Channel.create!(
  :site_id    => 4,
  :parent_id    => nil,
  :title        => '技术支持',
  :short_title  => 'support',
  :properties   => ,
  :tmp_index    => 'temp_support_list.html.erb',
  :tmp_detail   => 'temp_news_detail.html.erb',
  :keywords     => '技术支持',
  :description  => '',
  :image_path   => ''
  :content      => ''
)
Cms::Channel.create!(
  :site_id    => 4,
  :parent_id    => 9,
  :title        => '常见问题',
  :short_title  => 'faq',
  :properties   => ,
  :tmp_index    => 'temp_faq.html.erb',
  :tmp_detail   => 'temp_news_detail.html.erb',
  :keywords     => '常见问题',
  :description  => '',
  :image_path   => ''
  :content      => ''
)
Cms::Page.create!(
  :channel_id   => 2,
  :title        => '这是新闻标题',
  :short_title  => 'zhe-shi-xin-wen-biao-ti',
  :keywords     => 'nil',
  :description  => '这里是页面的描述',
  :properties   => 'nil',
  :image_path   => 'nil',
  :content      => '<p>这是内容部分!</p><p>这是内容部分!</p><p>这是内容部分!</p><p>这是内容部分!</p><p>这是内容部分!</p>'
)
Cms::Page.create!(
  :channel_id   => 2,
  :title        => '这是新闻标题',
  :short_title  => 'zhe-shi-xin-wen-biao-ti-n',
  :keywords     => 'nil',
  :description  => '这里是页面的描述',
  :properties   => 'nil',
  :image_path   => 'nil',
  :content      => '<p>这是内容部分!</p><p>这是内容部分!</p><p>这是内容部分!</p><p>这是内容部分!</p><p>这是内容部分!</p>'
)
Cms::Page.create!(
  :channel_id   => 2,
  :title        => '这是新闻标题',
  :short_title  => 'zhe-shi-xin-wen-biao-ti-b',
  :keywords     => 'nil',
  :description  => '这里是页面的描述',
  :properties   => 'nil',
  :image_path   => 'nil',
  :content      => '<p>这是内容部分!</p><p>这是内容部分!</p><p>这是内容部分!</p><p>这是内容部分!</p><p>这是内容部分!</p>'
)
Cms::Page.create!(
  :channel_id   => 2,
  :title        => '这是新闻标题',
  :short_title  => 'zhe-shi-xin-wen-biao-ti-k',
  :keywords     => '',
  :description  => '这里是页面的描述',
  :properties   => 'nil',
  :image_path   => '',
  :content      => '<p>这是内容部分!</p>

<p>这是内容部分!</p>

<p>这是内容部分!</p>

<p>这是内容部分!</p>

<p>这是内容部分!</p>
'
)
Cms::Page.create!(
  :channel_id   => 2,
  :title        => '这是新闻标题',
  :short_title  => 'zhe-shi-xin-wen-biao-ti-d',
  :keywords     => 'nil',
  :description  => '这里是页面的描述',
  :properties   => 'nil',
  :image_path   => 'nil',
  :content      => '<p>这是内容部分!</p><p>这是内容部分!</p><p>这是内容部分!</p><p>这是内容部分!</p><p>这是内容部分!</p>'
)
Cms::Page.create!(
  :channel_id   => 8,
  :title        => 'SaaS安全吗？',
  :short_title  => 'saas-an-quan-ma',
  :keywords     => '',
  :description  => '',
  :properties   => 'nil',
  :image_path   => '',
  :content      => '<p>文：明道创始人任向晖</p>

<p>&nbsp;</p>

<p>三年前，当明道刚刚开始公测时，我马不停蹄地拜访客户。当然，很快就纠结到了&ldquo;SaaS软件的安全性&rdquo;问题上。一位客户在演示完送别我们的时候，说了一句话，至今萦绕在我耳边。</p>

<p>他说：&ldquo;<i>SaaS其实无所谓，你们要是Google，我肯定就用了</i>&rdquo;。</p>

<p>哦，原来的问题的关键并非SaaS，而是&ldquo;信任&rdquo;。从此，心中淡泊很多，因为信任问题的解决可能很漫长，但也是最简单直接。一年后，我们彻底关闭了私有部署模式，专注在SaaS模式上。从最开始到现在，三年过去了，我们没有丢失过任何用户数据，没有发生任何客户数据泄漏事件，虽然建立高水准运营的内部过程无比艰难和繁复，但成果说明了一切。三年也许还不够，那就再来三年。我们相信连续的安全运营记录是建立信任最有力的砝码。</p>

<p>SaaS到底比私有部署的IT系统安全多少？这个问题的答案可以参考银行的失窃率和家庭的失窃率。但我不打算这么简单地回答这个问题。</p>

<p><b>有关数据丢失的风险</b></p>

<p>大部分企业都经历过本地文件服务器的阶段，在局域网内配置几台服务器，硬盘划分成几个区域，建立若干文件夹，分配给不同部门使用。我们常常看到&ldquo;市场部2012&rdquo;，&ldquo;客户合同&rdquo;，&ldquo;ABC项目文档&rdquo;这样的共享文件夹。要命的是大部分文件服务器其实都是PC，1TB的硬盘也就是几百块钱。这种常见企业数据存储配置下，数据灭失只是时间问题。只要是硬盘都会坏的，即使是价格昂贵的企业盘。</p>

<p>更常见的数据灭失原因还不是因为存储设备故障，而是人为的误操作。简单的文件夹授权非常容易导致错误的删除和覆盖。一旦发生误操作后，几乎只有专业的数据救援人员才有可能恢复。这时候，业务必定停摆。</p>

<p>有人说，加上备份不就得了？首先我几乎没有看到过有企业能够在这个架构下实现可靠的热备份（实时或接近实时的备份频率），大部分都依靠IT维护人员定期做简单的冷备份（就是非实时的备份）。无论哪种方式，都离不开可靠和可监控的流程。我们观察到的大部分数据灭失均是因为同步备份进程挂了很久，没有人知道。</p>

<p>好不容易建立了稳定的流程和监控后，谁都不愿意升级相应的软硬件平台，因为一旦升级，就得再来一遍，所以，难怪现在还有大量的企业在使用数据吞吐率极低的过时存储设备，这时候，如果硬盘还没有损坏，你光是继续烧香是没用的。</p>

<p>还有一种数据灭失的风险来自怀有恶意的离职员工（也许根源来自于管理）。经常有客户问到我们能否限制用户删除数据的行为，实际上对于明道来说，批量删除数据的入口几乎没有。而对于传统的私有部署IT系统，有权限的用户的确可以不费吹灰之力把硬盘删得一干二净，而且不留痕迹。</p>

<p>当然，每次我们都友善地提醒客户，你不能因为担心有这种情况发生，就限制所有用户的正常使用行为。信息之所以需要保存，就是为了被充分使用。</p>

<p>SaaS之所以能够100%抵御数据灭失，是因为它实在负担不起因此失败的结果。成千上万的企业数据集中使用同一套存储设施，就像银行保管了千万家庭的存款一样，你必须让它万无一失。所以，运营者会利用一切有用手段来保证和巩固数据存储安全。这当中，最重要和成本最高的无疑就是实时热备和利用它来实现的分布式计算。运营者付出一份成本让存储冗余（实践上是多重冗余），从而让数据和服务能够永不停歇。这个成本再高，也被众多的客户数量所摊薄，平均花费在一家企业用户上的冗余成本依然会非常低。这是简单的规模经济效益，也是SaaS模式能够战胜私有部署模式的核心优势之一。</p>

<p>&nbsp;</p>

<p><b>有关数据泄漏的风险</b></p>

<p>我们看到过太多私有部署系统的安全防范工作其实近似于裸奔。不要说专门的攻击防御了，就连基本的密码强度，系统补丁，安全证书等都没有完善。流传于互联网上的&ldquo;脱库&rdquo;事件大部分来源于那些陈旧和疏于维护的信息系统。而且越是在局域网或者私有云内的数据，在基本安全工作方面越是惨不忍睹，账号密码随意被猜到，通过攻击脆弱节点随意监听用户名密码数据等比比皆是。因为人们心理上都有一个趋向，认为放在自己的办公室里的数据都是安全的，但其实这是一个幻觉。</p>

<p>一个完善的防黑客攻击系统和冗余存储一样是需要大量投入的。一方面，依靠专职的运维团队以及围绕安全基线要求的作业流程，另一方面，需要部署专门的攻击防御策略，这些工作即便是作为SaaS专业厂商也未必都掌握了完全的技能，所以，产业链条内出现了安全加固服务、安全监控服务等更加垂直的厂商。</p>

<p>所有这些工作合力才能够保证达到一个基本的安全标准。要想获得持续的安全，还要依靠持久的投入。</p>

<p>数据泄漏的另一个方面就是内盗。考虑到企业数据泄漏90%来自于内部通道，我想单独来讲一下这个问题。</p>

<p>其实这个问题和SaaS并没有必然联系，任何IT系统，无论何种部署模式和安全标准，在同样的应用软件设计逻辑下，都有可能发生。近几年真正产生影响力的数据泄漏事件基本都是内部泄漏，斯诺登事件就是典型代表。</p>

<p>虽然SaaS软件并没有义务来抵消数据内盗的风险，但并不代表我们没有为此努力。</p>

<p>过去的思维往往集中在通过IT手段来试图杜绝数据内盗。这条路几乎是走不通的，因为只要防御多到一定程度，就一定会影响可用性，伤害正常用户的使用积极性。试想如果你需要下载一个文件，还需要等待上司审批，还会有多少人愿意主动索取文件呢？</p>

<p>实际上，数据内部泄漏是无法杜绝的，甚至有的时候，都无法在数据公开分享和泄漏之间找到明确的界限。</p>

<p>要减少数据泄漏的损害，唯一现实的两个途径是：</p>

<p>1）通过充分给予现有团队成员信息权利，稀释信息的拥有价值。也就是说，拥有某个信息的人多了，能够通过出售这个信息而牟利的空间就小了。在很低的回报下，员工泄漏数据而获利的行为成本就非常高。这最终在源头上减少了信息泄漏的动机。对于企业内部沟通中绝大多数内容应该用这个逆向思维来建立保护。</p>

<p>保持企业内部资源的共享和沟通的透明，能够非常直接地提高员工的满意度和对企业的认可度，愿意对自己认可的人犯罪的概率低于飞机失事。</p>
'
)
Cms::Page.create!(
  :channel_id   => 8,
  :title        => '案发违法',
  :short_title  => 'an-fa-wei-fa',
  :keywords     => '',
  :description  => '',
  :properties   => 'nil',
  :image_path   => '/ckeditor_assets/pictures/1/content_color.jpg',
  :content      => '<p><img alt="" src="/ckeditor_assets/pictures/1/content_color.jpg" style="width: 800px; height: 533px;" /></p>
'
)