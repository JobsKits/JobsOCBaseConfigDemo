/* 教学缓存只存本目录静态资源；版本升级改 CACHE，activate 只清理本实验自己的旧版本。 */
const CACHE='jobs-pwa-learning-v2';
const ROOT=new URL('./',self.location.href);
const SHELL=['./','./index.html','./manifest.webmanifest'].map(path=>new URL(path,ROOT).href);
self.addEventListener('install',event=>{event.waitUntil(caches.open(CACHE).then(cache=>cache.addAll(SHELL)).then(()=>self.skipWaiting()))});
self.addEventListener('activate',event=>{event.waitUntil(caches.keys().then(keys=>Promise.all(keys.filter(key=>key.startsWith('jobs-pwa-learning-')&&key!==CACHE).map(key=>caches.delete(key)))).then(()=>self.clients.claim()))});
self.addEventListener('fetch',event=>{
 const request=event.request;
 if(request.method!=='GET'||!SHELL.includes(request.url))return;
 event.respondWith(caches.open(CACHE).then(async cache=>{const cached=await cache.match(request);if(cached)return cached;const response=await fetch(request);if(response.ok)await cache.put(request,response.clone());return response}));
});
