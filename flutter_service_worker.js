'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.bin": "df1b58fae063901429606f7e065b77ea",
"assets/AssetManifest.bin.json": "05fa8f81feb4ff51cb992f684a534ce0",
"assets/assets/images/Evently_app/Screen1.png": "08464eefe0b42b8ee37870b0c17407a1",
"assets/assets/images/Evently_app/Screen2.png": "a69ed3cafb1f48c539e4a08bba8d1576",
"assets/assets/images/Evently_app/Screen3.png": "d323535c65e8e5ae862695bc3aa289bd",
"assets/assets/images/Evently_app/Screen4.png": "adbe3dfc5a4b9bf363f2231cc75367e8",
"assets/assets/images/Evently_app/Screen5.png": "262c3648213a6807439b85be1cabee05",
"assets/assets/images/Evently_app/Screen6.png": "6dad5d2ef4f7be798e15338ef391b79c",
"assets/assets/images/Evently_app/Screen7.png": "e6f500ea9b306a6fe9a0feacff170e91",
"assets/assets/images/Fit_App/Screenshot_1749059729.png": "0beaecdda950d040b88cd9e09fe14725",
"assets/assets/images/Fit_App/Screenshot_1749059767.png": "29464ab848620245c17ac33f89bbf13a",
"assets/assets/images/Fit_App/Screenshot_1749059781.png": "27c98a38bb76f8574cbfce6fc52c59f4",
"assets/assets/images/Fit_App/Screenshot_1749059816.png": "92c2d224c8ff5ed6ae9fa07748815509",
"assets/assets/images/Fit_App/Screenshot_1749059843.png": "cb2fa27baeed5976b8de058b912107bf",
"assets/assets/images/Fit_App/Screenshot_1749059847.png": "fc318ba0c3cc111515fe1c7c3f7971fd",
"assets/assets/images/Fit_App/Screenshot_1749059858.png": "46d7c6e528ad9741b3002fde6af43ab1",
"assets/assets/images/Fit_App/Screenshot_1749059868.png": "11e1030ae479a49ad529171b025ae9c4",
"assets/assets/images/Fit_App/Screenshot_1749059901.png": "4e08097671752a19a681c801b1a9aeaf",
"assets/assets/images/Fit_App/Screenshot_1749059907.png": "0a549e81d225a6f1981e6c68a31c496b",
"assets/assets/images/Fit_App/Screenshot_1749059963.png": "f08e43874fe0b87d218d1a5271d0fec0",
"assets/assets/images/Fit_App/Screenshot_1749059981.png": "3933d8a7dec34535a28fb37f4228f3b0",
"assets/assets/images/Fit_App/Screenshot_1749060004.png": "cc7a1e3aa196ec74a6c72d48d476d29e",
"assets/assets/images/Fit_App/Screenshot_1749060034.png": "fc1558e83730ed808fc797f02d80194c",
"assets/assets/images/Hobix_Tracker/Screen1.png": "3c748702ab3e65763745cf3093d89199",
"assets/assets/images/Hobix_Tracker/Screen2.png": "3eae8be33d3a2e4ad2c89197292ab23a",
"assets/assets/images/Hobix_Tracker/Screen3.png": "8dd576a6af46471ef713ac88fed8a7d1",
"assets/assets/images/Hobix_Tracker/Screen4.png": "81f89f57fd3d7b22c57e20e8b17749a5",
"assets/assets/images/Hobix_Tracker/Screen5.png": "3b079f38485e5f84561976ddbf5a1ed4",
"assets/assets/images/Hobix_Tracker/Screen6.png": "f1edf302894ac4c037d3f548e40eb2ad",
"assets/assets/images/Hobix_Tracker/Screen7.png": "5bfeccd396709f92fc66e4d42dfaebba",
"assets/assets/images/Movies_app/Screen1.png": "51a92d37145da63cd91c855c2ec51df7",
"assets/assets/images/Movies_app/Screen10.png": "219ca4844a948a8e3dbae612d7ab59f0",
"assets/assets/images/Movies_app/Screen11.png": "e1dcc2a284965898ab18877aaa96ecf3",
"assets/assets/images/Movies_app/Screen2.png": "f59b9ca72df9a88c8bc286ac92160e56",
"assets/assets/images/Movies_app/Screen3.png": "e934612173fcd1a32c1f068a5177c2e0",
"assets/assets/images/Movies_app/Screen4.png": "e92894bf74fbdf3865983048a328cba8",
"assets/assets/images/Movies_app/Screen5.png": "acc917ab363aac0fcd6d22c2a12db978",
"assets/assets/images/Movies_app/Screen6.png": "ea7fa278261da24ec012551630e07579",
"assets/assets/images/Movies_app/Screen7.png": "ea6e9a22e07f27f56157c252e2209999",
"assets/assets/images/Movies_app/Screen8.png": "4593e24feb120b2fa14fb2116e120287",
"assets/assets/images/Movies_app/Screen9.png": "ef847b5182050f86c52ddd8f2dc6f90c",
"assets/assets/images/My_photo/my_photo.jpg": "cd678a979bf6934d7ec9bd14839eeb1d",
"assets/assets/pdf/Ahmed_Ehab_El-Badry_flutter_devloper3.pdf": "77e3041cf168095d335d305a869848cd",
"assets/FontManifest.json": "c75f7af11fb9919e042ad2ee704db319",
"assets/fonts/MaterialIcons-Regular.otf": "cef60bb28787a2d5a1d6942cac025e8d",
"assets/NOTICES": "e0b127c4fb5c69a046804f9e1dfad41f",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "33b7d9392238c04c131b6ce224e13711",
"assets/packages/font_awesome_flutter/lib/fonts/Font-Awesome-7-Brands-Regular-400.otf": "b7a225eb557dd600e4834771a6b0d16a",
"assets/packages/font_awesome_flutter/lib/fonts/Font-Awesome-7-Free-Regular-400.otf": "8d0acfbf774979914d3c0d736f4be13e",
"assets/packages/font_awesome_flutter/lib/fonts/Font-Awesome-7-Free-Solid-900.otf": "5b8d20acec3e57711717f61417c1be44",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/shaders/stretch_effect.frag": "40d68efbbf360632f614c731219e95f0",
"canvaskit/canvaskit.js": "8331fe38e66b3a898c4f37648aaf7ee2",
"canvaskit/canvaskit.js.symbols": "a3c9f77715b642d0437d9c275caba91e",
"canvaskit/canvaskit.wasm": "9b6a7830bf26959b200594729d73538e",
"canvaskit/chromium/canvaskit.js": "a80c765aaa8af8645c9fb1aae53f9abf",
"canvaskit/chromium/canvaskit.js.symbols": "e2d09f0e434bc118bf67dae526737d07",
"canvaskit/chromium/canvaskit.wasm": "a726e3f75a84fcdf495a15817c63a35d",
"canvaskit/skwasm.js": "8060d46e9a4901ca9991edd3a26be4f0",
"canvaskit/skwasm.js.symbols": "3a4aadf4e8141f284bd524976b1d6bdc",
"canvaskit/skwasm.wasm": "7e5f3afdd3b0747a1fd4517cea239898",
"canvaskit/skwasm_heavy.js": "740d43a6b8240ef9e23eed8c48840da4",
"canvaskit/skwasm_heavy.js.symbols": "0755b4fb399918388d71b59ad390b055",
"canvaskit/skwasm_heavy.wasm": "b0be7910760d205ea4e011458df6ee01",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter.js": "24bc71911b75b5f8135c949e27a2984e",
"flutter_bootstrap.js": "ce62d2c2e403dc0bf015b2e0f5c4b4b2",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "21bf4e511390f1499c3a081b533fccdd",
"/": "21bf4e511390f1499c3a081b533fccdd",
"main.dart.js": "40f15ec1510c2a8c4be9470b85b54de2",
"manifest.json": "d8fe34f7ae4c072a77b924e01dac8a50",
"version.json": "9b818ca9511483c901bed1545384376c"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
