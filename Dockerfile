FROM node:22-alpine AS production

WORKDIR /app

COPY package.json pnpm-lock.yaml pnpm-workspace.yaml ./

RUN echo "UTC" > /etc/timezone \
    && apk add --no-cache curl bash \
    && curl -fsSL https://get.pnpm.io/install.sh | env PNPM_VERSION="10.24.0" ENV="$HOME/.bashrc" SHELL="$(which bash)" bash - \
    && source $HOME/.bashrc \
    && pnpm install --prod --frozen-lockfile \
    && rm -rf /var/cache/apk/*

COPY dist/ ./dist/

ENV HOST=0.0.0.0
ENV PORT=8080
EXPOSE 8080

CMD ["node", "./dist/server/entry.mjs"]