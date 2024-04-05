package package_457
{
   import flash.display.Bitmap;
   import flash.display.Sprite;
   import package_464.name_2893;
   
   public class name_2935 extends Sprite
   {
       
      
      protected var var_3476:Bitmap;
      
      protected var var_2871:name_2893;
      
      private var var_170:Sprite;
      
      public function name_2935()
      {
         this.var_170 = new Sprite();
         super();
         addChild(this.var_170);
         this.var_2871 = new name_2893(this.var_3476.width);
         this.var_170.addChild(this.var_2871);
         this.method_3119();
      }
      
      public function method_1981(param1:Number) : void
      {
         param1 = Math.max(0,Math.min(1,param1));
         param1 = this.method_3120(param1);
         if(param1 == 0)
         {
            this.method_3119();
         }
         else
         {
            this.var_2871.method_284(1 - param1,1);
            this.method_3121();
         }
      }
      
      private function method_3120(param1:Number) : Number
      {
         var _loc2_:Number = 0;
         while(param1 > 0)
         {
            _loc2_ += 0.125;
            param1 -= 0.125;
         }
         return _loc2_;
      }
      
      private function method_3119() : void
      {
         this.var_170.visible = false;
      }
      
      private function method_3121() : void
      {
         this.var_170.visible = true;
         if(this.var_3476.parent == null)
         {
            this.var_170.addChild(this.var_3476);
         }
         this.var_170.mask = this.var_2871;
      }
      
      override public function get width() : Number
      {
         return this.var_3476.width;
      }
   }
}
