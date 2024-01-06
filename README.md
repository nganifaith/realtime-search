# Real-Time Article Search Application

Welcome to the Real-Time Article Search Application! This Rails 7 application allows users to search for articles in real-time and tracks and displays the most popular search terms.

## Table of Contents

- [Getting Started](#getting-started)
  - [Prerequisites](#prerequisites)
  - [Installation](#installation)
- [Running the Application](#running-the-application)
- [Testing](#testing)
- [Usage](#usage)
  - [Real-Time Search](#real-time-search)
  - [Popular Search Terms](#popular-search-terms)
- [Technologies Used](#technologies-used)
- [Contributing](#contributing)
- [License](#license)

## Getting Started

### Prerequisites

Make sure you have the following installed:

- Ruby (version X.X.X)
- Rails (version 7.X.X)
- Node.js
- Yarn
- SQLite3

### Installation

1. Clone the repository:
```bash
   git clone https://github.com/nganifaith/realtime-search
```
2. Navigate to the project directory:
```
cd realtime-search
```
3. Install dependencies:
```
bundle install
yarn install
```
4. Set up the database:
```
rails db:create
rails db:migrate
```
## Running the Application
Start the Rails server:
```
rails server
```

Visit http://localhost:3000 in your browser to access the application.

## Testing
Run RSpec tests:
```
rspec
```

## Usage
### Real-Time Search
- Enter a search term in the search bar.
- The application will dynamically update the search results in real-time.
- Popular Search Terms
- View the most popular search terms on the home page.
- Terms are ranked based on the number of searches.

### Technologies Used
- Ruby on Rails 7
- SQLite3
- RSpec for testing
- Tailwind CSS for styling
- Will Paginate for pagination

## Contributing
Contributions are welcome! Please follow the Contributing Guidelines.

## License
This project is licensed under the MIT License.