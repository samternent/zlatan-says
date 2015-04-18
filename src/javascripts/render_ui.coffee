React = require('react')

Components = require('./components/manifest.coffee')


RenderUI = ->

  components = document.querySelectorAll('[data-component-ui]')

  [].forEach.call(components, (el) ->
    name = el.getAttribute('data-component-ui')
    data = el.getAttribute('data-component-data')

    component = React.createFactory(Components[name])
    jsonData = if data then JSON.parse(data) else null

    React.render(component(jsonData), el)
  )


module.exports = new RenderUI()
