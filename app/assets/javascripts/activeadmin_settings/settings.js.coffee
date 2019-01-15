# Settings
$ ->
  show_update_btn = (el) ->
    $(el).closest('tr').find('.update_link').show()

  hide_update_btn = (el) ->
    $(el).closest('tr').find('.update_link').hide()

  $('#settings .form form input, textarea').change ->
    show_update_btn(this)

  $('#settings .form form input, textarea').keypress ->
    show_update_btn(this)

  $('#settings .form form').submit ->
    false

  show_saved_state = (el) ->
    saved_label = el.closest('tr').find('.saved-state')
    el.hide()
    saved_label.show()
    hide_label = (label, btn) -> label.fadeOut => btn.show()

    setTimeout ( ->
      hide_label(saved_label, el)
    ), 1000

  $('#settings .editor_link').click (e) ->
    e.preventDefault()
    $(this).hide()
    $(this).closest('tr').find('.editor_remove_link').show()
    instance = $(this).closest('tr').find('textarea').attr('id')
    CKEDITOR.replace instance

  $('#settings .update_link').click (e) ->
    e.preventDefault()
    btn = $(this)
    tr  = $(btn.attr("data-id"))

    if CKEDITOR?
      for instanceName of CKEDITOR.instances
        CKEDITOR.instances[instanceName].updateElement()

    form = tr.find(".form form")
    form.ajaxSubmit
      error: (res) =>
        alert(res.responseText)
      success: (value) =>
        if form.parent().hasClass("file")
          form.find()
          form.parent().html(value)
        if form.parent().hasClass("html")
          show_saved_state(btn)
        else
          show_saved_state(btn)

