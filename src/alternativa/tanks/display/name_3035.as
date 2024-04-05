package alternativa.tanks.display
{
   import flash.display.Sprite;
   import utils.name_2893;
   
   public class name_3035 extends Sprite
   {
       
      
      private var size:Number;
      
      private var var_3549:Number;
      
      private var var_2871:name_2893;
      
      public function name_3035(param1:int, param2:Number, param3:uint, param4:Number)
      {
         super();
         this.size = param1;
         this.var_3549 = param2;
         this.method_3180(param3,param4);
         this.var_2871 = new name_2893(param1);
         addChild(this.var_2871);
         mask = this.var_2871;
      }
      
      private function method_3180(param1:uint, param2:Number) : void
      {
         graphics.clear();
         graphics.beginFill(param1,param2);
         graphics.drawRoundRect(0,0,this.size,this.size,this.var_3549);
         graphics.endFill();
      }
      
      public function method_284(param1:Number) : void
      {
         this.var_2871.method_284(1 - param1,1);
      }
      
      public function name_2552(param1:uint, param2:Number) : void
      {
         this.method_3180(param1,param2);
      }
   }
}
