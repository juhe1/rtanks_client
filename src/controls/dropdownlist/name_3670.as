package controls.dropdownlist
{
   import flash.display.Bitmap;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   
   public class name_3670 extends Sprite
   {
       
      
      private var var_3751:Class;
      
      private var var_3750:Class;
      
      private var back:Bitmap;
      
      private var var_3752:Bitmap;
      
      public function name_3670()
      {
         this.var_3751 = name_3732;
         this.var_3750 = name_3731;
         this.back = new this.var_3751();
         this.var_3752 = new this.var_3750();
         super();
         addChild(this.back);
         buttonMode = true;
         addEventListener(MouseEvent.ROLL_OVER,this.method_1530);
         addEventListener(MouseEvent.ROLL_OUT,this.onMouseOut);
      }
      
      private function method_1530(param1:MouseEvent) : void
      {
         removeChildren();
         addChild(this.var_3752);
      }
      
      private function onMouseOut(param1:MouseEvent) : void
      {
         addChild(this.back);
      }
   }
}
