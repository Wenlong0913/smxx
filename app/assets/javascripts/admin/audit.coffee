$(document).ready ->
  $('input[name="daterange"]').daterangepicker(
    { 
      format: 'YYYY-MM-DD',
      locale: { 
        cancelLabel: '取消',
        applyLabel: '确认',
        fromLabel: '从',
        toLabel: '到',
        daysOfWeek: ['日', '一', '二', '三', '四', '五', '六'],
        monthNames: ['一月', '二月', '三月', '四月', '五月', '六月', '七月', '八月', '九月', '十月', '十一月', '十二月', ]
      },
    })