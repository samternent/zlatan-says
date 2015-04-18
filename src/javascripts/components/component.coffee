# React Globals
React         = require('react')
DOM           = require('tbg_react_dom')

# Helpers

# Mixins

# Components

# Flux


# Component
#
# @mixin
#
# @author Sam
#
Component =

  # --------------------------------------------
  # Defaults
  # --------------------------------------------

  displayName   : 'Component'
  propTypes     : {
                    text  : React.PropTypes.string
                  }
  mixins        : []


  # --------------------------------------------
  # Getters & Checkers - get/has/can/is
  # --------------------------------------------

  getInitialState: ->
    null

  getDefaultProps: ->
    text        : ''



  # --------------------------------------------
  # Lifecycle Methods
  # --------------------------------------------

  componentWillMount: ->          # add event listeners (Flux Store, WebSocket, document)
  componentWillReceiveProps: ->   # change state based on props change
  componentDidMount: ->           # data request (XHR)
  componentWillUnmount: ->        # remove event listeners


  # --------------------------------------------
  # Event handlers
  # --------------------------------------------



  # --------------------------------------------
  # Render methods
  # --------------------------------------------

  render: ->
    DOM.div(null, @props.text)


module.exports = React.createClass(Component)
