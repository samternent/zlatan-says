# React Globals
React         = require('react')
DOM           = require('tbg_react_dom')

# Helpers
Quotes        = require('../data/quotes.coffee');

# Mixins

# Components
SocialButton  = React.createFactory(require('./social_button.coffee'))

# Flux


# Component
#
# @mixin
#
# @author Sam
#
ZlatanSays =

  # --------------------------------------------
  # Defaults
  # --------------------------------------------

  displayName   : 'ZlatanSays'
  propTypes     : {
                  }
  mixins        : []


  # --------------------------------------------
  # Getters & Checkers - get/has/can/is
  # --------------------------------------------

  getInitialState: ->
    quote       : 0

  getDefaultProps: ->


  getQuote: ->
    rand = Math.floor(Math.random() * Quotes.length)
    if @state and rand == @state.quote
      @getQuote()
    else
      @setState quote: rand


  # --------------------------------------------
  # Lifecycle Methods
  # --------------------------------------------

  componentWillMount: ->          # add event listeners (Flux Store, WebSocket, document)@
  componentWillReceiveProps: ->   # change state based on props change
  componentDidMount: ->           # data request (XHR)
    @getQuote()

  componentWillUnmount: ->        # remove event listeners


  # --------------------------------------------
  # Event handlers
  # --------------------------------------------

  _handleClick: (e) ->
    @getQuote()



  # --------------------------------------------
  # Render methods
  # --------------------------------------------

  render: ->
    DOM.div({
        className: 'zlatan-says'
        },
      DOM.div({ className: 'question' }, Quotes[ @state.quote ].question )

      DOM.h1({ onClick: @_handleClick }, 'zlatan says' )
      DOM.div({ className: 'quote' }, Quotes[ @state.quote ].quote )
      SocialButton({ buttonType: 'facebook', buttonText: 'Share', title: Quotes[ @state.quote ].quote, link: 'sa' })
      SocialButton({ buttonType: 'twitter', buttonText: 'Tweet', title: Quotes[ @state.quote ].quote, link: 'sa' })
    )


module.exports = React.createClass(ZlatanSays)
