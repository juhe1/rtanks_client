package forms.friends
{
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.Sprite;
   
   public class name_3475 extends Sprite
   {
      
      private static var var_3697:Class = name_3659;
      
      private static var var_3696:BitmapData = Bitmap(new var_3697()).bitmapData;
      
      private static var var_3695:Class = name_3658;
      
      private static var var_3694:BitmapData = Bitmap(new var_3695()).bitmapData;
      
      public static const name_990:int = 0;
      
      public static const name_1007:int = 1;
       
      
      public function name_3475(param1:int)
      {
         var _loc2_:Bitmap = null;
         super();
         this.tabChildren = false;
         this.tabEnabled = false;
         this.buttonMode = this.useHandCursor = true;
         switch(param1)
         {
            case 0:
               _loc2_ = new Bitmap(var_3696);
               break;
            case 1:
               _loc2_ = new Bitmap(var_3694);
         }
         addChild(_loc2_);
      }
   }
}
