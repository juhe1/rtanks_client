package package_73
{
   import alternativa.engine3d.materials.TextureMaterial;
   import alternativa.engine3d.objects.Sprite3D;
   import alternativa.osgi.OSGi;
   import alternativa.physics.name_660;
   import alternativa.tanks.battle.BattleUtils;
   import alternativa.tanks.engine3d.AnimatedSprite3D;
   import alternativa.tanks.engine3d.name_1072;
   import alternativa.tanks.models.battlefield.name_83;
   import alternativa.tanks.models.weapon.name_2505;
   import alternativa.tanks.models.weapon.name_903;
   import alternativa.tanks.models.weapon.shotgun.PelletDirectionCalculator;
   import alternativa.tanks.models.weapon.shotgun.name_1247;
   import alternativa.tanks.sfx.AnimatedPlane;
   import alternativa.tanks.sfx.name_2500;
   import alternativa.tanks.sfx.name_657;
   import alternativa.tanks.vehicles.tanks.class_20;
   import flash.display.BlendMode;
   import package_161.name_515;
   import package_238.ObjectPool;
   import package_238.class_30;
   import package_240.name_656;
   import package_37.Vector3;
   import package_4.ClientObject;
   import package_42.TanksCollisionDetector;
   import package_42.name_73;
   import package_61.name_124;
   import package_68.name_175;
   import package_76.name_735;
   
   public class ShotgunShotEffect extends class_30 implements name_657
   {
      
      public static var battleService:name_83 = name_83(OSGi.getInstance().name_6(name_83));
      
      private static const const_498:Number = 16;
      
      private static const const_2331:Number = 270;
      
      private static const const_2333:Number = 100;
      
      private static const const_1496:Number = 1.3;
      
      private static const const_1494:Number = 400;
      
      private static const const_2324:Number = 150;
      
      private static const const_2325:Number = 2.5;
      
      private static const const_101:Number = 200;
      
      private static const const_2332:Number = 0.08;
      
      private static const const_2330:Number = 0.3;
      
      private static const const_2329:Number = 0.05;
      
      private static const const_2326:Number = 5000;
      
      private static const const_2327:Number = 6;
      
      private static const const_2328:Number = 0.2;
      
      private static const const_2334:Number = 30;
      
      private static const var_397:name_124 = new name_124();
      
      private static const var_2184:name_2505 = new name_2505();
      
      private static const const_2322:Vector3 = new Vector3();
      
      private static const const_2323:Vector3 = new Vector3();
      
      private static const const_2320:Vector3 = new Vector3();
      
      private static const const_2321:Vector3 = new Vector3();
       
      
      private var var_3098:AnimatedPlane;
      
      private var var_3096:AnimatedPlane;
      
      private var smoke:AnimatedSprite3D;
      
      private var var_3099:Vector.<name_3072>;
      
      private var var_3100:Vector.<name_3072>;
      
      private var var_3101:Vector.<Sprite3D>;
      
      private var name_1421:Vector3;
      
      private var var_3097:Vector3;
      
      private var time:Number = 0;
      
      private var var_170:name_175;
      
      private var var_2080:ShotgunSFXData;
      
      private var var_3102:Number;
      
      private var var_2081:Boolean = false;
      
      public function ShotgunShotEffect(param1:ObjectPool)
      {
         this.var_3098 = new AnimatedPlane(270,270,0,270 / 2,0);
         this.var_3096 = new AnimatedPlane(270,270,0,0,0);
         this.smoke = new AnimatedSprite3D(200,200);
         this.var_3099 = new Vector.<name_3072>();
         this.var_3100 = new Vector.<name_3072>();
         this.var_3101 = new Vector.<Sprite3D>();
         this.name_1421 = new Vector3();
         this.var_3097 = new Vector3();
         super(param1);
      }
      
      public function name_742(param1:name_175) : void
      {
         this.var_170 = param1;
         param1.addChild(this.var_3098);
         param1.addChild(this.var_3096);
         param1.addChild(this.smoke);
         var _loc2_:int = 0;
         while(_loc2_ < this.var_3099.length)
         {
            param1.addChild(this.var_3099[_loc2_]);
            _loc2_++;
         }
         var _loc3_:int = 0;
         while(_loc3_ < this.var_3101.length)
         {
            param1.addChild(this.var_3101[_loc3_]);
            _loc3_++;
         }
         var _loc4_:int = 0;
         while(_loc4_ < this.var_3100.length)
         {
            param1.addChild(this.var_3100[_loc4_]);
            _loc4_++;
         }
      }
      
      public function play(param1:int, param2:name_735) : Boolean
      {
         if(this.method_2869())
         {
            return false;
         }
         var _loc3_:Number = param1 / 1000;
         this.method_2883(param2);
         this.method_2881(param2,this.var_3099);
         this.method_2871(_loc3_);
         this.method_2874();
         if(this.time >= 0.05)
         {
            this.method_2870(param2,this.var_3100);
         }
         this.time += _loc3_;
         this.method_2878();
         return true;
      }
      
      private function method_2869() : Boolean
      {
         return this.var_3098.parent == null && this.var_3096.parent == null && this.smoke.parent == null && this.var_3099[0].parent == null && this.var_3101[0].parent == null && this.var_3100[0].parent == null;
      }
      
      private function method_2883(param1:name_735) : void
      {
         var _loc2_:Number = NaN;
         name_2500.name_3074(this.var_3098,param1.pos,this.var_3097,false,8,0.9);
         name_2500.name_3074(this.var_3096,param1.pos,this.var_3097,true,4,0.3);
         this.var_3098.setTime(this.time);
         var _loc3_:int = this.time * this.var_2080.var_2092.fps;
         if(_loc3_ == 5)
         {
            _loc2_ = 270 * 0.35;
            const_2322.copy(this.name_1421).addScaled(_loc2_,this.var_3097);
         }
         else if(_loc3_ >= 6)
         {
            _loc2_ = 270 * 0.5;
            const_2322.copy(this.name_1421).addScaled(_loc2_,this.var_3097);
         }
         else
         {
            const_2322.copy(this.name_1421);
         }
         name_2500.name_2503(this.var_3098,const_2322,this.var_3097,param1.pos);
         this.var_3096.setTime(this.time);
         _loc3_ = this.time * this.var_2080.var_2094.fps;
         _loc2_ = 0.1 * 270 + _loc3_ * 0.1 * 270;
         this.var_3096.x = this.name_1421.x + this.var_3097.x * _loc2_;
         this.var_3096.y = this.name_1421.y + this.var_3097.y * _loc2_;
         this.var_3096.z = this.name_1421.z + this.var_3097.z * _loc2_;
      }
      
      private function method_2881(param1:name_735, param2:Vector.<name_3072>) : void
      {
         var _loc3_:name_3072 = null;
         var _loc4_:Number = this.time / 0.3;
         for each(_loc3_ in param2)
         {
            this.method_2868(_loc3_,_loc4_,param1);
         }
      }
      
      private function method_2868(param1:name_3072, param2:Number, param3:name_735) : Number
      {
         var _loc4_:Number = NaN;
         _loc4_ = NaN;
         _loc4_ = param1.distance * param2;
         const_2323.copy(param1.position).addScaled(_loc4_,param1.direction);
         param1.alpha = 1 - 2 * Math.abs(0.5 - param2);
         name_2500.name_2503(param1,const_2323,param1.direction,param3.pos);
         param1.visible = true;
         return _loc4_;
      }
      
      private function method_2870(param1:name_735, param2:Vector.<name_3072>) : void
      {
         var _loc3_:name_3072 = null;
         var _loc4_:Number = (this.time - 0.05) / 0.3;
         for each(_loc3_ in param2)
         {
            if(!_loc3_.name_3073)
            {
               return;
            }
            this.method_2868(_loc3_,_loc4_,param1);
         }
      }
      
      private function method_2871(param1:Number) : void
      {
         var _loc2_:int = 0;
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         if(this.time > 0.08)
         {
            this.smoke.visible = true;
            _loc2_ = this.time * this.smoke.method_2318();
            this.smoke.name_1431(_loc2_);
            _loc3_ = this.time - 0.08;
            _loc4_ = Math.sqrt(_loc3_ / 1.3);
            if(this.var_3102 > 100)
            {
               _loc7_ = Math.min(this.var_3102 - 100,400);
               _loc5_ = 100 + _loc7_ * _loc4_;
            }
            else
            {
               _loc5_ = 0;
               this.smoke.visible = false;
            }
            this.smoke.x = this.name_1421.x + this.var_3097.x * _loc5_;
            this.smoke.y = this.name_1421.y + this.var_3097.y * _loc5_;
            this.smoke.z = this.name_1421.z + this.var_3097.z * _loc5_ + 150 * _loc4_;
            _loc6_ = 1 + (2.5 - 1) * _loc4_;
            this.smoke.scaleX = _loc6_;
            this.smoke.scaleY = _loc6_;
            this.smoke.scaleZ = _loc6_;
            this.smoke.alpha = Math.sin(_loc3_ * Math.PI / 1.3) * (this.var_2081 ? 0.5 : 1);
            this.smoke.rotation -= 0.3 * param1;
         }
         else
         {
            this.smoke.visible = false;
         }
      }
      
      private function method_2874() : void
      {
         var _loc1_:Sprite3D = null;
         var _loc2_:Number = (this.time - 0.05) / 0.2;
         _loc2_ *= _loc2_;
         var _loc3_:Number = 1 + (30 - 1) * _loc2_;
         for each(_loc1_ in this.var_3101)
         {
            _loc1_.scaleX = _loc3_;
            _loc1_.scaleY = _loc3_;
            _loc1_.scaleZ = _loc3_;
            _loc1_.alpha = 1 - _loc2_;
         }
      }
      
      private function method_2878() : void
      {
         var _loc1_:name_3072 = null;
         var _loc2_:name_3072 = null;
         var _loc3_:Sprite3D = null;
         if(this.time > 0.3)
         {
            for each(_loc1_ in this.var_3099)
            {
               this.var_170.removeChild(_loc1_);
            }
         }
         if(this.time > 0.3 + 0.05)
         {
            for each(_loc2_ in this.var_3100)
            {
               if(_loc2_.parent != null)
               {
                  this.var_170.removeChild(_loc2_);
               }
            }
         }
         if(this.time > this.var_3098.name_2329())
         {
            this.var_170.removeChild(this.var_3098);
         }
         if(this.time > this.var_3096.name_2329())
         {
            this.var_170.removeChild(this.var_3096);
         }
         if(this.time > 0.08 + 1.3)
         {
            this.var_170.removeChild(this.smoke);
         }
         if(this.time > 0.2)
         {
            for each(_loc3_ in this.var_3101)
            {
               this.var_170.removeChild(_loc3_);
            }
         }
      }
      
      public function destroy() : void
      {
         var _loc1_:int = 0;
         while(_loc1_ < this.var_3099.length)
         {
            this.var_3099[_loc1_].clear();
            _loc1_++;
         }
         var _loc2_:int = 0;
         while(_loc2_ < this.var_3100.length)
         {
            this.var_3100[_loc2_].clear();
            this.var_3100[_loc2_].visible = false;
            _loc2_++;
         }
         var _loc3_:int = 0;
         while(_loc3_ < this.var_3101.length)
         {
            this.var_3101[_loc3_].material = null;
            _loc3_++;
         }
         this.var_3096.clear();
         this.var_3098.clear();
         this.smoke.clear();
         method_584();
      }
      
      override protected function getClass() : Class
      {
         return ShotgunShotEffect;
      }
      
      public function get owner() : ClientObject
      {
         return null;
      }
      
      public function kill() : void
      {
         var _loc1_:int = 0;
         while(_loc1_ < this.var_3099.length)
         {
            this.var_170.removeChild(this.var_3099[_loc1_]);
            this.var_170.removeChild(this.var_3100[_loc1_]);
            this.var_170.removeChild(this.var_3101[_loc1_]);
            _loc1_++;
         }
         this.var_170.removeChild(this.var_3098);
         this.var_170.removeChild(this.var_3096);
         this.var_170.removeChild(this.smoke);
      }
      
      public function init(param1:name_1247, param2:name_903, param3:class_20, param4:Vector3, param5:ShotgunSFXData, param6:Boolean) : void
      {
         this.var_2080 = param5;
         this.var_2081 = param6;
         this.name_1421.copy(param2.name_1421);
         this.var_3097.copy(param2.direction);
         this.method_2885();
         this.method_2884();
         this.method_2877(param1,param2,param4,param3.method_456());
         this.time = 0;
      }
      
      private function method_2885() : void
      {
         this.var_3098.blendMode = BlendMode.ADD;
         var _loc1_:name_1072 = this.var_2080.var_2092;
         this.var_3098.init(_loc1_,_loc1_.fps);
         this.var_3098.shadowMapAlphaThreshold = 2;
         this.var_3098.useShadowMap = false;
         this.var_3098.depthMapAlphaThreshold = 2;
         this.var_3098.useLight = false;
         var _loc2_:name_1072 = this.var_2080.var_2094;
         this.var_3096.init(_loc2_,_loc2_.fps);
         this.var_3096.blendMode = BlendMode.ADD;
         this.var_3096.rotationX = Math.atan2(this.var_3097.z,Math.sqrt(this.var_3097.x * this.var_3097.x + this.var_3097.y * this.var_3097.y)) - Math.PI / 2;
         this.var_3096.rotationY = 0;
         this.var_3096.rotationZ = -Math.atan2(this.var_3097.x,this.var_3097.y);
         this.var_3096.shadowMapAlphaThreshold = 2;
         this.var_3096.useShadowMap = false;
         this.var_3096.depthMapAlphaThreshold = 2;
         this.var_3096.useLight = false;
      }
      
      private function method_2884() : void
      {
         this.smoke.name_1433(this.var_2080.smokeAnimation);
         this.smoke.name_1431(0);
         this.smoke.rotation = Math.random() * Math.PI * 2;
         this.smoke.shadowMapAlphaThreshold = 2;
         this.smoke.useShadowMap = false;
         this.smoke.depthMapAlphaThreshold = 2;
         this.smoke.useLight = false;
         this.smoke.softAttenuation = 130;
         this.var_3102 = 5000;
      }
      
      private function method_2877(param1:name_1247, param2:name_903, param3:Vector3, param4:name_660) : void
      {
         var _loc5_:Vector3 = null;
         var _loc6_:Vector.<Vector3> = this.method_2882(param1,param2,param3);
         var _loc7_:TanksCollisionDetector = battleService.getBattlefieldData().name_247;
         var_2184.name_2506 = param4;
         var _loc8_:name_515 = param1.name_1456();
         var _loc9_:Number = _loc8_.method_1242(param1.getObject()) * 100;
         while(this.var_3099.length < _loc6_.length)
         {
            this.method_2872();
         }
         var _loc10_:int = 0;
         while(_loc10_ < _loc6_.length)
         {
            _loc5_ = _loc6_[_loc10_];
            this.method_2873(_loc10_,_loc7_,_loc5_,param2.name_1422,_loc9_);
            _loc10_++;
         }
      }
      
      private function method_2882(param1:name_1247, param2:name_903, param3:Vector3) : Vector.<Vector3>
      {
         var _loc4_:PelletDirectionCalculator = param1.method_2196();
         _loc4_.next();
         return _loc4_.method_2237(param2.const_1614,param3);
      }
      
      private function method_2872() : void
      {
         this.var_3099.push(this.method_2867());
         this.var_3100.push(this.method_2867());
         var _loc1_:Sprite3D = new Sprite3D(0,0);
         _loc1_.blendMode = BlendMode.ADD;
         _loc1_.shadowMapAlphaThreshold = 2;
         _loc1_.useShadowMap = false;
         _loc1_.depthMapAlphaThreshold = 2;
         _loc1_.useLight = false;
         this.var_3101.push(_loc1_);
      }
      
      private function method_2867() : name_3072
      {
         var _loc1_:name_3072 = new name_3072();
         _loc1_.blendMode = BlendMode.ADD;
         _loc1_.shadowMapAlphaThreshold = 2;
         _loc1_.useShadowMap = false;
         _loc1_.depthMapAlphaThreshold = 2;
         _loc1_.useLight = false;
         return _loc1_;
      }
      
      private function method_2873(param1:int, param2:TanksCollisionDetector, param3:Vector3, param4:Vector3, param5:Number) : void
      {
         var _loc6_:Boolean = false;
         var _loc7_:Sprite3D = null;
         var _loc8_:Boolean = param2.raycast(param4,param3,name_73.WEAPON,param5,var_2184,var_397);
         var _loc9_:Number = 5000;
         var _loc10_:name_3072 = this.var_3099[param1];
         _loc10_.position.copy(this.name_1421);
         if(_loc8_)
         {
            _loc6_ = BattleUtils.name_1420(var_397.var_81.name_787);
            _loc10_.direction.vDiff(var_397.position,this.name_1421);
            _loc9_ = this.method_2876(param4,_loc9_,_loc10_,_loc6_);
            _loc10_.direction.normalize();
            _loc7_ = this.var_3101[param1];
            this.method_2865(_loc7_,var_397.position,param3);
            if(!_loc6_)
            {
               this.method_2880(param1,param3,_loc7_,param2);
            }
         }
         else
         {
            _loc10_.direction.copy(param3);
         }
         this.method_2866(_loc10_,_loc9_);
      }
      
      private function method_2880(param1:int, param2:Vector3, param3:Sprite3D, param4:TanksCollisionDetector) : void
      {
         var _loc5_:Boolean = false;
         const_2320.copy(var_397.position);
         const_2321.copy(var_397.normal);
         const_2321.scale(-2 * var_397.normal.vDot(param2)).add(param2);
         const_2320.addScaled(0.1,const_2321);
         var _loc6_:Number = 5000;
         var _loc7_:Boolean = param4.raycast(const_2320,const_2321,name_73.WEAPON,_loc6_,null,var_397);
         var _loc8_:name_3072 = this.var_3100[param1];
         _loc8_.name_3073 = true;
         _loc8_.position.copy(const_2320);
         if(_loc7_)
         {
            _loc8_.direction.vDiff(var_397.position,const_2320);
            _loc5_ = BattleUtils.name_1420(var_397.var_81.name_787);
            _loc6_ = this.method_2879(const_2320,_loc8_,_loc5_);
            _loc8_.direction.normalize();
            if(!_loc5_)
            {
               this.method_2875(const_2320,var_397.position);
            }
            else
            {
               this.method_2865(param3,var_397.position,const_2321);
            }
         }
         else
         {
            _loc8_.direction.copy(const_2321);
         }
         this.method_2866(_loc8_,_loc6_);
      }
      
      private function method_2876(param1:Vector3, param2:Number, param3:name_3072, param4:Boolean) : Number
      {
         var _loc5_:Number = param1.distanceTo(var_397.position);
         var _loc6_:Number = param1.distanceTo(this.name_1421);
         if(_loc5_ > _loc6_)
         {
            param2 = param3.direction.length();
         }
         else
         {
            param2 = 0;
         }
         if(!param4)
         {
            this.var_3102 = Math.min(param2,this.var_3102);
         }
         return param2;
      }
      
      private function method_2879(param1:Vector3, param2:name_3072, param3:Boolean) : Number
      {
         if(!param3)
         {
            return param2.direction.length();
         }
         return param1.distanceTo(var_397.position);
      }
      
      private function method_2866(param1:name_3072, param2:Number) : void
      {
         var _loc3_:Number = 3 + Math.random() * 8;
         var _loc4_:Number = 0.3 + Math.random() * 0.3;
         var _loc5_:Number = Math.min(Math.random() * 200,param2);
         var _loc6_:Number = Math.min(400 + Math.random() * 2100,param2);
         var _loc7_:Number = 300 + Math.random() * 500;
         if(_loc7_ + _loc6_ > param2)
         {
            _loc7_ = Math.max(0,param2 - _loc6_);
         }
         param1.init(_loc3_,_loc4_,_loc5_,_loc6_,_loc7_,this.var_2080.var_2091);
      }
      
      private function method_2865(param1:Sprite3D, param2:Vector3, param3:Vector3) : void
      {
         var _loc4_:Number = 6 + Math.random() * 6;
         var _loc5_:Number = _loc4_ / 2;
         param1.width = _loc4_;
         param1.height = _loc4_;
         param1.material = this.var_2080.var_2093;
         param1.x = param2.x - _loc5_ * param3.x;
         param1.y = param2.y - _loc5_ * param3.y;
         param1.z = param2.z - _loc5_ * param3.z;
         param1.rotation = Math.random() * Math.PI * 2;
         param1.visible = true;
      }
      
      private function method_2875(param1:Vector3, param2:Vector3) : void
      {
         var _loc3_:Vector.<TextureMaterial> = this.var_2080.var_2090;
         var _loc4_:int = Math.floor(Math.random() * _loc3_.length);
         battleService.getBattlefieldData().viewport.addDecal(param2,param1,16,_loc3_[_loc4_],name_656.const_1553);
      }
   }
}
