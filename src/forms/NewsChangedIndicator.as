package forms
{
   import flash.display.Bitmap;
   import flash.display.Sprite;
   import flash.net.SharedObject;
   import package_1.Main;
   import package_130.name_348;
   import package_446.name_3092;
   import package_95.name_298;
   
   public class NewsChangedIndicator extends Sprite
   {
       
      
      private var var_1308:Bitmap;
      
      private var storage:SharedObject;
      
      private var var_3128:Vector.<name_348>;
      
      public function NewsChangedIndicator()
      {
         super();
         this.storage = name_298(Main.osgi.name_6(name_298)).getStorage();
         this.init();
      }
      
      private function init() : void
      {
         this.var_1308 = new name_3092.var_2639();
         addChild(this.var_1308);
      }
      
      public function name_2517(param1:Vector.<name_348>) : void
      {
         this.var_3128 = param1;
         if(this.storage.data["NEWS_VIEWED_ID"] == undefined || this.storage.data["NEWS_VIEWED_ID"] != param1[0].id.low)
         {
            this.visible = true;
         }
         else
         {
            this.visible = false;
         }
      }
      
      public function name_2523() : void
      {
         this.storage.data["NEWS_VIEWED_ID"] = this.var_3128[0].id.low;
         this.name_2517(this.var_3128);
      }
   }
}
