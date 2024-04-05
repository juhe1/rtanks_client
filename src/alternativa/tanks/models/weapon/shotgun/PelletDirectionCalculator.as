package alternativa.tanks.models.weapon.shotgun
{
   import package_37.Vector3;
   import package_63.name_162;
   
   public class PelletDirectionCalculator
   {
      
      private static const const_1852:Vector3 = new Vector3();
      
      private static const const_1853:Vector3 = new Vector3();
       
      
      private var var_2178:Vector.<Vector3>;
      
      private var result:Vector.<Vector3>;
      
      private var params:name_162;
      
      private var var_2179:Number;
      
      private var var_2180:Number;
      
      public function PelletDirectionCalculator(param1:name_162)
      {
         super();
         this.var_2179 = Math.tan(param1.coneHorizontalAngle * 0.5);
         this.var_2180 = Math.tan(param1.coneVerticalAngle * 0.5);
         this.params = param1;
         this.var_2178 = new Vector.<Vector3>(param1.pelletCount,true);
         this.result = new Vector.<Vector3>(param1.pelletCount,true);
         var _loc2_:int = 0;
         while(_loc2_ < this.var_2178.length)
         {
            this.var_2178[_loc2_] = new Vector3();
            this.result[_loc2_] = new Vector3();
            _loc2_++;
         }
      }
      
      public function next() : void
      {
         var _loc1_:int = 0;
         while(_loc1_ < this.var_2178.length)
         {
            this.method_2236(this.var_2178[_loc1_]);
            _loc1_++;
         }
      }
      
      private function method_2236(param1:Vector3) : void
      {
         var _loc2_:Number = Math.random();
         var _loc3_:Number = Math.random() * Math.PI * 2;
         param1.x = Math.cos(_loc3_) * _loc2_ * this.var_2179;
         param1.y = Math.sin(_loc3_) * _loc2_ * this.var_2180;
      }
      
      public function method_2237(param1:Vector3, param2:Vector3) : Vector.<Vector3>
      {
         var _loc3_:Vector3 = null;
         this.method_2234(param1,param2);
         var _loc4_:int = 0;
         while(_loc4_ < this.var_2178.length)
         {
            _loc3_ = this.var_2178[_loc4_];
            this.method_2235(_loc3_.x,_loc3_.y,param2,this.result[_loc4_]);
            _loc4_++;
         }
         return this.result;
      }
      
      private function method_2235(param1:Number, param2:Number, param3:Vector3, param4:Vector3) : void
      {
         param4.reset();
         param4.addScaled(param1,const_1852);
         param4.addScaled(param2,const_1853);
         param4.add(param3);
         param4.normalize();
      }
      
      private function method_2234(param1:Vector3, param2:Vector3) : void
      {
         const_1852.copy(param1);
         const_1853.cross2(const_1852,param2).normalize();
      }
   }
}
