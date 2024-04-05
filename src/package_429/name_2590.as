package package_429
{
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.Sprite;
   import package_464.name_2893;
   
   public class name_2590 extends Sprite
   {
       
      
      private var var_3154:name_2893;
      
      public function name_2590(param1:BitmapData)
      {
         super();
         var _loc2_:Bitmap = new Bitmap(param1);
         addChild(_loc2_);
         this.var_3154 = new name_2893(_loc2_.width);
         addChild(this.var_3154);
         mask = this.var_3154;
      }
      
      public function method_284(param1:Number, param2:Number) : void
      {
         this.var_3154.method_284(param1,param2);
      }
   }
}
