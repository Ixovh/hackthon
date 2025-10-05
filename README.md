# XPatEase - Your AI-Powered Expat Assistant 🏠🤖

<div align="center">
  <img src="assets/images/ExpatEase.png" alt="ExpatEase Logo" width="200"/>
</div>

## 📱 About XPatEase

**XPatEase** is a comprehensive Flutter mobile application designed to help expatriates navigate life in Saudi Arabia with ease. The app features **Ameen**, your intelligent AI assistant powered by Google's Gemini AI, who provides personalized guidance and support for various aspects of expat life.

## Demo


**YouTube Demo Link:** [Watch the app demo here](https://youtube.com/shorts/pVfUvmQjiMQ?si=UHP2q2V_95fXkA7afeature=share)

## Design

**Figma Design Link:** [View the app design here](https://www.figma.com/design/cLLJ8uBg9EqWOwMCbM1JEg/Tuwaiq-Hackathon?node-id=19-2&t=BjISXW7CgyHk4Ugr-1)

## ✨ Key Features

### 🤖 AI Assistant - Ameen
- **Intelligent Chat Interface**: Powered by Google Gemini AI with real-time responses
- **Government Document Integration**: Automatically loads and processes HRSD (Human Resources and Social Development) PDF documents
- **Smart Document Search**: Uses advanced text chunking and relevance scoring to find answers from official government resources
- **Pre-configured Help Topics**:
  - Create a To-Do List for moving to Saudi
  - How to start investing in Saudi Arabia
  - Process for renting a house in Saudi
  - Money transfer abroad procedures (with detailed banking information)
- **Fallback Support**: Directs users to official support number (011232323) when specific information isn't available

### 🏠 Real Estate Section
- **Property Listings**: Browse residential properties with detailed information
- **Search & Filter**: Advanced search functionality with location-based filtering
- **Property Details**: Complete property information including:
  - Price listings (SAR 30,000 - 40,000+ range)
  - Location details (Riyadh districts: Al Narjis, Al Yasmeen)
  - Bedroom and bathroom specifications
  - High-quality property images
- **Interactive UI**: Modern search bar with filter options

### 👥 Community Platform
- **Dual-Tab Interface**: 
  - **Feeds Tab**: Social posts and community interactions
  - **Events Tab**: Local events and activities
- **User Posts**: Real community content including:
  - Public transport queries
  - International brand recommendations
  - Local venue experiences (Boulevard Riyadh City)
- **Event Listings**: Curated events with:
  - Date and time information
  - Location details (Dhahran, Ithra)
  - Event countdown timers
- **Interactive Features**: Add new posts, search and filter content

### 🏠 Home Dashboard
- **Personalized Experience**: Custom user greeting and profile integration
- **Notification System**: Bell icon for alerts and updates
- **Content Sections**:
  - "Picks For You" - Personalized recommendations
  - "Find your new home" - Quick property access
  - "Top Feeds" - Community highlights
- **Promotional Cards**: Dynamic content display with page indicators
- **Quick Navigation**: Direct access to all major features

### 📚 Learning Hub
- **Educational Resources**: Currently in development phase

### 🎯 Onboarding Experience
- **5-Step Welcome Process**:
  1. "Welcome to Saudi Arabia!" - Initial greeting
  2. "Meet Ameen! your AI assistant" - AI introduction
  3. "Let's find your new home!" - Real estate feature
  4. "Let's find your people!" - Community features
  5. "Learn & Adapt with Ease" - Learning resources
- **Interactive Navigation**: Skip, back, and next functionality
- **Visual Design**: Custom illustrations for each onboarding step

## 🛠️ Technical Implementation

### Core Technologies
- **Framework**: Flutter 3.9.2+ with Dart SDK
- **AI Integration**: Google Gemini AI (flutter_gemini v3.0.0)
- **State Management**: Provider pattern for reactive UI updates
- **PDF Processing**: 
  - Syncfusion Flutter PDF (v25.2.7) for document handling
  - PDF Text (v0.5.0) for text extraction
- **HTTP Client**: HTTP package (v0.13.6) for API calls and document downloads

### Advanced Features
- **Document Processing**: 
  - Automatic HRSD PDF download and processing
  - Text chunking (5000 character chunks) for optimal AI processing
  - Batch processing (10 pages per batch) for large documents
  - Relevance scoring algorithm for intelligent answer retrieval
- **UI Components**: 
  - Custom Circle Navigation Bar (v2.2.0)
  - Smooth Page Indicators (v1.2.1)
  - SF Pro Text font family integration
- **File Management**: Path Provider (v2.0.15) for temporary file handling

### Architecture
- **Modular Design**: Feature-based folder structure
- **Controller Pattern**: Separate controllers for each major feature
- **Provider State Management**: Reactive UI updates across the app
- **Custom Widgets**: Reusable components for consistent UI

## 📦 Complete Dependencies

```yaml
dependencies:
  flutter:
    sdk: flutter
  cupertino_icons: ^1.0.8
  flutter_gemini: ^3.0.0          # Google Gemini AI integration
  pdf_text: ^0.5.0               # PDF text extraction
  path_provider: ^2.0.15         # File system access
  syncfusion_flutter_pdf: ^25.2.7 # PDF document processing
  circle_nav_bar: ^2.2.0          # Custom navigation bar
  provider: ^6.0.5                # State management
  google_fonts: ^4.0.4            # Typography
  http: ^0.13.6                  # HTTP requests
  smooth_page_indicator: ^1.2.1  # Page indicators
```

## 🚀 Getting Started

### Prerequisites
- Flutter SDK 3.9.2 or higher
- Dart SDK
- Android Studio / VS Code with Flutter extensions
- iOS Simulator / Android Emulator
- Google Gemini API key

### Installation Steps

1. **Clone the repository**
   ```bash
   git clone https://github.com/yourusername/hackathon.git
   cd hackathon
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Configure API Keys**
   - Obtain a Google Gemini API key from [Google AI Studio](https://makersuite.google.com/app/apikey)
   - Update the `GEMINI_API_KEY` constant in `lib/main.dart`:
   ```dart
   const GEMINI_API_KEY = "your_api_key_here";
   ```

4. **Run the application**
   ```bash
   flutter run
   ```


## 📱 Detailed App Structure

```
lib/
├── feature/
│   ├── chat/                    # AI Chat functionality
│   │   ├── controller/          # Chat logic and Gemini integration
│   │   ├── screen/             # Chat and intro screens
│   │   └── widget/             # Message bubbles and input fields
│   ├── community/              # Community features
│   │   ├── controller/         # Community state management
│   │   ├── screen/            # Feeds and events screens
│   │   └── widget/            # Post cards and event components
│   ├── home/                   # Home dashboard
│   │   ├── controller/         # Home screen logic
│   │   ├── screen/            # Main home screen
│   │   └── widget/            # Promo cards and user components
│   ├── learn/                  # Learning resources (in development)
│   ├── navBar/                 # Navigation components
│   │   ├── controller/         # Navigation state
│   │   ├── screen/            # Main navigation screen
│   │   └── widget/            # Custom navigation bar
│   ├── on_boarding/            # App onboarding
│   ├── real_estate/            # Property listings
│   │   ├── controller/         # Real estate logic
│   │   ├── screen/            # Property screens
│   │   └── widget/            # Property cards
│   ├── signIn/                 # Authentication
│   ├── signUp/                 # User registration
│   └── splash/                 # Splash screen
└── main.dart                   # App entry point with Gemini initialization
```


## 🤝 Contributing

We welcome contributions from the community! Special thanks to our contributors:

- **[GhadahAlhamdan](https://github.com/GhadahAlhamdan)** - Project collaborator and contributor

### How to Contribute


1. Create a feature branch (`git checkout -b HatemBranch`)
2. Commit your changes (`git commit -m 'Add some amazing feature'`)
3. Push to the branch (`git push origin feature/amazing-feature`)
4. Open a Pull Request




---

- **Thanks to [GhadahAlhamdan](https://github.com/GhadahAlhamdan)** for her contributions on this project

