$(document).ready ->
  $new_form = $('form#new_product')
  $new_checkBox = $new_form.find('input#product_purchase_type_sign_up')
  $new_purchase_type = $new_form.find('.purchase_type')
  $new_signup_attributes = $new_form.find('.signup_attributes')
  new_signup_attributes_html = $new_signup_attributes.children().clone()
  $($new_signup_attributes).empty()
  $new_checkBox.on 'click', ->
    if $new_checkBox.prop('checked')
      $new_signup_attributes.append(new_signup_attributes_html)
    else
      $new_signup_attributes.empty()
  
  $form = $('form.edit_product')
  $checkBox = $form.find('input#product_purchase_type_sign_up')
  $purchase_type = $form.find('.purchase_type')
  $signup_attributes = $form.find('.signup_attributes')
  signup_attributes_html = $signup_attributes.children().clone()
  if !$checkBox.prop('checked')
    $($signup_attributes).empty()
  $checkBox.on 'click', ->
    if $checkBox.prop('checked')
      $signup_attributes.append(signup_attributes_html)
    else
      $signup_attributes.empty()
  