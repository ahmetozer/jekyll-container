FROM alpine as jekyll
RUN apk add ruby-full ruby-dev make gcc build-base


ENV BUNDLE_SILENCE_ROOT_WARNING=1
ENV GEM_HOME="/usr/gems"
ENV PATH="/usr/gems/bin:$PATH"
ENV BUNDLE_DISABLE_PLATFORM_WARNINGS=true

RUN mkdir -p "$GEM_HOME" && chmod 777 "$GEM_HOME" &&\
$(addgroup -g 82 -S www-data || true ) &&\
$(adduser -u 82 -D -S -G www-data www-data || true) 

RUN gem update --system && \
gem install jekyll bundler &&\
chown -R www-data:www-data /usr/lib/ruby/
WORKDIR /srv/jekyll/
USER www-data