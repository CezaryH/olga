FROM jekyll/jekyll:4

WORKDIR /srv/jekyll

# Copy only Gemfile(s) first to leverage Docker cache
COPY Gemfile Gemfile.lock* ./

# Install gems
RUN bundle install --jobs 4 --retry 3

# Copy the rest of the site
COPY . .

EXPOSE 4000

# Serve on all interfaces so it's reachable from host
CMD ["bundle", "exec", "jekyll", "serve", "--livereload", "--force_polling", "--host=0.0.0.0"]
