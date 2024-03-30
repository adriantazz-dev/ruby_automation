
# Ruby Automation Framework

This framework is designed to automate testing web applications using RSpec and Capybara within a Dockerized environment. It leverages Google Chrome for browser-based testing and is configured to be easy to set up and run across any system that supports Docker.

## Prerequisites

Before you begin, ensure you have Docker installed on your system. For installation instructions, refer to the [official Docker documentation](https://docs.docker.com/get-docker/).

## Getting Started

### 1. Clone the Repository

Start by cloning this repository to your local machine:

```sh
git clone https://github.com/adriantazz-dev/ruby_automation.git
cd ruby_automation
```

### 2. Build the Docker Image

From the root directory of the cloned project, run the following command to build the Docker image. This process can take a few minutes as it sets up the entire environment required for the tests to run.

```sh
docker build -t ruby_automation .
```

### 3. Running Tests

After successfully building the image, it's time to execute your tests. The behavior and environment of the tests can be controlled through several environment variables, specifically tailored for Postmark integration:

- `TEST_USER`: Username for logging into Postmark.
- `TEST_PASSWORD`: Password for logging into Postmark.
- `POSTMARK_API_TOKEN`: API token of Postmark server, used for email testing.
- `POSTMARK_EMAIL`: Email address used in Postmark.

To configure these settings for a test run, you have two options: either set these variables directly in the Dockerfile before building your image or pass them dynamically at runtime using the -e flag with the docker run command. The latter option allows for greater flexibility, especially when running tests in different environments or configurations without the need to rebuild the image.

For instance, to run tests with specific Postmark credentials, you could use the following command:

```sh
docker run --rm -e TEST_USER=yourusername -e TEST_PASSWORD=yourpassword -e POSTMARK_API_TOKEN=yourapitoken -e POSTMARK_EMAIL=youremail ruby_automation
```
This approach executes the rspec command, as specified in the Dockerfile's default command, thereby initiating all tests within your project. This method is particularly effective for seamlessly integrating your automated tests into CI/CD pipelines or for local development and testing, ensuring your application interacts with Postmark as expected.
---

Made with ❤️ by Adrian Castro from Costa Rica.
