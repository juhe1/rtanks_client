package alternativa.tanks.vehicles.tanks
{
   import flash.display.BitmapData;
   import flash.utils.Dictionary;
   
   public class SkinTextureRegistry implements name_967
   {
       
      
      private var textures:Dictionary;
      
      public function SkinTextureRegistry()
      {
         this.textures = new Dictionary();
         super();
      }
      
      public function method_670(param1:TankSkinPart, param2:BitmapData) : BitmapData
      {
         var _loc3_:Dictionary = this.textures[param1.var_1717];
         if(_loc3_ == null)
         {
            _loc3_ = new Dictionary();
            this.textures[param1.var_1717] = _loc3_;
         }
         var _loc4_:TextureEntry = _loc3_[param2];
         if(_loc4_ == null)
         {
            _loc4_ = new TextureEntry(param1.createTexture(param2));
            _loc3_[param2] = _loc4_;
         }
         ++_loc4_.refCount;
         return _loc4_.texture;
      }
      
      public function method_1919(param1:TankSkinPart, param2:BitmapData) : void
      {
         var _loc3_:Dictionary = this.textures[param1.var_1717];
         if(_loc3_ == null)
         {
            return;
         }
         var _loc4_:TextureEntry = _loc3_[param2];
         if(_loc4_ == null)
         {
            return;
         }
         --_loc4_.refCount;
         if(_loc4_.refCount == 0)
         {
            _loc4_.texture.dispose();
            delete _loc3_[param2];
         }
      }
      
      public function clear() : void
      {
      }
   }
}

import flash.display.BitmapData;

class TextureEntry
{
    
   
   public var refCount:int;
   
   public var texture:BitmapData;
   
   public function TextureEntry(param1:BitmapData)
   {
      super();
      this.texture = param1;
   }
}
