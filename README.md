# YouChat: Application for online educators

YouChat is a simple Flutter-based chat application allowing online educators to interact with their pupils and viewers efficiently.

## Description

The YouChat App is an innovative and user-friendly communication platform for online educators who wish to connect to their pupils and students hassle-free. The idea of YouChat was something my roommate and I came up with on the spot considering the circumstances that my roommate's mother is an online educator on youtube and wanted a simple, easy-to-use platform to help her students connect and interact with her. YouChat uses the latest technologies and features offered by Flutter, an open-source UI development platform, and the Dart programming language used to develop web and mobile apps, server and desktop applications.![1024](https://github.com/arundhatimenon/you_chat/assets/80510503/5c061f9f-dec2-4e99-b346-32000f26efd7 =250x250)


## Behind YouChat - Ideas and Implementation

The YouChat application utilizes the fundamentals of frontend and backend mobile app development employing technologies like Flutter and Dart for frontend and Firebase by Google development services as the backend operator. Firebase is a backend cloud computing service and application development platform provided by Google. It hosts databases, services, authentication, and integration for several applications, including Android, iOS, JavaScript, etc. 

The chat app uses the authentication and Firestore Database services provided by the Firebase console, where, with the help of in-built collections and sign-in methods, the database stores user information like email, user ID, full name, etc., on the cloud. To navigate through and accurately map the username and email ID of the logged-in user, we used the Shared preferences library provided as a flutter dependency. We imported it into the HelperFunctions class of the "helperfunction.dart" file. Importing the shared preferences library allowed us to store simple data in key-value pairs, thus correctly mapping and storing the unique username and email id in the database. 

The main highlight of the application- The Chat mechanism was initially tricky. However, with constant efforts and patience, we achieved a seamless, smooth operation and rendition of the messaging mechanism with the help of the Streambuilder widget. In Flutter, the StreamBuilder widget helps build UI components that depend on asynchronous data streams. It allowed us to update the UI automatically whenever the data in the stream changed, thus making the messaging mechanism easy to use and highly integrated.
