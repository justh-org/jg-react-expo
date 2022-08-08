# [Choice] Node.js version: 16, 14
# or others from https://hub.docker.com/_/node
FROM --platform=linux/amd64 node:16

# remove old yarn
RUN rm -rf /opt/yarn-v* /usr/local/bin/yarn /usr/local/bin/yarnpkg

# init for VS Code
RUN mkdir -p /root/workspace /root/.vscode-server 

# Install eslint typescript expo
RUN npm install -g eslint typescript expo-cli @expo/ngrok@^4.1.0

# Create app directory
WORKDIR /root/workspace

# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
COPY package*.json ./

RUN npm install
# If you are building your code for production
# RUN npm ci --only=production

COPY . .

EXPOSE 19000 19001 19002 19006

CMD /bin/sh -c "while sleep 86000; do :; done"
#CMD ["expo", "start", "--tunnel"]
#CMD ["expo", "start"]
