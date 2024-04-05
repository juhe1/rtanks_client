package package_429
{
   import alternativa.tanks.models.battlefield.gui.inventory.name_2589;
   import flash.utils.getTimer;
   import package_430.class_204;
   
   public class name_2596
   {
      
      public static const const_2458:Number = 0.1;
      
      public static const const_2457:Number = 0.1;
      
      public static const const_2456:Number = 300;
       
      
      private var var_3158:name_3176;
      
      private var var_3159:name_3177;
      
      private var var_2290:name_2589;
      
      private var var_3160:Function;
      
      private var var_3161:Function;
      
      public function name_2596(param1:int, param2:name_2590, param3:name_2590, param4:class_204, param5:name_2589, param6:Function, param7:Function, param8:Boolean = true)
      {
         super();
         this.var_2290 = param5;
         this.var_3160 = param6;
         this.var_3161 = param7;
         this.init(param1,param2,param3,param4,param8);
      }
      
      private function init(param1:int, param2:name_2590, param3:name_2590, param4:class_204, param5:Boolean) : void
      {
         this.var_3158 = new name_3176(param1,this.var_2290,param2,param4,this.var_3160,this.method_2922,param5);
         this.var_3159 = new name_3177(param1,param3,param4,this.method_2919,this.method_2920);
      }
      
      private function method_2919() : void
      {
         if(!this.var_3158.name_1399)
         {
            this.var_3160.apply();
         }
      }
      
      private function method_2922() : void
      {
         this.var_2290.state = name_2589.const_2375;
      }
      
      private function method_2920() : void
      {
         if(!this.var_3158.name_1399)
         {
            this.var_3161.apply();
         }
      }
      
      public function method_994(param1:int) : void
      {
         this.var_3159.activate(getTimer(),param1,this.var_3158.name_1399,false);
      }
      
      public function method_997(param1:int, param2:Boolean) : void
      {
         this.var_3158.name_3178(getTimer(),param1,param2);
      }
      
      public function method_2917() : void
      {
         this.var_3159.method_2917();
         this.var_3158.method_2917();
      }
      
      public function method_2924(param1:int) : void
      {
         this.var_3159.name_3178(getTimer(),param1,this.var_3158.name_1399,true);
      }
      
      public function destroy() : void
      {
         this.var_3158.destroy();
         this.var_3159.destroy();
      }
      
      public function name_1864() : Boolean
      {
         return !this.var_3158.name_1399 && !this.var_3159.name_1399;
      }
      
      public function name_1399() : Boolean
      {
         return !this.name_1864();
      }
      
      public function name_2599() : Boolean
      {
         return this.var_3158.name_1399;
      }
      
      public function name_2597() : Boolean
      {
         return this.var_3159.name_1399;
      }
      
      public function update(param1:int) : void
      {
         if(!this.var_3158.name_1399 && !this.var_3159.name_1399)
         {
            return;
         }
         this.var_3158.update(param1);
         this.var_3159.update(param1,this.var_3158.method_287());
      }
      
      public function method_2918() : void
      {
         this.var_3158.method_2918();
      }
      
      public function method_2921(param1:int) : void
      {
         this.var_3159.method_2921(param1);
      }
      
      public function method_2923(param1:Boolean) : void
      {
         this.var_3159.name_3179(param1);
      }
   }
}
