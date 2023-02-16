FROM nikolaik/python-nodejs:python3.11-nodejs18-slim

RUN apt-get update
RUN apt-get install -y build-essential

WORKDIR /bs3mc

COPY package.json .
RUN npm install --ignore-scripts --no-audit

COPY binding.gyp .
COPY deps ./deps
COPY src ./src
RUN npm run build-debug

COPY . .

CMD ["npm", "test"]
