FROM ubuntu as jekyll
ENV DEBIAN_FRONTEND=noninteractive
RUN apt update ;\
 apt upgrade -y ;\
 apt install -y --no-install-recommends ruby-full build-essential zlib1g-dev ;\
 apt autoclean ;\
 apt autoremove ;\
 rm -rf /var/cache/apt
COPY --from=ubuntu /var/cache/apt /var/cache/apt
RUN echo '# Install Ruby Gems to ~/gems' >> ~/.bashrc ;\
echo 'export GEM_HOME="$HOME/gems"' >> ~/.bashrc ;\
echo 'export PATH="$HOME/gems/bin:$PATH"' >> ~/.bashrc ;\
gem install jekyll bundler
