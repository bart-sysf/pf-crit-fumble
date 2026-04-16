FROM node:22-alpine

WORKDIR /app

COPY dist/ ./dist/

ENV HOST=0.0.0.0
ENV PORT=8080
EXPOSE 8080

CMD ["node", "./dist/server/entry.mjs"]