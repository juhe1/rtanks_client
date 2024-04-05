package forms.battlelist
{
   import controls.Label;
   import controls.statassets.name_1154;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.Sprite;
   import package_1.Main;
   import package_54.name_102;
   import package_60.TextConst;
   
   public class NoSubScribeAlert extends Sprite
   {
      
      private static const const_2674:Class = name_3419;
      
      private static const const_2673:BitmapData = new const_2674().bitmapData;
       
      
      private var bg:name_1154;
      
      private var label:Label;
      
      private var var_3475:Bitmap;
      
      public function NoSubScribeAlert()
      {
         super();
         var _loc1_:name_102 = Main.osgi.name_6(name_102) as name_102;
         this.bg = new name_1154();
         this.bg.height = 69;
         addChild(this.bg);
         this.var_3475 = new Bitmap(const_2673);
         addChild(this.var_3475);
         this.var_3475.x = 12;
         this.var_3475.y = 3;
         this.label = new Label();
         this.label.text = _loc1_.getText(TextConst.const_159);
         this.label.x = 100;
         this.label.multiline = true;
         this.label.wordWrap = true;
         addChild(this.label);
      }
      
      override public function set width(param1:Number) : void
      {
         this.bg.width = param1;
         this.label.width = param1 - 112;
         this.label.y = 70 - this.label.height >> 1;
      }
      
      override public function set height(param1:Number) : void
      {
      }
   }
}
