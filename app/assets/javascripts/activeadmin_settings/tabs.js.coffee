# Tabs

$ ->
  load_group = (panel) ->
    panel_el = $(panel)
    container = panel_el.find('.settings-group-lazy[data-src]').first()
    return unless container.length
    return if container.data('loading') || container.data('loaded')

    container.data('loading', true)
    $.get(container.data('src'))
      .done (html) ->
        container.replaceWith(html)
        container.data('loaded', true)
      .fail ->
        container.html('<em>Unable to load settings.</em>')
      .always ->
        container.data('loading', false)

  tabs = $('#settings_tabs')
  tabs.easytabs
    animate:true
    animationSpeed:0
    tabActiveClass:"selected"

  tabs.bind 'easytabs:after', (e, tab, panel) ->
    load_group(panel)
