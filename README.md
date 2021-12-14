<!-- PROJECT SHIELDS -->
<!--
*** I'm using markdown "reference style" links for readability.
*** Reference links are enclosed in brackets [ ] instead of parentheses ( ).
*** See the bottom of this document for the declaration of the reference variables
*** for contributors-url, forks-url, etc. This is an optional, concise syntax you may use.
*** https://www.markdownguide.org/basic-syntax/#reference-style-links
-->
[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]
[![MIT License][license-shield]][license-url]



<!-- PROJECT LOGO -->
<br />
<p align="center">
  <h3 align="center">Fanbant  Test</h3>
  <p align="center">
  Fanbant ROR skill test
    <br />
    <a href="https://github.com/collinsugwu/fanbant/blob/master/Rakefile"><strong>Explore the docs �</strong></a>
    <br />
    <br />
    �
    <a href="https://github.com/collinsugwu/fanbant/issues">Report Bug</a>
    �
    <a href="https://github.com/collinsugwu/fanbant/issues">Request Feature</a>
  </p>
</p>



<!-- TABLE OF CONTENTS -->
## Table of Contents

* [About the Project](#about-the-project)
  * [Built With](#built-with)
* [Getting Started](#getting-started)
  * [Prerequisites](#prerequisites)
  * [Installation](#installation)
* [Usage](#usage)
* [Roadmap](#roadmap)
* [Contributing](#contributing)
* [License](#license)
* [Contact](#contact)
* [Acknowledgements](#acknowledgements)



<!-- ABOUT THE PROJECT -->
## About The Project
<!-- [![Product Name Screen Shot][product-screenshot]](https://example.com) -->

We want to create a basic survey tool to ask users questions. A survey can have questions and
each question can have answers.
Each question has a description, and the options for each question is a single choice answer.
Anybody can answer questions in a survey.

### Built With
This progam was made using this technologies
* [Ruby](https://www.ruby-lang.org/en/)
* [Rails](https://rubyonrails.org/)
* [SQLite](https://www.sqlite.org/index.html)
* [Rubocop](https://github.com/rubocop-hq/rubocop)
* [RSpec](https://github.com/rspec/rspec-rails)


<!-- GETTING STARTED -->
## Getting Started

To get a local copy up and running follow these simple example steps.

### Prerequisites

* Ruby
You can easily install Ruby on your Linux computer by using [Homebrew](https://docs.brew.sh/) and [Chruby](https://github.com/postmodern/chruby)
```sh
brew install chruby
brew install ruby-install
ruby-install ruby
```

* Rails
  You can easily install Rails directly from the [rails site](https://rubyonrails.org/)

```sh
  gem install rails
```

### Installation

<!-- 1. Get a free API Key at [https://example.com](https://example.com) -->
1. Clone the repo
```sh
git clone https://github.com/collinsugwu/fanbant
```
 3. Install Dependencies in your rails app
```sh
bundle install
``` 
<!-- 4. Enter your API in `config.js`
```JS
const API_KEY = 'ENTER YOUR API';
``` -->
4. Migration
```
rails db:migrate
```
4. Seed database with fakedata
```
rails db:seed
```
4. Testing
```
rspec
```

## Roadmap

See the [open issues](https://github.com/collinsugwu/fanbant/issues) for a list of proposed features (and known issues).


<!-- CONTRIBUTING -->
## Contributing

Contributions are what make the open source community such an amazing place to be learn, inspire, and create. Any contributions you make are **greatly appreciated**.

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request



<!-- LICENSE -->
## License

Distributed under the MIT License. See `LICENSE` for more information.


<!-- CONTACT -->
## Contact


* Collins Ugwu: [Github](https://github.com/collinsugwu), [Twitter](https://twitter.com/collinsugwu_me)

Project Link: [https://github.com/collinsugwu/fanbant](https://github.com/collinsugwu/fanbant)

<!-- ACKNOWLEDGEMENTS -->
## Acknowledgements
* [Microverse](https://www.microverse.org/)
* [The Odin Project](https://www.theodinproject.com/)




<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
[contributors-shield]: https://img.shields.io/github/contributors/collinsugwu/fanbant
[contributors-url]: https://github.com/collinsugwu/fanbant/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/collinsugwu/fanbant
[forks-url]: https://github.com/collinsugwu/fanbant/network/members
[stars-shield]: https://img.shields.io/github/stars/collinsugwu/fanbant
[stars-url]: https://github.com/collinsugwu/fanbant/stargazers
[issues-shield]: https://img.shields.io/github/issues/collinsugwu/fanbant
[issues-url]: https://github.com/collinsugwu/fanbant
[license-shield]: https://img.shields.io/github/license/collinsugwu/fanbant