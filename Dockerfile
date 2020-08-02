FROM ubuntu as jekyll
ENV DEBIAN_FRONTEND=noninteractive
RUN apt update && \
 apt upgrade -y && \
 apt install -y --no-install-recommends ruby-full build-essential zlib1g-dev ca-certificates && \
 apt autoclean && \
 apt autoremove && \
 rm -rf /var/cache/apt && \
 find /var/lib/apt/lists/ -maxdepth 1 -type f -print0 | xargs -0 rm

COPY --from=ubuntu /var/cache/apt /var/cache/apt
RUN echo '# Install Ruby Gems to ~/gems' >> ~/.bashrc ;\
echo 'export GEM_HOME="$HOME/gems"' >> ~/.bashrc ;\
echo 'export PATH="$HOME/gems/bin:$PATH"' >> ~/.bashrc ;\
gem install jekyll bundler
