class k$.Tour
  constructor: (@className, @cards, @title) ->
    # Construct Tour HTML
    @cardDiv = document.createElement 'div'
    @cardDiv.classList.add @className

    title = if @title then "<header class='tour-header'>#{@title}</header>" else ""

    content =
      """
      #{title}
      <main class="tour-main"></main>
      <footer class="tour-footer"><button></button></footer>
      """

    @cardDiv.innerHTML = content

  start: ->
    # Restrict click on elements not part of the tour.

    # Start at a nonexistent point before 1 and advance
    # (To DRY up positioning code from next()
    @index = -1
    @next()

  stop: ->
    # Restore click functionality in the app.
    # Remove tourcard
    @cardDiv.parentNode.removeChild @cardDiv

  next: ->
    _ = @ # Sensible "this"

    # Advance to next card
    @index++
    card = @cards[@index]

    # Stop if we're done
    if @index == @cards.length
      @stop()
      return

    # DOM positioning
    @_cardDiv = @cardDiv.cloneNode(true)
    @cardDiv.parentNode.removeChild @cardDiv if @cardDiv.parentNode
    @cardDiv = @_cardDiv
    parent = card.parent || document.body

    # Add div
    parent.appendChild @cardDiv

    # Define some DOM elements
    @button = @cardDiv.querySelector('.tour-footer button')

    # Position element
    @cardDiv.style.top    = card.top or "auto"
    @cardDiv.style.bottom = card.bottom or "auto"
    @cardDiv.style.left   = card.left or "auto"
    @cardDiv.style.right  = card.right or "auto"

    # Clear out card and add new details.
    @cardDiv.querySelector('.tour-main').innerHTML = card.content
    @button.innerHTML = card.next || "Next"

    # Add click handler to next button
    @button.addEventListener 'click', ->
      _.next()

