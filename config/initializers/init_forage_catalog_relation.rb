# 设置抓取的产品分类和本网站产品分类的关系
# 展览展示
# 亲子活动
# 培训讲座
# 体育赛事
# 文艺演出
# 公益电影
# 其他
if Forage::CatalogRelation.table_exists?
  catalog_hash = {
    # 公共的
    "演唱会": "文艺演出",
    "话剧歌剧": "文艺演出",
    "音乐会": "文艺演出",
    "舞蹈芭蕾": "文艺演出",
    "儿童亲子": "亲子活动",
    "体育赛事": "体育赛事",
    "戏曲综艺": "文艺演出",
    # 大麦网
    "度假休闲": "其他",
    "体育比赛": "体育赛事",
    "曲艺杂坛": "文艺演出",
    # 票牛网
    "休闲展览": "展览展示",
    # 永乐票务
    "休闲娱乐": "其他",
    "话剧舞台剧": "文艺演出"
  }

  if Settings.project.wgtong?
    catalog_hash.each_pair do |k, v|
      catalog_relation = Forage::CatalogRelation.find_or_initialize_by(name: k.to_s)
      catalogs = ProductCatalog.where(name: v.to_s)
      catalog_relation.update_attributes(catalog: catalogs.first) unless catalogs.blank?
    end
  end
end
