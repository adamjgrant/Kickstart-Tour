# Kickstart-Tour
Tour guide creator for Kickstart

## Installation

Add submodule in lib/coffee/vendor

    $ cd lib/coffee/vendor
    $ git submodule add git@github.com:ajkochanowicz/Kickstart-Tour.git

You'll also need to add the Sass component. This is a separate component in 
the Kickstart Store.

## Usage

Create a new tour using `k$.Tour`

`k$.Tour` takes two parameters, a class name and the array of cards.

    myTour = new k$.Tour(
      "myTour",
      [
        content: "Here's how you can add comments"
        next: "Next"
      ,
        content: "Use this button to refresh the data."
        next: "Done"
      ]
    )

### Each card has several properties. Some are optional.

    content: "Click here to submit" # Required
    next: "Got it" # Optional
    top: "30px" # These four are optional and map directly to CSS
    bottom: null
    left: "20px"
    right: null

    parent: # Optional parent container for the tour card.
            # Remember to style this parent with position: relative
            # The passed in element should be a js DOM object.

### Playing

Start and Stop the tour with `.start()` and `.stop()`

    myTour.start()
    myTour.stop()

The tour automatically stops itself on the last step.

Advance the tour with `.next()`

    myTour.next()

### Styling

This component still relies on you to instantiate the Kickstart container
for the tourguide. The class was defined above, when you instantiated a new
`k$.Tour`

Also include the separate submodule for tour styling.

    .myTour {
      @include container;
      @include tour;
    }

