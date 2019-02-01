# Use the latest version of Node.js
#
# You may prefer the full image:
# FROM node
#
# or even an alpine image (a smaller, faster, less-feature-complete image):
# FROM node:alpine
#
# You can specify a version:
# FROM node:10-slim
FROM buildkite/puppeteer:latest

# Labels for GitHub to read your action
LABEL "com.github.actions.name"="Snappydoo!"
LABEL "com.github.actions.description"="Uses jest to convert Jest snapshots to the Slack Message builder format"
LABEL "com.github.actions.icon"="aperture"
LABEL "com.github.actions.color"="purple"

# Copy the package.json and package-lock.json
COPY package*.json ./

RUN  apt-get update \
     && apt-get install -y git-all

# Install dependencies
RUN npm ci

# Copy the rest of your action's code
COPY . .

# Run `node /entrypoint.js`
ENTRYPOINT ["snappydoo"]
