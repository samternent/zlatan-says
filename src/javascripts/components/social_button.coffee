# React Globals
React         = require('react')
DOM           = require('tbg_react_dom')

# Helpers

# Mixins

# Components

# Flux


# Social Button
#
# @mixin
#
# @author Sam
#
SocialButton =

  # --------------------------------------------
  # Defaults
  # --------------------------------------------

  displayName   : 'SocialButton'
  propTypes     : {
                    buttonType  : React.PropTypes.string
                    buttonText  : React.PropTypes.string
                    title       : React.PropTypes.string
                    link        : React.PropTypes.string
                  }
  mixins        : []


  # --------------------------------------------
  # Getters & Checkers - get/has/can/is
  # --------------------------------------------

  getInitialState: ->
    null

  getDefaultProps: ->
    buttonType : ''
    buttonText : ''
    title      : ''
    link       : ''


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

  _handleClick: ->
    @[ "_handle_#{ @props.buttonType }" ]()

  _handle_facebook: ->
    url = []
    url.push "&link=#{encodeURIComponent(@props.link)}"                 if @props.link
    url.push "&name=#{@props.title}"                                    if @props.title
    url.push "&caption=#{@props.caption}"                               if @props.caption
    url.push "&picture=#{encodeURIComponent(@props.picture)}"           if @props.picture
    url.push "&redirect_uri=#{encodeURIComponent(@props.redirect_uri)}" if @props.redirect_uri
    url = url.join ''

    url = "https://www.facebook.com/dialog/feed?app_id=1465294663760971&display=popup#{url}"
    window.open url, "facebook", "menubar=1,resizable=1,width=650,height=350"

  _handle_twitter: ->
    url = "https://twitter.com/intent/tweet?text=#{encodeURIComponent(@props.title.substring(0,101))}...&url=#{@props.link}&hashtags=#{@props.hashtags}"
    window.open url, "twitter", "menubar=1,resizable=1,width=650,height=350"

  _handle_github:->
    window.location = @props.link

  # --------------------------------------------
  # Render methods
  # --------------------------------------------

  render: ->
    DOM.a({
      onClick       : @_handleClick
      className     : "#{ @props.buttonType } social-btn"
    },
      DOM.i({ className: "ion-social-#{ @props.buttonType }" })
      DOM.span(null, @props.buttonText ) if @props.buttonText
    )



module.exports = React.createClass(SocialButton)
