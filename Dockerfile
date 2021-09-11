FROM ruby:2.6.8

# yarnインストールのための準備
RUN wget https://dl.yarnpkg.com/debian/pubkey.gpg 
RUN curl https://deb.nodesource.com/setup_12.x | bash
RUN cat pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

# ツールのインストール
RUN apt-get update -qq && apt-get install -y nodejs yarn sqlite3 libsqlite3-dev 

RUN mkdir /myapp
WORKDIR /myapp

# bundle install
COPY Gemfile /myapp/Gemfile
COPY Gemfile.lock /myapp/Gemfile.lock
RUN bundle install

# ソースコードをコピー
COPY . /myapp
