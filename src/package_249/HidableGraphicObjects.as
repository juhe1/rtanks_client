package package_249
{
   import alternativa.tanks.models.battlefield.name_1229;
   import package_37.Vector3;
   
   public class HidableGraphicObjects implements name_1229
   {
      
      private static const const_1560:Vector3 = new Vector3();
       
      
      private var var_1400:Number;
      
      private const center:Vector3 = new Vector3();
      
      private const objects:Vector.<name_2069> = new Vector.<name_2069>();
      
      private var numObjects:int;
      
      private var enabled:Boolean = false;
      
      public function HidableGraphicObjects()
      {
         super();
      }
      
      public function add(param1:name_2069) : void
      {
         if(this.objects.indexOf(param1) < 0)
         {
            var _loc2_:* = this.numObjects++;
            this.objects[_loc2_] = param1;
         }
      }
      
      public function remove(param1:name_2069) : void
      {
         var _loc2_:int = this.objects.indexOf(param1);
         if(_loc2_ >= 0)
         {
            param1.name_2070(1);
            --this.numObjects;
            this.objects[_loc2_] = this.objects[this.numObjects];
            this.objects[this.numObjects] = null;
         }
      }
      
      public function name_1257(param1:Vector3, param2:Number) : void
      {
         this.center.vCopy(param1);
         this.var_1400 = param2 * param2;
      }
      
      public function name_1240() : void
      {
         var _loc1_:name_2069 = null;
         var _loc2_:int = 0;
         while(_loc2_ < this.numObjects)
         {
            _loc1_ = this.objects[_loc2_];
            _loc1_.name_2070(1);
            _loc2_++;
         }
      }
      
      public function render(param1:int, param2:int) : void
      {
         var _loc3_:name_2069 = null;
         var _loc4_:int = 0;
         while(_loc4_ < this.numObjects)
         {
            _loc3_ = this.objects[_loc4_];
            _loc3_.name_962(const_1560);
            _loc3_.name_2070(this.method_1623(const_1560));
            _loc4_++;
         }
      }
      
      private function method_1623(param1:Vector3) : Number
      {
         var _loc2_:Number = param1.x - this.center.x;
         var _loc3_:Number = param1.y - this.center.y;
         var _loc4_:Number = param1.z - this.center.z;
         var _loc5_:Number = _loc2_ * _loc2_ + _loc3_ * _loc3_ + _loc4_ * _loc4_;
         if(_loc5_ < this.var_1400)
         {
            return Math.sqrt(_loc5_ / this.var_1400);
         }
         return 1;
      }
      
      public function clear() : void
      {
         this.objects.length = 0;
         this.numObjects = 0;
      }
      
      public function enable() : void
      {
         this.enabled = true;
      }
      
      public function method_1624() : void
      {
         this.enabled = false;
      }
      
      public function var_466() : Boolean
      {
         return this.enabled;
      }
   }
}
