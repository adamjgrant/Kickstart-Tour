# Kickstart-Tour
Tour guide creator for Kickstart

## Installation

Add submodule in lib/coffee/vendor

    $ cd lib/coffee/vendor
    $ git submodule add git@github.com:ajkochanowicz/Kickstart-Tour.git

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
    next: "Got it"
    previous: "Back"
    top: "30px" # These four map directly to CSS
    bottom: null
    left: "20px"
    right: null

### Playing

Start and Stop the tour with `.start()` and `.stop()`

    myTour.start()
    myTour.stop()

The tour automatically stops itself on the last step.

Advance the tour with `.next()` and `.previous()`

    myTour.next()
    myTour.previous()

### Styling

This component still relies on you to instantiate the Kickstart container
for the tourguide. The class was defined above, when you instantiated a new
`k$.Tour`

    .myTour {
      @include container;
    }

