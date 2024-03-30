# RSpec and Capybara Automation Framework

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

Once the image is built, you can run your tests using the following command:

```sh
docker run --rm ruby_automation
```

This command executes the `rspec` command defined in the Dockerfile as the default command. It runs all the specs located in your project.

### 4. Environment Variables

The framework uses several environment variables for configuration:

- `TEST_USER`: Username for logging into the test application.
- `TEST_PASSWORD`: Password for the test user.
- `POSTMARK_API_TOKEN`: API token for Postmark, used for email testing.
- `POSTMARK_EMAIL`: Email address used with Postmark.

You can set these variables before running the container by using the `-e` option with the `docker run` command. For example:

```sh
docker run --rm -e TEST_USER=yourusername -e TEST_PASSWORD=yourpassword ruby_automation
```
