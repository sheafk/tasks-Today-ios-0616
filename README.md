
# Tasks Today

Create a viewer for your tasks last year or this upcoming year.

  1. Check out the `.xcworkspace` file. Views are set up.
  2. Create a new class for the event detail view. Connect it up
  3. Now we need to write three methods to get calendar details from the phone. This is hard to do...in this repo [I've included the answer](http://ironboard-curriculum-content.s3.amazonaws.com/iOS/encrypted_calendar_access.txt) for the three methods declared in the `.h` file if you'd like to use them. Please please please feel free to use them. Its a lot of documentation reading and learning how to access the phone calendar through EventKit is not the point of this lab. **If you want a challenge, write those methods without my solution. Remember, you don't need to understand everything going on, just make it work**
  4. Before doing anything you need to call the `requestCalendarPermission` method.
  5. Each method returns events from the respective time period. They are an array of [EKEvent](https://developer.apple.com/library/ios/documentation/EventKit/Reference/EKEventClassRef/Reference/Reference.html) objects. Most importantly they have a `title` property that has the name of the event.
  6. When you click on the each button, do the appropriate thing by passing the correct array of events to the `destinationViewController`
  7. In the destination there is a `UITextView`. This is a standard `UIView` that is made to list lots of text. List the title of each event separated by a new line which is the `@"\n"`. so `@"hello\nJoe"` would print:

  ```
  hello
  Joe
  ```

  8. `UITextView`s have a `text` property just like `UILabel`s.

## Hints

  * To work with `EKEvent` objects, you need to import the EventKit Framework. Do this by typing `#import <EventKit/EventKit.h>`

## Extra Credit

  * Instead of Buttons, play with two `UIDatePicker` views and display any arbitrary start and end date events.
