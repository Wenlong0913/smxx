$(document).ready ->
  pages = $('body.admin-produces.index')
  if pages.length > 0
    dataPath = null
    # modal 样式重置
    pages.find('.modal.create_task').on 'show.bs.modal', ->
      $(this).find('.continue .list-group a.list-group-item').removeClass('task-active')
        .find('i.fa').removeClass('fa-check-circle-o').addClass('fa-circle-o')
    # open modal
    pages.find("td a[data-target='.create_task']").on 'click', ->
      $(this).parents('tbody').find('a').removeClass('selected')
      $(this).addClass('selected')
      $('.modal.create_task .modal-body .well .h6 span').text($(this).data('code'))
      dataPath = $(this).data('path')
    # 选中数据
    pages.find('.modal.create_task .modal-body .continue a.list-group-item').on 'click', ->
      pages.find(".modal.create_task .continue .error-messages").text('')
      if $(this).hasClass('task-active')
        $(this).removeClass('task-active')
        $(this).find('i.fa').removeClass('fa-check-circle-o').addClass('fa-circle-o')
      else
        $(this).addClass('task-active')
        $(this).find('i.fa').removeClass('fa-circle-o').addClass('fa-check-circle-o')
    # task 数据提交/创建
    pages.find(".modal.create_task .modal-footer .btn-create-task").on 'click', ->
      taskTypeIds = []
      pages.find('.modal.create_task .modal-body .continue a.list-group-item').each ->
        if $(this).hasClass('task-active')
          taskTypeIds.push $(this).data('id')
      if taskTypeIds.length > 0
        $.ajax
          url: dataPath
          type: 'post'
          data:
            taskTypeIds: taskTypeIds
          error: (data)->
            pages.find(".modal.create_task .continue .error-messages").text(data.responseText)
          success: (data)->
            pages.find("tbody tr td a.selected").parents('tr').find('td a.hide').removeClass('hide')
            pages.find("tbody tr td a.selected").parents('td').replaceWith '
              <td>
                <div class="progress">
                  <div class="progress-bar" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100" style="width: 0%;">
                    0%
                  </div>
                </div>
              </td>
            '
            $('.modal.create_task').modal('hide')
      else
        pages.find(".modal.create_task .continue .error-messages").text('错误：至少选择一个任务！')
