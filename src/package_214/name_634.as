package package_214
{
   import flash.display.Bitmap;
   import flash.display.Sprite;
   import package_275.name_865;
   import package_30.name_63;
   
   public class name_634 extends Sprite
   {
      
      public static var clanCreateService:name_63;
       
      
      public var country:name_865;
      
      private var flag:Bitmap;
      
      public function name_634(param1:name_865 = null)
      {
         super();
         if(param1 == null)
         {
            param1 = clanCreateService.defaultFlag;
         }
         this.name_1877(param1);
      }
      
      public static function method_1454(param1:name_865) : Bitmap
      {
         return new Bitmap(param1.flagImage.data);
      }
      
      public function name_1877(param1:name_865) : void
      {
         this.method_1455();
         this.flag = method_1454(param1);
         this.country = param1;
         addChild(this.flag);
      }
      
      private function method_1455() : void
      {
         while(numChildren > 0)
         {
            removeChildAt(0);
         }
      }
   }
}
