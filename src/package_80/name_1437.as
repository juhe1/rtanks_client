package package_80
{
   import controls.InventoryIcon;
   import flash.utils.getTimer;
   import package_4.ClientObject;
   
   public class name_1437
   {
       
      
      private var id:int;
      
      private var _count:int;
      
      private var clientObject:ClientObject;
      
      private var icon:InventoryIcon;
      
      private var var_2285:int = -1;
      
      private var var_2286:int;
      
      private var itemEffectTime:int;
      
      private var var_2287:int;
      
      public function name_1437(param1:ClientObject, param2:int, param3:int, param4:int, param5:int)
      {
         super();
         this.clientObject = param1;
         this.id = param2;
         this.icon = new InventoryIcon(param2);
         this._count = param3;
         this.itemEffectTime = param4 * 1000;
         this.var_2287 = param5 * 1000;
         this.var_2286 = this.var_2287 + this.itemEffectTime;
      }
      
      public function name_1863() : ClientObject
      {
         return this.clientObject;
      }
      
      public function name_1444() : int
      {
         return this.id;
      }
      
      public function method_2322() : InventoryIcon
      {
         return this.icon;
      }
      
      public function method_2324(param1:int) : Number
      {
         if(this.var_2285 == -1)
         {
            return 1;
         }
         var _loc2_:Number = (param1 - this.var_2285) / this.var_2286;
         if(_loc2_ > 1)
         {
            _loc2_ = 1;
            this.name_1446();
         }
         return _loc2_;
      }
      
      public function name_1446() : void
      {
         this.var_2285 = -1;
      }
      
      public function method_2321(param1:int) : void
      {
         this.var_2285 = getTimer();
         this.var_2286 = param1;
      }
      
      public function set count(param1:int) : void
      {
         this._count = param1;
      }
      
      public function get count() : int
      {
         return this._count;
      }
      
      public function get method_2320() : int
      {
         return this.var_2286;
      }
      
      public function get method_2323() : int
      {
         return this.itemEffectTime;
      }
      
      public function get method_2319() : int
      {
         return this.var_2287;
      }
      
      public function name_1864() : Boolean
      {
         return this.var_2285 < 0 && this._count > 0;
      }
   }
}
