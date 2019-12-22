FROM ruby:2.5

WORKDIR /usr/src/app
COPY . .

RUN gem install sinatra:2.0.7 sinatra-contrib:2.0.7 pry-byebug:3.7.0 pg:1.1.4 minitest:5.13.0

EXPOSE 4567

CMD ["ruby", "./app.rb"]