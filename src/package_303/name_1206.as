package package_303
{
   import alternativa.utils.name_1208;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.Loader;
   import flash.events.Event;
   import flash.utils.ByteArray;
   
   public class name_1206
   {
       
      
      private var _texture:BitmapData;
      
      private var listener:class_35;
      
      private var loader:Loader;
      
      private var var_523:TextureByteData;
      
      private var var_522:Boolean;
      
      public function name_1206()
      {
         super();
      }
      
      public function get texture() : BitmapData
      {
         return this._texture;
      }
      
      public function method_747() : void
      {
         this.var_522 = true;
      }
      
      public function createTexture(param1:TextureByteData, param2:class_35) : void
      {
         if(this.loader != null)
         {
            throw new Error("Construction in progress");
         }
         if(param1 == null)
         {
            throw new ArgumentError("Parameter textureData is null");
         }
         if(param1.diffuseData == null)
         {
            throw new ArgumentError("Diffuse data is null");
         }
         this.var_522 = false;
         this.var_523 = param1;
         this.listener = param2;
         this.loadBytes(param1.diffuseData,this.method_745);
      }
      
      private function loadBytes(param1:ByteArray, param2:Function) : void
      {
         param1.position = 0;
         this.loader = new Loader();
         this.loader.contentLoaderInfo.addEventListener(Event.COMPLETE,param2);
         this.loader.loadBytes(param1);
      }
      
      private function method_745(param1:Event) : void
      {
         if(this.var_522)
         {
            Bitmap(this.loader.content).bitmapData.dispose();
            this.loader.unload();
            this.loader = null;
         }
         else
         {
            this._texture = Bitmap(this.loader.content).bitmapData;
            this.loader.contentLoaderInfo.removeEventListener(Event.COMPLETE,this.method_745);
            this.loader.unload();
            if(this.var_523.opacityData != null)
            {
               this.loadBytes(this.var_523.opacityData,this.method_746);
            }
            else
            {
               this.complete();
            }
         }
      }
      
      private function method_746(param1:Event) : void
      {
         var _loc2_:BitmapData = null;
         if(this.var_522)
         {
            Bitmap(this.loader.content).bitmapData.dispose();
            this.loader.unload();
            this.loader = null;
         }
         else
         {
            _loc2_ = Bitmap(this.loader.content).bitmapData;
            this.loader.contentLoaderInfo.removeEventListener(Event.COMPLETE,this.method_746);
            this.loader.unload();
            this._texture = name_1208.mergeBitmapAlpha(this._texture,_loc2_,true);
            this.complete();
         }
      }
      
      private function complete() : void
      {
         this.loader = null;
         this.var_523 = null;
         var _loc1_:class_35 = this.listener;
         this.listener = null;
         _loc1_.onTextureReady(this);
      }
   }
}
