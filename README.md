# Carouselish
Carousel prototype in Swift

Submitted by: Michelle Venetucci Harvey

Time spent: 12 hours spent in total

## User Stories

The following **required** and **optional** functionality is complete:
* [x] Static photo tiles on the initial screen
    * [x] Optional: Photo tiles move with scrolling
* [x] Sign In
    * [x] Tapping on email/password reveals the keyboard and shifts the scrollview and Sign In button up.
    * [x] Upon tapping the Sign In button.
       * [x] If the username or password fields are empty, user sees an error alert.
       * [x] If credentials are incorrect, user sees a loading indicator for 2 seconds followed by an error alert.
       * [x] If the credentials are correct, user sees a loading indicator for 2 seconds followed by a transition to the Sign In screens.
    * [x] Optional: When the keyboard is visible, if the user pulls down on the scrollview, it will dismiss the keyboard.
    * [x] Optional: On appear, scale the form up and fade it in.
* [x] Optional: Create a Dropbox
    * [x] Optional: Tapping in the form reveals the keyboard and shifts the scrollview and "Create a Dropbox" button up.
    * [x] Optional: Tapping the Agree to Terms checkbox selects the checkbox.
    * [x] Optional: Tapping on Terms shows a webview with the terms.
    * [x] Optional: User is taken to the tutorial screens upon tapping the "Create a Dropbox" button.
* [x] Tutorial Screens
    * [x] User can page between the screens
    * [x] Optional: User can page between the screens with updated dots
    * [x] Optional: Upon reaching the 4th page, hide the dots and show the "Take Carousel for a Spin" button.
* [x] Image Timeline
    * [x] Display a scrollable view of images.
    * [x] User can tap on the conversations button to see the conversations screen (push).
    * [x] User can tap on the profile image to see the settings view (modal from below).
* [x] Conversations
    * [x] User can dismiss the conversations screen
* [x] Settings
    * [x] User can dismiss the settings screen.
    * [x] User can log out
* [x] Optional: Learn more about Carousel
    * [x] Optional: Show the "Learn more about Carousel" button in the photo timeline.
    * [x] Optional: Tap the X to dismiss the banner
    * [x] Optional: Track the 3 events:
       * [x] View a photo full screen
       * [x] Swipe left and right on timeline
       * [x] Feed scroll view moves when timeline scroll is dragging
       * [x] Share a photo / copy link
    * [x] Optional: Upon completion of the events, mark them green.
    * [x] Optional: When all events are completed, dismiss the banner.


## Video Walkthrough 

Here's a walkthrough of the "Learn more about Carousel" optionals:

![Video Walkthrough](/Carouselish_walkthrough/Carousel_walkthrough_optional_onboarding.gif)

Here's a walkthrough of all implemented user stories:

![Video Walkthrough](/Carouselish_walkthrough/Carousel_walkthrough.gif)

GIF created with [LiceCap](http://www.cockos.com/licecap/).

## Notes

## License

    Copyright 2016 Michelle Venetucci Harvey

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.


