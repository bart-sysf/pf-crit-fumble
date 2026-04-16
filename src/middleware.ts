import { defineMiddleware } from 'astro:middleware';

export const onRequest = defineMiddleware(async (_, next) => {
    const res = await next();

    res.headers.set('Strict-Transport-Security', 'max-age=31536000; preload');
    res.headers.set('X-Content-Type-Options', 'nosniff');
    res.headers.set('X-Frame-Options', 'SAMEORIGIN');
    res.headers.set('Referrer-Policy', 'strict-origin-when-cross-origin');

    return res;
});
