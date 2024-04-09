package alternativa.physics
{
   import alternativa.physics.collision.name_166;
   import alternativa.physics.collision.CollisionPrimitive;
   import alternativa.tanks.utils.EncryptedNumberImpl;
   import alternativa.tanks.utils.EncryptedNumber;
   import alternativa.tanks.vehicles.tanks.Tank;
   import package_37.Matrix3;
   import package_37.Matrix4;
   import package_37.Vector3;
   import package_37.name_86;
   import package_61.name_767;
   
   public class Body
   {
      
      public static var var_303:Number = 0.997;
      
      public static var var_304:Number = 0.997;
      
      private static const const_58:Number = 1500;
      
      private static var var_297:Vector3 = new Vector3();
      
      private static var var_305:Vector3 = new Vector3();
       
      
      public var id:int;
      
      public var name:String;
      
      public var var_318:PhysicsScene;
      
      public var tank:Tank;
      
      public var var_317:Boolean = true;
      
      public var var_314:Boolean = false;
      
      public var var_313:int;
      
      public var var_319:Boolean = false;
      
      public var var_315:Boolean = false;
      
      public var var_308:name_767;
      
      public var postCollisionPredicate:name_166;
      
      public var state:name_886;
      
      public var var_299:name_886;
      
      public var var_301:Vector3;
      
      public var var_306:Vector3;
      
      public var material:name_888;
      
      public var mass:Number = 1;
      
      public var invMass:Number = 1;
      
      public var var_310:Matrix3;
      
      public var var_295:Matrix3;
      
      public var name_225:Matrix3;
      
      public var var_307:Vector3;
      
      private var var_312:Number = 600;
      
      private var var_311:Number = -1100;
      
      private var var_309:EncryptedNumber;
      
      public var var_316:int;
      
      public var var_302:name_887;
      
      public var var_294:Vector3;
      
      public var var_296:Vector3;
      
      public var var_298:Vector3;
      
      public var var_300:Vector3;
      
      public function Body(param1:Number, param2:Matrix3, param3:Number)
      {
         this.var_308 = new name_767();
         this.var_299 = new name_886();
         this.var_301 = new Vector3();
         this.var_306 = new Vector3();
         this.material = new name_888();
         this.var_310 = new Matrix3();
         this.var_295 = new Matrix3();
         this.name_225 = new Matrix3();
         this.var_294 = new Vector3();
         this.var_296 = new Vector3();
         this.var_307 = new Vector3();
         this.var_309 = new EncryptedNumberImpl(0);
         this.var_298 = new Vector3();
         this.var_300 = new Vector3();
         super();
         this.mass = param1;
         this.invMass = 1 / this.invMass;
         this.var_310.copy(param2);
         this.state = new name_886();
         this.var_309.name_894(param3);
      }
      
      public function method_443(param1:CollisionPrimitive, param2:Matrix4 = null) : void
      {
         if(param1 == null)
         {
            throw new ArgumentError("Primitive cannot be null");
         }
         if(this.var_302 == null)
         {
            this.var_302 = new name_887();
         }
         this.var_302.append(param1);
         param1.name_891(this,param2);
      }
      
      public function method_441(param1:CollisionPrimitive) : void
      {
         if(this.var_302 == null)
         {
            return;
         }
         param1.name_891(null);
         this.var_302.remove(param1);
         if(this.var_302.size == 0)
         {
            this.var_302 = null;
         }
      }
      
      public function interpolate(param1:Number, param2:Vector3, param3:name_86) : void
      {
         var _loc4_:Number = NaN;
         _loc4_ = 1 - param1;
         param2.x = this.var_299.position.x * _loc4_ + this.state.position.x * param1;
         param2.y = this.var_299.position.y * _loc4_ + this.state.position.y * param1;
         param2.z = this.var_299.position.z * _loc4_ + this.state.position.z * param1;
         param3.w = this.var_299.orientation.w * _loc4_ + this.state.orientation.w * param1;
         param3.x = this.var_299.orientation.x * _loc4_ + this.state.orientation.x * param1;
         param3.y = this.var_299.orientation.y * _loc4_ + this.state.orientation.y * param1;
         param3.z = this.var_299.orientation.z * _loc4_ + this.state.orientation.z * param1;
      }
      
      public function name_731(param1:Vector3) : void
      {
         this.state.position.vCopy(param1);
      }
      
      public function method_447(param1:Number, param2:Number, param3:Number) : void
      {
         this.state.position.reset(param1,param2,param3);
      }
      
      public function method_429(param1:Vector3) : void
      {
         this.state.name_187.vCopy(param1);
      }
      
      public function method_435(param1:Number, param2:Number, param3:Number) : void
      {
         this.state.name_187.reset(param1,param2,param3);
      }
      
      public function method_454(param1:Vector3) : void
      {
         this.state.name_181.vCopy(param1);
      }
      
      public function method_445(param1:Number, param2:Number, param3:Number) : void
      {
         this.state.name_181.reset(param1,param2,param3);
      }
      
      public function method_450(param1:name_86) : void
      {
         this.state.orientation.copy(param1);
      }
      
      public function method_434(param1:Number) : void
      {
         this.var_309.name_894(param1);
      }
      
      public function method_430(param1:Vector3, param2:Vector3, param3:Number) : void
      {
         var _loc5_:Number = NaN;
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         var _loc4_:Number = NaN;
         _loc5_ = NaN;
         _loc6_ = param3 * this.invMass;
         this.state.name_187.x += _loc6_ * param2.x;
         this.state.name_187.y += _loc6_ * param2.y;
         this.state.name_187.z += _loc6_ * param2.z;
         _loc4_ = (param1.y * param2.z - param1.z * param2.y) * param3;
         _loc5_ = (param1.z * param2.x - param1.x * param2.z) * param3;
         _loc7_ = (param1.x * param2.y - param1.y * param2.x) * param3;
         this.state.name_181.x += this.var_295.m00 * _loc4_ + this.var_295.m01 * _loc5_ + this.var_295.m02 * _loc7_;
         this.state.name_181.y += this.var_295.m10 * _loc4_ + this.var_295.m11 * _loc5_ + this.var_295.m12 * _loc7_;
         this.state.name_181.z += this.var_295.m20 * _loc4_ + this.var_295.m21 * _loc5_ + this.var_295.m22 * _loc7_;
      }
      
      public function method_455(param1:Vector3, param2:Vector3, param3:Number) : void
      {
         var _loc5_:Number = NaN;
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         var _loc4_:Number = NaN;
         _loc5_ = NaN;
         _loc6_ = param3 * this.invMass;
         this.var_298.x += _loc6_ * param2.x;
         this.var_298.y += _loc6_ * param2.y;
         this.var_298.z += _loc6_ * param2.z;
         _loc4_ = (param1.y * param2.z - param1.z * param2.y) * param3;
         _loc7_ = (param1.z * param2.x - param1.x * param2.z) * param3;
         _loc5_ = (param1.x * param2.y - param1.y * param2.x) * param3;
         this.var_300.x += this.var_295.m00 * _loc4_ + this.var_295.m01 * _loc7_ + this.var_295.m02 * _loc5_;
         this.var_300.y += this.var_295.m10 * _loc4_ + this.var_295.m11 * _loc7_ + this.var_295.m12 * _loc5_;
         this.var_300.z += this.var_295.m20 * _loc4_ + this.var_295.m21 * _loc7_ + this.var_295.m22 * _loc5_;
      }
      
      public function method_433(param1:Vector3) : void
      {
         this.var_294.add(param1);
      }
      
      public function method_444(param1:Vector3, param2:Number) : void
      {
         this.var_294.addScaled(param2,param1);
      }
      
      public function method_439(param1:Number, param2:Number, param3:Number) : void
      {
         this.var_294.x += param1;
         this.var_294.y += param2;
         this.var_294.z += param3;
      }
      
      public function method_437(param1:Number, param2:Number, param3:Number, param4:Number, param5:Number, param6:Number) : void
      {
         var _loc8_:Number = NaN;
         var _loc9_:Number = NaN;
         this.var_294.x += param4;
         this.var_294.y += param5;
         this.var_294.z += param6;
         var _loc7_:Vector3 = this.state.position;
         _loc8_ = param1 - _loc7_.x;
         _loc9_ = param2 - _loc7_.y;
         var _loc10_:Number = param3 - _loc7_.z;
         this.var_296.x += _loc9_ * param6 - _loc10_ * param5;
         this.var_296.y += _loc10_ * param4 - _loc8_ * param6;
         this.var_296.z += _loc8_ * param5 - _loc9_ * param4;
      }
      
      public function method_452(param1:Vector3, param2:Vector3) : void
      {
         this.var_294.add(param2);
         this.var_296.add(var_297.vDiff(param1,this.state.position).vCross(param2));
      }
      
      public function method_432(param1:Vector3, param2:Vector3, param3:Number) : void
      {
         var _loc5_:Number = NaN;
         var _loc6_:Number = NaN;
         var _loc4_:Number = NaN;
         _loc5_ = param3 * param2.x;
         _loc6_ = param3 * param2.y;
         var _loc7_:Number = param3 * param2.z;
         this.var_294.x += _loc5_;
         this.var_294.y += _loc6_;
         this.var_294.z += _loc7_;
         var _loc8_:Vector3 = this.state.position;
         var _loc9_:Number = param1.x - _loc8_.x;
         var _loc10_:Number = param1.y - _loc8_.y;
         _loc4_ = param1.z - _loc8_.z;
         this.var_296.x += _loc10_ * _loc7_ - _loc4_ * _loc6_;
         this.var_296.y += _loc4_ * _loc5_ - _loc9_ * _loc7_;
         this.var_296.z += _loc9_ * _loc6_ - _loc10_ * _loc5_;
      }
      
      public function method_453(param1:Vector3, param2:Vector3) : void
      {
         this.name_225.name_890(param1,var_297);
         this.name_225.name_890(param2,var_305);
         this.var_294.add(var_305);
         this.var_296.add(var_297.vCross(var_305));
      }
      
      public function method_451(param1:Vector3, param2:Vector3) : void
      {
         this.name_225.name_890(param1,var_297);
         this.var_294.add(param2);
         this.var_296.add(var_297.vCross(param2));
      }
      
      public function method_442(param1:Vector3) : void
      {
         this.var_296.add(param1);
      }
      
      public function name_233() : void
      {
         this.var_294.x = this.var_294.y = this.var_294.z = 0;
         this.var_296.x = this.var_296.y = this.var_296.z = 0;
      }
      
      public function method_448() : void
      {
         this.var_301.x = this.var_294.x * this.invMass;
         this.var_301.y = this.var_294.y * this.invMass;
         this.var_301.z = this.var_294.z * this.invMass;
         this.var_306.x = this.var_295.m00 * this.var_296.x + this.var_295.m01 * this.var_296.y + this.var_295.m02 * this.var_296.z;
         this.var_306.y = this.var_295.m10 * this.var_296.x + this.var_295.m11 * this.var_296.y + this.var_295.m12 * this.var_296.z;
         this.var_306.z = this.var_295.m20 * this.var_296.x + this.var_295.m21 * this.var_296.y + this.var_295.m22 * this.var_296.z;
      }
      
      public function method_438() : void
      {
         var _loc1_:name_889 = null;
         var _loc2_:CollisionPrimitive = null;
         this.state.orientation.toMatrix3(this.name_225);
         this.var_295.copy(this.var_310).append(this.name_225).name_896(this.name_225);
         if(this.var_302 != null)
         {
            this.var_308.name_897();
            _loc1_ = this.var_302.head;
            while(_loc1_ != null)
            {
               _loc2_ = _loc1_.name_899;
               _loc2_.transform.setFromMatrix3(this.name_225,this.state.position);
               if(_loc2_.name_892 != null)
               {
                  _loc2_.transform.name_901(_loc2_.name_892);
               }
               _loc2_.calculateAABB();
               this.var_308.name_902(_loc2_.var_308);
               _loc1_ = _loc1_.next;
            }
         }
      }
      
      public function method_440() : void
      {
         this.var_299.copy(this.state);
      }
      
      public function method_449() : void
      {
         this.state.copy(this.var_299);
      }
      
      public function method_431(param1:Number) : void
      {
         this.method_428(param1);
         this.method_427(param1);
      }
      
      private function method_428(param1:Number) : void
      {
         var _loc2_:Number = NaN;
         this.var_307.copy(this.state.name_187);
         if(this.var_301.z < this.var_311)
         {
            this.var_301.z = this.var_311;
         }
         this.state.name_187 = this.state.name_187.clone();
         this.state.name_187.x += this.var_301.x * param1;
         this.state.name_187.y += this.var_301.y * param1;
         this.state.name_187.z += this.var_301.z * param1;
         this.state.name_187.x *= var_303;
         this.state.name_187.y *= var_303;
         this.state.name_187.z *= var_303;
         var _loc3_:Number = Math.abs(this.state.name_187.z);
         if(_loc3_ > 1500)
         {
            this.state.name_187.z *= 1500 / _loc3_;
         }
         if(this.state.name_187.z - this.var_307.z > this.var_312)
         {
            this.state.name_187.z = this.var_307.z + this.var_312;
         }
         var _loc4_:Number = this.state.name_187.x;
         var _loc5_:Number = this.state.name_187.y;
         var _loc6_:Number = Math.sqrt(_loc4_ * _loc4_ + _loc5_ * _loc5_);
         var _loc7_:Number = Number(this.var_309.name_900());
         if(_loc6_ > _loc7_)
         {
            _loc2_ = _loc7_ / _loc6_;
            this.state.name_187.x *= _loc2_;
            this.state.name_187.y *= _loc2_;
         }
      }
      
      private function method_427(param1:Number) : void
      {
         this.state.name_181.x += this.var_306.x * param1;
         this.state.name_181.y += this.var_306.y * param1;
         this.state.name_181.z += this.var_306.z * param1;
         this.state.name_181.x *= var_304;
         this.state.name_181.y *= var_304;
         this.state.name_181.z *= var_304;
         if(this.state.name_181.length() > 10)
         {
            this.state.name_181.setLength(10);
         }
      }
      
      public function method_436(param1:Number) : void
      {
         var _loc2_:Vector3 = new Vector3();
         var _loc3_:Vector3 = this.state.position;
         var _loc4_:Vector3 = this.state.name_187;
         _loc2_.x = _loc3_.x + _loc4_.x * param1;
         _loc2_.y = _loc3_.y + _loc4_.y * param1;
         _loc2_.z = _loc3_.z + _loc4_.z * param1;
         this.state.position = _loc2_;
         this.state.orientation.name_895(this.state.name_181,param1);
      }
      
      public function method_446(param1:Number) : void
      {
         this.state.position.x += this.var_298.x * param1;
         this.state.position.y += this.var_298.y * param1;
         this.state.position.z += this.var_298.z * param1;
         this.state.orientation.name_895(this.var_300,param1);
         this.var_298.reset();
         this.var_300.reset();
      }
   }
}
