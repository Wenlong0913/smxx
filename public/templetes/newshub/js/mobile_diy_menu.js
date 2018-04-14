$(document).ready(function(){
  // 设置默认值
  var catalog_name = [];
  if (localStorage.getItem("ProductCatalog") == null) {
    localStorage.setItem('ProductCatalog', JSON.stringify(catalog_name));
  };

  // 获取用户存储的分类，并判断当没有分类的情况显示所有分类
  var get_catalog_name = JSON.parse(localStorage.getItem("ProductCatalog"));
  if (get_catalog_name.length == 0) {
    var set_default_catalog = [];
    $('.delete-catalog').each(function (index) {
      set_default_catalog.push($('#catalog-' + index).data('catalog-name') + '|' + $('#catalog-' + index).data('catalog-id'));
    });
    $('.index-show-catalog').each(function (index) {
      var arr = set_default_catalog[index].split("|");
      add_show_info(arr[0],arr[1],index);
    });
  } else {
    $('.index-show-catalog').each(function (index) {
      if (get_catalog_name[index] != undefined) {
        var sec_arr = get_catalog_name[index].split("|")
        add_show_info(sec_arr[0],sec_arr[1],index);
      };
    });
  };

  function add_show_info(text,href,index) {
    $('#index-show-catalog-' + index).text(text);
    $('#index-show-catalog-' + index).attr("href","/frontend/product_catalogs/" + href);
  };

  $('.index-show-catalog a').each(function () {
    if ($(this)[0].href == String(window.location)) {
      $(this).addClass("active-catalog");
    };
  });

  // 用户在modal中选择活动分类，并存储到localStorage，然后加载到页面上
  $('.delete-catalog').each(function (index) {
    $('#catalog-' + index).click(function () {
      if ($(this).hasClass("isselected")) {
        $(this).addClass("unselected");
        $(this).removeClass("isselected");
      } else {
        $(this).addClass("isselected");
        $(this).removeClass("unselected");
      };
      var data_catalog_name = $(this).data('catalog-name');
      var data_catalog_id = $(this).data('catalog-id');
      var compare = $.inArray(data_catalog_name + '|' + data_catalog_id, catalog_name);
      if (compare >= 0 ) {
        catalog_name.splice($.inArray(data_catalog_name + '|' + data_catalog_id, catalog_name),1);
      } else {
        catalog_name.push(data_catalog_name + '|' + data_catalog_id);
      };
      localStorage.setItem('ProductCatalog', JSON.stringify(catalog_name));
    });
  });
});
