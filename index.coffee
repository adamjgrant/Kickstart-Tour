class k$.Tour
  constructor: (@className, @cards, @title) ->
    # Construct Tour HTML
    @cardDiv = document.createElement 'div'
    @cardDiv.classList.add @className

    @header = document.createElement 'header'
    @main = document.createElement 'main'
    @footer = document.createElement 'footer'

    @header.innerHTML = @title if @title

    @cardButton = document.createElement 'button'
    @cardDiv.appendChild el for el in [@header, @main, @footer]
    @footer.appendChild @cardButton

  start: ->
    _ = @
    # Add div
    document.body.appendChild @cardDiv

    # Restrict click on elements not part of the tour.

    # Start at a nonexistent point before 1 and advance
    # (To DRY up positioning code from next()
    @index = -1
    @next()

    # Add click handler to next button
    @cardButton.addEventListener 'click', ->
      _.next()

  stop: ->
    console.log 'stopping'
    # Restore click functionality in the app.

  next: ->
    # Advance to next card
    @index++
    if @index == @cards.length
      @stop()
      return

    card = @cards[@index]

    # Position element
    @cardDiv.style.top    = card.top or "25px"
    @cardDiv.style.bottom = card.bottom or "auto"
    @cardDiv.style.left   = card.left or "25px"
    @cardDiv.style.right  = card.right or "auto"

    # Clear out card and add new details.
    @main.innerHTML = card.content
    @cardButton.innerHTML = card.next

  back: ->
