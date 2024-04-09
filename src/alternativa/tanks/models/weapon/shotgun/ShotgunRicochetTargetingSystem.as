package alternativa.tanks.models.weapon.shotgun
{
   import alternativa.osgi.OSGi;
   import alternativa.physics.collision.name_1160;
   import alternativa.physics.Body;
   import alternativa.tanks.battle.BattleUtils;
   import alternativa.tanks.models.battlefield.IBattleField;
   import alternativa.tanks.models.weapon.WeaponObject;
   import alternativa.tanks.models.weapon.name_2505;
   import alternativa.tanks.models.weapon.name_903;
   import alternativa.tanks.models.weapon.shared.name_653;
   import alternativa.tanks.vehicles.tanks.Tank;
   import package_167.name_1454;
   import package_37.Matrix3;
   import package_37.Vector3;
   import package_42.TanksCollisionDetector;
   import package_42.name_73;
   import package_52.WeaponsManager;
   import package_61.RayHit;
   import package_63.name_162;
   import package_67.Vector3d;
   import projects.tanks.client.battlefield.models.tankparts.weapons.common.name_1378;
   
   public class ShotgunRicochetTargetingSystem implements name_1160
   {
      
      public static var battleService:IBattleField = IBattleField(OSGi.getInstance().getService(IBattleField));
      
      private static const const_1855:Number = 458.3662361046586;
      
      private static const const_1856:Number = 90;
      
      private static const var_397:RayHit = new RayHit();
      
      private static const const_1854:Vector3 = new Vector3();
      
      private static const var_1724:Vector3 = new Vector3();
      
      private static const hitPoint:Vector3 = new Vector3();
      
      private static const direction:Vector3 = new Vector3();
      
      private static const matrix:Matrix3 = new Matrix3();
       
      
      private var maxDistance:Number;
      
      private var var_689:name_653;
      
      private var var_2185:int;
      
      private var var_2183:Body;
      
      private var name_247:TanksCollisionDetector;
      
      private var var_2189:int;
      
      private var var_2178:Vector.<name_2504>;
      
      private var var_2190:PelletDirectionCalculator;
      
      private var var_2184:name_2505;
      
      private var var_2186:Vector.<int>;
      
      private var var_2181:name_1454;
      
      private var var_2182:Number;
      
      private var var_2188:int;
      
      private var var_2187:int;
      
      public function ShotgunRicochetTargetingSystem(param1:WeaponObject, param2:PelletDirectionCalculator, param3:name_162)
      {
         this.var_2184 = new name_2505();
         super();
         this.var_2184.name_2506 = this.var_2183;
         this.var_2181 = WeaponsManager.var_495[param1.getObject().id];
         this.maxDistance = param1.name_1456().method_1242(param1.getObject()) * 100;
         this.var_689 = battleService.method_154();
         this.name_247 = battleService.getBattlefieldData().name_247;
         this.var_2190 = param2;
         this.var_2189 = 1;
         this.var_2187 = method_2238(this.var_2181.name_1618.value,param1) + method_2238(this.var_2181.name_1614.value,param1) + 1;
         this.var_2178 = new Vector.<name_2504>(this.var_2187);
         this.var_2182 = (this.var_2181.name_1618.value + this.var_2181.name_1614.value) / (method_2238(this.var_2181.name_1618.value,param1) + method_2238(this.var_2181.name_1614.value,param1));
         this.var_2188 = param3.coneVerticalAngle / this.var_2182;
         this.var_2186 = new Vector.<int>(this.var_2188);
      }
      
      private static function method_2238(param1:Number, param2:WeaponObject) : int
      {
         return Math.ceil(param1 * 458.3662361046586);
      }
      
      public static function method_2245(param1:Number) : Number
      {
         return Math.min(458.3662361046586,1 / (2 * Math.atan(90 / (2 * param1))));
      }
      
      public function considerBody(param1:Body) : Boolean
      {
         return this.var_2183 != param1 || this.var_2185 > 0;
      }
      
      public function name_1453(param1:name_903, param2:Body, param3:Vector3) : Vector.<name_1378>
      {
         var _loc4_:Number = NaN;
         var _loc5_:name_2504 = null;
         param3.copy(param1.direction);
         this.var_2183 = param2;
         var _loc6_:int = 0;
         var _loc7_:Number = -this.var_2181.name_1618.value;
         direction.copy(param1.direction);
         matrix.name_1097(param1.const_1614,-this.var_2181.name_1618.value);
         direction.transform3(matrix);
         matrix.name_1097(param1.const_1614,this.var_2182);
         while(_loc7_ < this.var_2181.name_1614.value + this.var_2182 && _loc6_ < this.var_2187)
         {
            _loc4_ = this.method_2243(param1.name_1422,direction,_loc7_);
            _loc5_ = this.var_2178[_loc6_];
            if(_loc5_ == null)
            {
               _loc5_ = new name_2504(direction,_loc4_);
            }
            else
            {
               _loc5_.init(direction,_loc4_);
            }
            this.var_2178[_loc6_] = _loc5_;
            _loc6_++;
            _loc7_ += this.var_2182;
            direction.transform3(matrix);
         }
         this.method_2244(param3);
         var _loc8_:Vector.<name_1378> = new Vector.<name_1378>();
         this.method_2242(param3,param1,_loc8_);
         return _loc8_;
      }
      
      private function method_2243(param1:Vector3, param2:Vector3, param3:Number) : Number
      {
         var _loc4_:Body = null;
         this.var_2185 = 0;
         const_1854.copy(param1);
         var_1724.copy(param2);
         var _loc5_:Number = this.maxDistance;
         while(_loc5_ > 0)
         {
            if(!this.name_247.raycast(const_1854,var_1724,name_73.WEAPON,_loc5_,this,var_397))
            {
               return 0;
            }
            _loc5_ -= var_397.t;
            if(_loc5_ < 0)
            {
               _loc5_ = 0;
            }
            _loc4_ = var_397.var_81.name_787;
            if(_loc4_.tank != null && _loc4_ != this.var_2183)
            {
               return this.method_2241(_loc4_,_loc5_,param3);
            }
            if(_loc4_.tank != null)
            {
               return 0;
            }
            if(!this.method_2240())
            {
               return 0;
            }
         }
         return 0;
      }
      
      private function method_2241(param1:Body, param2:Number, param3:Number) : Number
      {
         var _loc4_:Number = this.maxDistance - param2;
         return this.var_689.method_960(param1,_loc4_,param3);
      }
      
      private function method_2240() : Boolean
      {
         var _loc1_:Vector3 = null;
         if(this.var_2185 < this.var_2189)
         {
            ++this.var_2185;
            _loc1_ = var_397.normal;
            var_1724.addScaled(-2 * var_1724.vDot(_loc1_),_loc1_);
            const_1854.copy(var_397.position).addScaled(0.5,_loc1_);
            return true;
         }
         return false;
      }
      
      private function method_2244(param1:Vector3) : void
      {
         var _loc2_:Number = NaN;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:Number = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         while(_loc8_ < this.var_2178.length)
         {
            _loc2_ = 0;
            _loc3_ = this.var_2188 / 2;
            _loc4_ = -_loc3_;
            while(_loc4_ <= _loc3_)
            {
               _loc5_ = _loc8_ + _loc4_;
               if(_loc5_ >= 0 && _loc5_ < this.var_2178.length)
               {
                  _loc2_ += this.var_2178[_loc5_].name_2507();
               }
               _loc4_++;
            }
            if(_loc6_ < _loc2_)
            {
               _loc6_ = _loc2_;
               _loc7_ = 0;
               this.var_2186[_loc7_] = _loc8_;
            }
            else if(_loc2_ == _loc6_ && _loc2_ > 0)
            {
               _loc7_++;
               this.var_2186[_loc7_] = _loc8_;
            }
            _loc8_++;
         }
         var _loc9_:name_2504 = this.var_2178[this.var_2186[_loc7_ >> 1]];
         if(_loc9_.name_2507() > 0)
         {
            param1.copy(_loc9_.name_1755());
         }
      }
      
      private function method_2242(param1:Vector3, param2:name_903, param3:Vector.<name_1378>) : void
      {
         var _loc4_:Vector3 = null;
         var _loc5_:Vector.<Vector3> = this.var_2190.method_2237(param2.const_1614,param1.clone());
         param3.length = 0;
         for each(param1 in _loc5_)
         {
            this.var_2184.name_2506 = this.var_2183;
            var_1724.copy(param1);
            if(!this.method_2239(param2.name_1422,param1,this.maxDistance,param3))
            {
               _loc4_ = var_397.normal;
               param1.addScaled(-2 * param1.vDot(_loc4_),_loc4_);
               const_1854.copy(var_397.position).addScaled(0.5,_loc4_);
               this.var_2184.name_2506 = null;
               this.method_2239(const_1854,param1,this.maxDistance,param3);
            }
         }
      }
      
      private function method_2239(param1:Vector3, param2:Vector3, param3:Number, param4:Vector.<name_1378>) : Boolean
      {
         var _loc5_:Vector3 = null;
         var _loc6_:Vector3d = null;
         var _loc7_:Tank = null;
         if(this.name_247.raycast(param1,param2,name_73.WEAPON,param3,this.var_2184,var_397))
         {
            _loc7_ = var_397.var_81.name_787.tank;
            hitPoint.copy(param1).addScaled(var_397.t,param2);
            if(_loc7_ != null)
            {
               _loc5_ = BattleUtils.var_351;
               _loc6_ = new Vector3d();
               _loc5_.copy(var_397.position);
               BattleUtils.globalToLocal(var_397.var_81.name_787,_loc5_);
               BattleUtils.copyToVector3d(_loc5_,_loc6_);
               param4.push(new name_1378(param2.toVector3d(),_loc7_.state.position.toVector3d(),_loc7_,_loc7_.turretDir,_loc6_));
               return true;
            }
         }
         return false;
      }
   }
}
