FROM ruby:2.5

WORKDIR /usr/src/app
COPY . .

RUN gem install sinatra sinatra-contrib pry-byebug pg minitest

EXPOSE 4567

CMD ["ruby", "./app.rb"]