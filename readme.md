Texture Cache - A simple cache of reusable textures.

When you are using a lot of images, you usually combine them into a Texture Atlas. Whilst this works for small projects what if your game had thousands of different inventory items, some of which would share images but most would have unique ones. This is where using a Texture Atlas stops being viable because the Atlas file would be so large that it is unlikely that a mobile device would support its dimensions, and even if it could, it would probably not have enough texture memory to load it anyway. So we have to resort to loading images manually as required which seems logical because at any one time we will only require a handful of images to be loaded into texture memory.

TextureCache helps manage the loading of textures and stops duplicate textures being loaded into texture memory.

The way TextureCache works is pretty simple. Just call getTexture(name) where name is the name of the texture file you want to load. If TextureCache has previously loaded the texture it will return it's internal instance of it, otherwise it will load the texture, add it to it's cache of textures and then return that instance.

When you are finished using the cache just call reset() and all cached textures will be flushed and if there are no references to any of the cached textures, their texture memory will be released for re use.
