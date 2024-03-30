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

# Install ChromeDriver
RUN CHROMEDRIVER_VERSION=$(curl -sS chromedriver.storage.googleapis.com/LATEST_RELEASE) && \
    wget -N "http://chromedriver.storage.googleapis.com/${CHROMEDRIVER_VERSION}/chromedriver_linux64.zip" -P /tmp && \
    unzip /tmp/chromedriver_linux64.zip -d /usr/local/bin/ && \
    rm /tmp/chromedriver_linux64.zip && \
    chmod 0755 /usr/local/bin/chromedriver

# Set the working directory inside the container
WORKDIR /ruby_automation

# Copy Gemfile and Gemfile.lock, and install Ruby dependencies
COPY Gemfile Gemfile.lock ./
RUN bundle install

# Copy the rest of the application code
COPY . .

# Set environment variables
ENV TEST_USER="" \
    TEST_PASSWORD="" \
    POSTMARK_API_TOKEN="" \
    POSTMARK_EMAIL=""

# Set the default command to execute
CMD ["rspec"]
