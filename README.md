# Swift_ForeCastApp
_____

The code was thought to follow in a minimal way the MVVM. It was the solution to try to apply
the SRP. To be possible was separated all responsibilities into different files. Basically, it
is structured in the View directory, ViewModel directory, Model directory, Service directory and
Extension directory. Some SOLID principles were not tried use because of the size and complexity
of the project.

The only responsibility of the view is ordinate the components of the screen and pass the inputs
to the view model.

The view model's responsibility is to implement logical thinking and manipulates the data to perform
the actions which are expected.

The model just structures the data to be instantiated which will be manipulated where it is needed.

The service is responsible to make the requests and communicate with the external part of the app.
It will cooperate with the view model to treat the data and delivery this to the view. Sometimes
will be necessary to modify the way how the data is, so for this issue the code has the extensions
to deal with that.

In the way of the dependency inversion, the code try to require information between layers considering
the most internal layer more solid as possible. It means, the model and view model can not be involved
for the view necessities. And the service will be responsible to preserve the model and view model
of the external contact.

In the case of reusability principle, was tried to use more clearly in the view layer, where was
implemented components to facilitate the manipulation in the view.

One issue to improve the code in the way to be open to extension and close to modification is implementing
interfaces between the view model and view and between service and view model. With this will be more evident
the close of modification and will be helpful in reengineering.

Was implemented the search bar, CoreData, and a history screen as it was possible. Was implemented the
loading alert and error alert to be able to identify what is happening in the system.

It was funny to learn about mobile, swift, and swiftUI. It was hard enough to begin because the machine is
not apple, I never used mac or xCode, it was the first contact. 

