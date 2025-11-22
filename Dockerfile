FROM jekyll/jekyll:latest

# Install the github-pages gem to emulate GitHub Pages locally
RUN gem install github-pages

# Set working directory
WORKDIR /srv/jekyll

# Expose default Jekyll port
EXPOSE 4000

CMD ["jekyll", "serve", "--watch", "--host", "0.0.0.0", "--port", "4000"]