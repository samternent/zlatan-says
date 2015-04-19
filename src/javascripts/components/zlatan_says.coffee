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

    window.location.hash = rand

  getQueryString: (name) ->

  # --------------------------------------------
  # Lifecycle Methods
  # --------------------------------------------

  componentWillMount: ->          # add event listeners (Flux Store, WebSocket, document)@
    # I'm about to get the query string!
    if window.location.hash
      id = parseInt window.location.hash.substr(1);
      @setState quote: id if !isNaN(id)

  componentWillReceiveProps: ->   # change state based on props change
  componentDidMount: ->           # data request (XHR)
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

      DOM.h1({ className: 'title', onClick: @_handleClick }, 'zlatan says' )
      DOM.div({ className: 'quote' }, Quotes[ @state.quote ].quote )

      SocialButton({
        buttonType    : 'facebook'
        buttonText    : 'Share'
        title         : "#{Quotes[ @state.quote ].quote}"
        link          : 'https://zlatan-says.herokuapp.com/'
        caption       : "#{Quotes[ @state.quote ].question}"
        picture       : 'http://localhost:3000/img/zlatan'
        redirect_uri  : 'https://zlatan-says.herokuapp.com/'
      })

      SocialButton({
        buttonType    : 'twitter'
        buttonText    : 'Tweet'
        title         : Quotes[ @state.quote ].quote
        link          : 'https://zlatan-says.herokuapp.com/'
        hashtags      : 'ZlatanSays'
      })
    )


module.exports = React.createClass(ZlatanSays)
