package controls.base
{
   import base.class_122;
   import controls.labels.name_2551;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.filters.DropShadowFilter;
   
   public class name_1890 extends class_181
   {
       
      
      protected var var_2224:Sprite;
      
      protected var var_2223:name_2551;
      
      public function name_1890()
      {
         this.var_2224 = new class_122();
         this.var_2223 = new name_2551();
         super();
         addChild(this.var_2224);
         this.var_2224.addChild(this.var_2223);
         this.method_2298(this.var_2223);
         this.var_2223.size = 14;
         this.var_2224.mouseEnabled = false;
         this.var_2224.filters = [new DropShadowFilter(1,45,0,0.7,1,1,1)];
      }
      
      public function name_1342(param1:String) : void
      {
         this.var_2223.text = param1;
         this.var_2223.x = (_width - this.var_2223.width) * 0.5;
      }
      
      override public function set width(param1:Number) : void
      {
         super.width = param1;
         this.var_2223.x = (_width - this.var_2223.width) * 0.5;
      }
      
      protected function method_2298(param1:DisplayObject) : void
      {
         param1.y = 15;
      }
      
      protected function method_2300(param1:DisplayObject, param2:DisplayObject) : void
      {
         param1.y = 8;
         param2.y = 25;
      }
      
      protected function method_2299(param1:DisplayObject, param2:DisplayObject, param3:DisplayObject) : void
      {
         param1.y = 3;
         param2.y = 16;
         param3.y = 28;
      }
   }
}
