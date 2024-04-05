package package_430
{
   import flash.display.DisplayObject;
   import flash.geom.ColorTransform;
   import flash.utils.getTimer;
   
   public class name_2594 implements class_204
   {
      
      public static const const_2371:uint = 100;
      
      public static const const_2372:uint = 250;
       
      
      private var var_3147:int;
      
      private var var_3145:ColorTransform;
      
      private var var_3146:int;
      
      private var var_3150:DisplayObject;
      
      private var var_3149:Function;
      
      private var var_3148:uint;
      
      public function name_2594(param1:DisplayObject)
      {
         super();
         this.var_3150 = param1;
         this.init();
      }
      
      private function init() : void
      {
         this.var_3147 = name_3129.name_3130;
         this.var_3145 = new ColorTransform();
      }
      
      public function method_2328(param1:uint, param2:Function = null) : void
      {
         this.name_2595();
         this.var_3149 = param2;
         this.var_3148 = param1;
         this.var_3146 = getTimer();
         this.var_3147 = name_3129.SHOW;
      }
      
      public function name_2595() : void
      {
         if(this.var_3147 != name_3129.name_3130)
         {
            this.var_3147 = name_3129.name_3130;
            this.interpolate(this.var_3148,0);
         }
      }
      
      public function update(param1:int) : void
      {
         if(this.var_3147 == name_3129.name_3130)
         {
            return;
         }
         switch(this.var_3147)
         {
            case name_3129.SHOW:
               if(param1 < this.var_3146 + 100)
               {
                  this.interpolate(this.var_3148,(param1 - this.var_3146) / 100);
                  break;
               }
               this.interpolate(this.var_3148,1);
               this.var_3146 += 100 + 250;
               this.var_3147 = name_3129.const_2345;
               if(this.var_3149 != null)
               {
                  this.var_3149.apply();
                  this.var_3149 = null;
               }
               break;
            case name_3129.const_2345:
               if(param1 < this.var_3146)
               {
                  this.interpolate(this.var_3148,(this.var_3146 - param1) / 250);
               }
               else
               {
                  this.name_2595();
               }
         }
      }
      
      private function interpolate(param1:uint, param2:Number) : void
      {
         this.var_3145.redMultiplier = 1 - param2;
         this.var_3145.greenMultiplier = 1 - param2;
         this.var_3145.blueMultiplier = 1 - param2;
         this.var_3145.alphaMultiplier = 1 - param2;
         this.var_3145.redOffset = (param1 >> 24 & 255) * param2;
         this.var_3145.greenOffset = (param1 >> 16 & 255) * param2;
         this.var_3145.blueOffset = (param1 >> 8 & 255) * param2;
         this.var_3145.alphaOffset = (param1 & 255) * param2;
         this.var_3150.transform.colorTransform = this.var_3145;
      }
   }
}
