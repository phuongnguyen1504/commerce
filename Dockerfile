FROM node:20-alpine3.18
WORKDIR /app
RUN npm install -g npm@10.5.0
COPY package*.json .
# Copy your custom theme.
COPY themes ./themes

# Copy your custom extensions.
COPY extensions ./extensions

# Copy your config.
COPY config ./config

# Copy your media.
COPY media ./media

# Copy your public files.
COPY public ./public

# Copy your translations.
COPY translations ./translations

# Run npm install.
RUN npm install

# Build assets.
RUN npm run build

EXPOSE 80
CMD ["npm", "run", "start"]