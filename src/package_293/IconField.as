package package_293
{
   import assets.icons.BattleInfoIcons;
   import controls.Label;
   import flash.display.Bitmap;
   import flash.display.Sprite;
   
   public class IconField extends Sprite
   {
      
      private static const dom:Class = name_2563;
       
      
      protected var icon:BattleInfoIcons;
      
      protected var var_2269:int;
      
      protected var label:Label;
      
      private var var_2268:Bitmap;
      
      public function IconField(param1:int = -1)
      {
         super();
         this.var_2269 = param1;
         this.init();
      }
      
      protected function init() : void
      {
         if(this.var_2269 == 10)
         {
            this.var_2268 = new Bitmap(new dom().bitmapData);
            addChild(this.var_2268);
            this.var_2268.x = 0;
            this.var_2268.y = 2;
         }
         else if(this.var_2269 > -1)
         {
            this.icon = new BattleInfoIcons();
            this.icon.type = this.var_2269;
            addChild(this.icon);
            this.icon.x = 0;
            this.icon.y = 0;
         }
         this.label = new Label();
         this.label.color = 16777215;
         if(Boolean(this.icon))
         {
            this.label.x = this.icon.width + 3;
         }
         if(Boolean(this.var_2268))
         {
            this.label.x = this.var_2268.width + 3;
         }
         addChild(this.label);
      }
      
      public function set text(param1:String) : void
      {
         this.label.htmlText = param1;
      }
      
      public function set size(param1:Number) : void
      {
         this.label.size = param1;
      }
   }
}
