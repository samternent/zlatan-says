# React Globals
React         = require('react/addons')
DOM           = require('tbg_react_dom')

# Helpers
Quotes        = require('../data/quotes.coffee');

# Mixins

# Components
ReactCSSTransitionGroup = React.createFactory(React.addons.CSSTransitionGroup);
SocialButton  = React.createFactory(require('./social_button.coffee'))

# Flux

React.initializeTouchEvents(true)

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
  seen          : []


  # --------------------------------------------
  # Getters & Checkers - get/has/can/is
  # --------------------------------------------

  getInitialState: ->
    quote       : 0

  getDefaultProps: ->


  getQuote: ->
    rand = Math.floor(Math.random() * Quotes.length)
    @seen = [] if @seen.length > Quotes.length-1
    return @getQuote() if @state and (rand == @state.quote or @seen.indexOf(rand) > -1)
    @seen.push(rand)

    @setState
        quote       : rand
        transition  : true
      , ->
        window.location.hash = rand

  getQueryString: (name) ->

  # --------------------------------------------
  # Lifecycle Methods
  # --------------------------------------------

  componentWillMount: ->          # add event listeners (Flux Store, WebSocket, document)@


  componentWillReceiveProps: ->   # change state based on props change
  componentDidMount: ->           # data request (XHR)
    if window.location.hash
      id = parseInt window.location.hash.substr(1);
      if !isNaN(id)
        @seen.push(id)
        @setState
          quote : id
    else
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
      # DOM.div({ className: 'question' }, Quotes[ @state.quote ].question )

      DOM.h1({ className: 'title', onTouchEnd: @_handleClick }, 'shit zlatan says' )
      DOM.div({ className: 'click', onTouchEnd: @_handleClick }, 'click for a quote' )
      DOM.div({
        className: 'quote'
        onClick: @_handleClick
        },
        DOM.div({ className: 'image' })

        ReactCSSTransitionGroup({
          transitionName: 'quote'
        },
          DOM.span({ key: "quote#{@state.quote}" }, Quotes[ @state.quote ].quote)
        )
      )

      SocialButton({
        buttonType    : 'facebook'
        buttonText    : 'Share'
        title         : "#{Quotes[ @state.quote ].quote}"
        link          : 'http://goo.gl/8b0WpB'
        caption       : "#{Quotes[ @state.quote ].question}"
        picture       : 'https://zlatan-says.herokuapp.com/img/zlatan_jpg.jpg'
        redirect_uri  : 'https://zlatan-says.herokuapp.com/'
      })

      SocialButton({
        buttonType    : 'twitter'
        buttonText    : 'Tweet'
        title         : Quotes[ @state.quote ].quote
        link          : 'http://goo.gl/8b0WpB'
        hashtags      : 'zlatansays'
      })

      SocialButton({
        buttonType: 'github'
        link: 'https://github.com/samternent/zlatan-says'
      })
    )


module.exports = React.createClass(ZlatanSays)
