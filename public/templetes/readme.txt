# 如何安装一个模板

*****************

##创建模板的步骤

###1.把要创建的模板下载下来

  Windows上用Webzip软件： 在Webzip中打开模板首页，选择菜单"Download"->"Save page +"->"All pages up to 2 links deep from this page(Stay within site)"

  Mac上用： httrack 下载网站整站

###初始化菜单
  在 db/seeds.rb 中添加

#################
编辑：index.html
   在index.html中添加拆分标记，如：
      # <!-- [[head start]] --> ... <!-- [[head end]] -->
      # <!-- [[foot start]] --> ... <!-- [[foot end]] -->
      # <!-- [[header start]] --> ... <!-- [[header end]] -->
      # <!-- [[footer start]] --> ... <!-- [[footer end]] -->
#################
运行：generate_templetes.rb -e theme
