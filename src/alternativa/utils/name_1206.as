package alternativa.utils
{
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.Loader;
   import flash.events.Event;
   
   public class name_1206
   {
       
      
      private var loader:Loader;
      
      private var var_523:name_1207;
      
      private var _texture:BitmapData;
      
      private var listener:class_35;
      
      public function name_1206()
      {
         super();
      }
      
      public function get texture() : BitmapData
      {
         return this._texture;
      }
      
      public function createTexture(param1:name_1207, param2:class_35) : void
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
         this.var_523 = param1;
         this.listener = param2;
         param1.diffuseData.position = 0;
         this.loader = new Loader();
         this.loader.contentLoaderInfo.addEventListener(Event.COMPLETE,this.method_745);
         this.loader.loadBytes(param1.diffuseData);
      }
      
      private function method_745(param1:Event) : void
      {
         this._texture = Bitmap(this.loader.content).bitmapData;
         this.loader.contentLoaderInfo.removeEventListener(Event.COMPLETE,this.method_745);
         this.loader.unload();
         if(this.var_523.opacityData != null)
         {
            this.var_523.opacityData.position = 0;
            this.loader.contentLoaderInfo.addEventListener(Event.COMPLETE,this.method_746);
            this.loader.loadBytes(this.var_523.opacityData);
         }
         else
         {
            this.complete();
         }
      }
      
      private function method_746(param1:Event) : void
      {
         var _loc2_:BitmapData = Bitmap(this.loader.content).bitmapData;
         this.loader.contentLoaderInfo.removeEventListener(Event.COMPLETE,this.method_746);
         this.loader.unload();
         this._texture = name_1208.mergeBitmapAlpha(this._texture,_loc2_,true);
         this.complete();
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
