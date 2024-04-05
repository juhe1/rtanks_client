package alternativa.tanks.models.sfx
{
   public class name_2330
   {
       
      
      private var var_3029:Number;
      
      private var var_3027:Number;
      
      private var var_2607:uint;
      
      private var var_3028:Number;
      
      private var const_367:int;
      
      public function name_2330(param1:Number = 0, param2:Number = 0, param3:uint = 0, param4:Number = 0, param5:int = 0)
      {
         super();
         this.var_3029 = param1;
         this.var_3027 = param2;
         this.var_2607 = param3;
         this.var_3028 = param4;
         this.const_367 = param5;
      }
      
      public function get attenuationBegin() : Number
      {
         return this.var_3029;
      }
      
      public function set attenuationBegin(param1:Number) : void
      {
         this.var_3029 = param1;
      }
      
      public function get attenuationEnd() : Number
      {
         return this.var_3027;
      }
      
      public function set attenuationEnd(param1:Number) : void
      {
         this.var_3027 = param1;
      }
      
      public function get color() : uint
      {
         return this.var_2607;
      }
      
      public function set color(param1:uint) : void
      {
         this.var_2607 = param1;
      }
      
      public function get intensity() : Number
      {
         return this.var_3028;
      }
      
      public function set intensity(param1:Number) : void
      {
         this.var_3028 = param1;
      }
      
      public function get time() : int
      {
         return this.const_367;
      }
      
      public function set time(param1:int) : void
      {
         this.const_367 = param1;
      }
      
      public function toString() : String
      {
         var _loc1_:String = "LightingEfectRecord [";
         _loc1_ += "attenuationBegin = " + this.attenuationBegin + " ";
         _loc1_ += "attenuationEnd = " + this.attenuationEnd + " ";
         _loc1_ += "color = " + this.color + " ";
         _loc1_ += "intensity = " + this.intensity + " ";
         _loc1_ += "time = " + this.time + " ";
         return _loc1_ + "]";
      }
   }
}
