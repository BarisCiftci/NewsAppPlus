NewsApp

This repository contains a Swift application focused on fetching and displaying news articles using the NewsAPI. The application has been structured into different Swift files based on the Model-View-ViewModel (MVVM) pattern.
Structure


Model
	
 •	NewsResponse: Represents the response structure from the NewsAPI, including status, total results, and an array of articles.
 
 •	Article: Defines the article structure with details such as source, author, title, description, URL, and other attributes.
 
 •	Source: Represents the source of the news article with attributes like id and name.


ViewModel


•	NewsViewModel: This class is responsible for fetching news articles from different endpoints of the NewsAPI. It uses Swift's async-await pattern for asynchronous network calls.



View

	
 •	NewsView: A SwiftUI view that displays a list of news articles fetched by NewsViewModel. It provides buttons to fetch news from different endpoints and uses an AsyncImage for displaying article images.

 •	SwiftUIWebView: A UIViewRepresentable SwiftUI view that embeds a WKWebView to display the full article content when a news article is selected.



Features

	
 •	Fetching News: The application fetches news articles from three different endpoints of the NewsAPI and displays them in a list.
 
 •	Image Loading: Uses the AsyncImage SwiftUI view for asynchronous image loading and caching.

 •	Web View Integration: Allows users to read the full news article by navigating to a WKWebView when an article is selected.


How to Use
		
  Clone the repository to your local machine.
  
  Open the project in Xcode.
  
  Build and run the application on a simulator or a physical device

Dependencies

 •	SwiftUI: For building the user interface.
 •	Foundation: For URLSession and JSON decoding.
 •	WebKit: For embedding WKWebView in SwiftUI.
