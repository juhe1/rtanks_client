package alternativa.tanks.models.battlefield.gui.inventory
{
   import flash.display.Bitmap;
   import flash.display.Sprite;
   
   public class name_2589 extends Sprite
   {
      
      public static const name_2592:int = 0;
      
      public static const const_2375:int = 1;
      
      public static const name_2598:int = 2;
       
      
      private var var_3157:Bitmap;
      
      private var var_3156:Bitmap;
      
      private var var_3155:Bitmap;
      
      public function name_2589(param1:int)
      {
         super();
         this.var_3157 = this.method_2915(param1);
         addChild(this.var_3157);
         this.var_3156 = this.method_2913(param1);
         addChild(this.var_3156);
         this.var_3155 = this.method_2914(param1);
         addChild(this.var_3155);
         this.state = 0;
      }
      
      protected function method_2914(param1:int) : Bitmap
      {
         return new Bitmap(HudInventoryIcon.name_3135(param1));
      }
      
      protected function method_2913(param1:int) : Bitmap
      {
         return new Bitmap(HudInventoryIcon.name_3133(param1));
      }
      
      protected function method_2915(param1:int) : *
      {
         return new Bitmap(HudInventoryIcon.name_3134(param1));
      }
      
      public function set state(param1:int) : void
      {
         this.var_3157.visible = param1 == 0;
         this.var_3156.visible = param1 == 1;
         this.var_3155.visible = param1 == 2;
      }
   }
}
