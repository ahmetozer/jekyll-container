FROM alpine as jekyll
RUN apk add ruby-full ruby-dev make gcc build-base
RUN echo 'export GEM_HOME="$HOME/gems"' >> /etc/profile.d/jekyll.sh &&\
echo 'export PATH="$HOME/gems/bin:$PATH"' >> /etc/profile.d/jekyll.sh &&\
chmod +x /etc/profile.d/jekyll.sh &&\
. /etc/profile.d/jekyll.sh && \
gem update --system && \
gem install jekyll bundler
WORKDIR /srv/jekyll/