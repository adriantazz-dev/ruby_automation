FROM ruby:3.2.3

# Install dependencies required for the project
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    wget curl unzip ca-certificates \
    gnupg2 dirmngr \
    && rm -rf /var/lib/apt/lists/*

# Install Google Chrome
RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - && \
    echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google-chrome.list && \
    apt-get update && \
    apt-get install -y google-chrome-stable --no-install-recommends

# Set the working directory inside the container
WORKDIR /ruby_automation

# Copy Gemfile and Gemfile.lock, and install Ruby dependencies
COPY Gemfile Gemfile.lock ./
RUN bundle install
# Workaround for webdrivers issue not finding the correct version of chromedriver
RUN bundle update selenium-webdriver

# Copy the rest of the application code
COPY . .

# Set environment variables
# ENV TEST_USER="" \
#     TEST_PASSWORD="" \
#     POSTMARK_API_TOKEN="" \
#     POSTMARK_EMAIL=""

# Default command to execute
# CMD ["rspec"]
