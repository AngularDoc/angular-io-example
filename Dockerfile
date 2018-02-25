FROM node:8-alpine

ENV USER=angular
ENV USER_HOME=/home/$USER
ENV APP_HOME=$USER_HOME/app

ENV PORT=4200

RUN addgroup -S $USER && adduser -S -G $USER $USER

COPY package.json package-lock.json $APP_HOME/

RUN chown -R $USER:$USER $APP_HOME
USER $USER
WORKDIR $APP_HOME

RUN npm install

COPY . $APP_HOME/

EXPOSE $PORT

ENTRYPOINT [ "npm", "start" ]
CMD [ "--", "--host", "0.0.0.0", "--port", "${PORT}" ]
