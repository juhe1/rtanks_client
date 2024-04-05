package package_360
{
   import alternativa.engine3d.core.Object3D;
   import alternativa.physics.collision.name_1083;
   import alternativa.physics.name_660;
   import alternativa.tanks.models.weapon.shared.StreamWeaponParticle;
   import alternativa.tanks.sfx.name_2500;
   import alternativa.tanks.sfx.name_657;
   import alternativa.tanks.utils.name_1388;
   import alternativa.tanks.utils.name_1391;
   import flash.geom.ColorTransform;
   import flash.utils.getTimer;
   import package_159.name_1594;
   import package_238.ObjectPool;
   import package_238.class_30;
   import package_37.Matrix3;
   import package_37.Matrix4;
   import package_37.Vector3;
   import package_4.ClientObject;
   import package_42.name_73;
   import package_61.name_124;
   import package_68.name_175;
   import package_76.name_735;
   
   public class StreamWeaponGraphicEffect extends class_30 implements name_657
   {
      
      private static const const_442:name_1391 = new name_1388(1000);
      
      private static const const_2017:Number = 1.1;
      
      private static const const_2013:int = 50;
      
      private static const const_2016:Number = 0.8;
      
      private static const const_2012:Number = 0.6;
      
      private static const const_2014:Number = 2;
      
      private static const const_2015:Number = 3;
      
      private static const matrix:Matrix3 = new Matrix3();
      
      private static const var_515:Matrix4 = new Matrix4();
      
      private static const name_1422:Vector3 = new Vector3();
      
      private static const direction:Vector3 = new Vector3();
      
      private static const const_2011:Vector3 = new Vector3();
      
      private static const const_1568:Vector3 = new Vector3();
      
      private static const const_2010:Vector3 = new Vector3();
      
      private static const var_711:name_124 = new name_124();
       
      
      private var var_2450:Number;
      
      private var var_2465:Number;
      
      private var var_2463:Number;
      
      private var name_1724:Number;
      
      private var var_2453:Vector3;
      
      private var turret:Object3D;
      
      private var sfxData:name_1715;
      
      private var name_247:name_1083;
      
      private var var_2452:Vector.<StreamWeaponParticle>;
      
      private var var_2462:Number;
      
      private var var_2464:Number;
      
      private var time:int;
      
      private var var_2457:int;
      
      private var var_2451:int;
      
      private var var_170:name_175;
      
      private var var_2454:Boolean;
      
      private var var_2449:StreamWeaponMuzzlePlane;
      
      private var var_2183:name_660;
      
      private var var_2459:Number;
      
      private var var_2456:Number;
      
      private var var_2461:Number;
      
      private var var_2460:Number;
      
      private var var_2458:Number;
      
      private var var_729:Boolean;
      
      private var var_2455:int;
      
      public function StreamWeaponGraphicEffect(param1:ObjectPool)
      {
         this.var_2453 = new Vector3();
         this.var_2452 = new Vector.<StreamWeaponParticle>(50);
         super(param1);
         this.var_2449 = new StreamWeaponMuzzlePlane();
      }
      
      public function init(param1:name_660, param2:Number, param3:Number, param4:Number, param5:Vector3, param6:Object3D, param7:name_1715, param8:name_1083, param9:Number, param10:Number, param11:Number, param12:Number, param13:Number, param14:Number, param15:Boolean) : void
      {
         this.var_2183 = param1;
         this.var_2465 = Math.tan(0.5 * param3);
         this.var_2463 = param4;
         this.var_2453.copy(param5);
         this.turret = param6;
         this.sfxData = param7;
         this.name_247 = param8;
         this.var_2459 = param11;
         this.var_2456 = param12;
         this.var_2461 = param13;
         this.var_2460 = param14;
         this.var_2449.resize(param9,param10);
         this.method_2474(param2);
         this.var_2451 = 0;
         this.time = this.var_2457 = getTimer();
         this.var_729 = param15;
         this.method_2476(param7);
         this.var_2454 = false;
      }
      
      private function method_2474(param1:Number) : void
      {
         this.var_2450 = param1;
         this.var_2455 = Math.floor(1.1 * this.var_2450 * 0.01);
         if(this.var_2455 > 50)
         {
            this.var_2455 = 50;
         }
         this.name_1724 = this.var_2463 * param1 * 0.01;
         this.var_2458 = param1 * 0.8;
         this.var_2462 = 2 * (this.var_2456 - this.var_2459) / param1;
         this.var_2464 = 1000 * param1 / (this.var_2455 * this.name_1724);
      }
      
      private function method_2476(param1:name_1715) : void
      {
         var _loc2_:name_1594 = null;
         var _loc3_:ColorTransform = null;
         this.var_2449.init(param1.method_1236(this.var_729));
         if(param1.name_1734 != null)
         {
            _loc2_ = param1.name_1734[0];
            _loc3_ = this.var_2449.colorTransform == null ? new ColorTransform() : this.var_2449.colorTransform;
            _loc3_.alphaMultiplier = _loc2_.alphaMultiplier;
            _loc3_.alphaOffset = _loc2_.alphaOffset;
            _loc3_.redMultiplier = _loc2_.redMultiplier;
            _loc3_.redOffset = _loc2_.redOffset;
            _loc3_.greenMultiplier = _loc2_.greenMultiplier;
            _loc3_.greenOffset = _loc2_.greenOffset;
            _loc3_.blueMultiplier = _loc2_.blueMultiplier;
            _loc3_.blueOffset = _loc2_.blueOffset;
            this.var_2449.colorTransform = _loc3_;
         }
         else
         {
            this.var_2449.colorTransform = null;
         }
      }
      
      public function destroy() : void
      {
         while(this.var_2451 > 0)
         {
            this.method_2475(0);
         }
         this.var_170.removeChild(this.var_2449);
         this.var_2449.clear();
         this.var_170 = null;
         this.var_2183 = null;
         this.turret = null;
         this.sfxData = null;
         this.name_247 = null;
         method_584();
      }
      
      override protected function getClass() : Class
      {
         return StreamWeaponGraphicEffect;
      }
      
      public function play(param1:int, param2:name_735) : Boolean
      {
         var _loc3_:Number = NaN;
         var _loc4_:StreamWeaponParticle = null;
         var _loc5_:Vector3 = null;
         var _loc6_:Number = NaN;
         this.method_2478();
         _loc3_ = param1 / const_442.name_1390();
         if(this.name_247.name_251(name_1422,direction,name_73.name_252,this.var_2453.y + this.var_2449.length,null,var_711))
         {
            this.var_2449.visible = false;
         }
         else
         {
            this.var_2449.visible = true;
            this.var_2449.update(_loc3_,this.sfxData.method_1236(this.var_729).fps);
            name_2500.name_2503(this.var_2449,const_2010,direction,param2.pos);
         }
         if(!this.var_2454 && this.var_2451 < this.var_2455 && this.time >= this.var_2457)
         {
            this.var_2457 += this.var_2464;
            this.method_2479();
         }
         var _loc7_:int = 0;
         while(_loc7_ < this.var_2451)
         {
            _loc4_ = this.var_2452[_loc7_];
            const_1568.x = _loc4_.x;
            const_1568.y = _loc4_.y;
            const_1568.z = _loc4_.z;
            if(_loc4_.name_2697 > this.var_2450 || Boolean(this.name_247.name_251(const_1568,_loc4_.name_187,name_73.WEAPON,_loc3_,null,var_711)))
            {
               this.method_2475(_loc7_--);
            }
            else
            {
               _loc5_ = _loc4_.name_187;
               _loc4_.x += _loc5_.x * _loc3_;
               _loc4_.y += _loc5_.y * _loc3_;
               _loc4_.z += _loc5_.z * _loc3_;
               _loc4_.name_2697 += this.name_1724 * _loc3_;
               _loc4_.rotation += 3 * _loc3_ * _loc4_.name_2699;
               _loc4_.name_1431(_loc4_.name_2698);
               _loc4_.name_2698 += this.sfxData.method_1238(this.var_729).fps * _loc3_;
               _loc6_ = this.var_2459 + this.var_2462 * _loc4_.name_2697;
               if(_loc6_ > this.var_2456)
               {
                  _loc6_ = this.var_2456;
               }
               _loc4_.width = _loc6_;
               _loc4_.height = _loc6_;
               if(_loc4_.name_2697 > this.var_2458)
               {
                  _loc4_.alpha = (this.var_2450 - _loc4_.name_2697) / (this.var_2450 - this.var_2458);
               }
               _loc4_.name_956(this.var_2450,this.sfxData.name_1726);
            }
            _loc7_++;
         }
         this.time += param1;
         return !this.var_2454 || this.var_2451 > 0;
      }
      
      public function kill() : void
      {
         if(!this.var_2454)
         {
            this.var_2454 = true;
            this.var_170.removeChild(this.var_2449);
         }
      }
      
      public function get owner() : ClientObject
      {
         return null;
      }
      
      public function name_742(param1:name_175) : void
      {
         this.var_170 = param1;
         param1.addChild(this.var_2449);
      }
      
      private function method_2478() : void
      {
         var_515.name_943(this.turret.x,this.turret.y,this.turret.z,this.turret.rotationX,this.turret.rotationY,this.turret.rotationZ);
         const_2011.x = var_515.m00;
         const_2011.y = var_515.m10;
         const_2011.z = var_515.m20;
         direction.x = var_515.m01;
         direction.y = var_515.m11;
         direction.z = var_515.m21;
         var_515.name_890(this.var_2453,const_2010);
         var _loc1_:Number = this.var_2453.y;
         name_1422.x = const_2010.x - _loc1_ * direction.x;
         name_1422.y = const_2010.y - _loc1_ * direction.y;
         name_1422.z = const_2010.z - _loc1_ * direction.z;
      }
      
      private function method_2479() : void
      {
         var _loc1_:Number = NaN;
         var _loc2_:StreamWeaponParticle = null;
         var _loc3_:Number = NaN;
         _loc1_ = this.var_2461 + Math.random() * this.var_2460;
         if(!this.var_2449.visible && var_711.t < this.var_2453.y + _loc1_)
         {
            return;
         }
         var _loc4_:Number = Math.random();
         this.method_2477(direction,_loc4_);
         if(this.var_729 && Math.random() < 0.8 && _loc4_ > 0.6)
         {
            _loc2_ = StreamWeaponParticle.name_2700(false);
            _loc2_.material = this.sfxData.name_2701();
            _loc2_.scaleX = 1;
            _loc2_.scaleY = 1;
            _loc2_.scaleZ = 1;
         }
         else
         {
            _loc2_ = StreamWeaponParticle.name_2700(true);
            _loc2_.name_1433(this.sfxData.method_1238(this.var_729));
            _loc3_ = this.var_729 ? Number(2) : Number(1);
            _loc2_.scaleX = _loc3_;
            _loc2_.scaleY = _loc3_;
            _loc2_.scaleZ = _loc3_;
         }
         _loc2_.rotation = Math.random() * Math.PI * 2;
         _loc2_.name_2698 = Math.random() * _loc2_.name_2313();
         _loc2_.name_187.x = this.name_1724 * direction.x;
         _loc2_.name_187.y = this.name_1724 * direction.y;
         _loc2_.name_187.z = this.name_1724 * direction.z;
         _loc2_.name_187.add(this.var_2183.state.name_187);
         _loc2_.name_2697 = _loc1_;
         _loc2_.x = const_2010.x + _loc1_ * direction.x;
         _loc2_.y = const_2010.y + _loc1_ * direction.y;
         _loc2_.z = const_2010.z + _loc1_ * direction.z;
         _loc2_.name_2699 = Math.random() < 0.5 ? int(1) : int(-1);
         var _loc5_:* = this.var_2451++;
         this.var_2452[_loc5_] = _loc2_;
         this.var_170.addChild(_loc2_);
      }
      
      private function method_2475(param1:int) : void
      {
         var _loc2_:StreamWeaponParticle = this.var_2452[param1];
         this.var_2452[param1] = this.var_2452[--this.var_2451];
         this.var_2452[this.var_2451] = null;
         this.var_170.removeChild(_loc2_);
         _loc2_.dispose();
      }
      
      private function method_2477(param1:Vector3, param2:Number) : void
      {
         var _loc3_:Number = 2 * Math.PI * Math.random();
         matrix.name_1097(param1,_loc3_);
         const_2011.transform3(matrix);
         var _loc4_:Number = this.var_2450 * this.var_2465 * param2;
         param1.x = param1.x * this.var_2450 + const_2011.x * _loc4_;
         param1.y = param1.y * this.var_2450 + const_2011.y * _loc4_;
         param1.z = param1.z * this.var_2450 + const_2011.z * _loc4_;
         param1.normalize();
      }
      
      public function get method_2483() : Vector.<StreamWeaponParticle>
      {
         return this.var_2452;
      }
      
      public function get method_2481() : int
      {
         return this.var_2451;
      }
      
      public function get range() : Number
      {
         return this.var_2450;
      }
      
      public function method_2480(param1:Number) : void
      {
         this.method_2474(param1);
      }
      
      public function method_2482(param1:Boolean) : void
      {
         this.var_729 = param1;
         this.var_2449.init(this.sfxData.method_1236(this.var_729));
      }
   }
}
