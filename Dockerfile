FROM jekyll/jekyll:latest

# Install the github-pages gem to emulate GitHub Pages locally
# --force: the base image ships sass-embedded, whose `sass` executable otherwise blocks the install
RUN gem install github-pages --force

# Set working directory
WORKDIR /srv/jekyll

# Expose default Jekyll port
EXPOSE 4000

CMD ["jekyll", "serve", "--watch", "--host", "0.0.0.0", "--port", "4000"]