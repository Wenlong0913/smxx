module ApplicationHelper

  # class="bg-blue"
  def rand_bg_color
    [ 'silver', 'silver-darker','silver-lighter',
      'black', 'black-darker', 'black-lighter',
      'grey', 'grey-darker', 'grey-lighter',
      'red', 'red-darker', 'red-lighter',
      'orange', 'orange-darker', 'orange-lighter',
      'green', 'green-darker', 'green-lighter',
      'yellow', 'yellow-darker', 'yellow-lighter',
      'blue', 'blue-darker', 'blue-lighter',
      'aqua', 'aqua-darker', 'aqua-lighter',
      'purple', 'purple-darker', 'purple-lighter',
    ].sample
  end
end
