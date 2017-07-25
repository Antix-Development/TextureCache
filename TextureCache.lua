
TextureCache = Core.class()

function TextureCache:init()
  self.textures = {}
end

function TextureCache:reset() -- flush all loaded textures
  self.textures = {}
  collectgarbage("collect")
end

function TextureCache:removeTexture(name) -- uncache named texture
  local textures = self.textures
  textures[name] = nil
  collectgarbage("collect")
end

function TextureCache:getTexture(name, filter) -- returns cached or new texture
  filter = filter or false
  local textures = self.textures
  local texture
  if textures[name] then
    texture = textures[name] -- return cached texture
--    print("returning cached texture " .. name)
  else
    texture = Texture.new(name, filter) -- create and return new texture
    textures[name] = texture
--    print("cached new texture " .. name)
  end
  return texture
end
