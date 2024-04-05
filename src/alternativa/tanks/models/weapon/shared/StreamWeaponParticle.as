package alternativa.tanks.models.weapon.shared
{
   import alternativa.tanks.engine3d.AnimatedSprite3D;
   import flash.geom.ColorTransform;
   import package_159.name_1594;
   import package_37.Vector3;
   
   public class StreamWeaponParticle extends AnimatedSprite3D
   {
      
      private static var const_2029:int = 20;
      
      private static var pool:Vector.<StreamWeaponParticle> = new Vector.<StreamWeaponParticle>(const_2029);
      
      private static var var_2492:int = -1;
       
      
      public var name_187:Vector3;
      
      public var name_2697:Number = 0;
      
      public var name_2698:Number;
      
      public var name_2699:int;
      
      private var var_3319:Boolean;
      
      public function StreamWeaponParticle(param1:Boolean)
      {
         this.name_187 = new Vector3();
         super(100,100);
         softAttenuation = 130;
         colorTransform = new ColorTransform();
         this.var_3319 = param1;
      }
      
      public static function name_2700(param1:Boolean) : StreamWeaponParticle
      {
         if(var_2492 == -1)
         {
            return new StreamWeaponParticle(param1);
         }
         var _loc2_:StreamWeaponParticle = pool[var_2492];
         _loc2_.var_3319 = param1;
         var _loc3_:* = var_2492--;
         pool[_loc3_] = null;
         _loc2_.reset();
         return _loc2_;
      }
      
      private static function method_2992(param1:name_1594, param2:name_1594, param3:Number, param4:ColorTransform) : void
      {
         param4.alphaMultiplier = param1.alphaMultiplier + param3 * (param2.alphaMultiplier - param1.alphaMultiplier);
         param4.alphaOffset = param1.alphaOffset + param3 * (param2.alphaOffset - param1.alphaOffset);
         param4.redMultiplier = param1.redMultiplier + param3 * (param2.redMultiplier - param1.redMultiplier);
         param4.redOffset = param1.redOffset + param3 * (param2.redOffset - param1.redOffset);
         param4.greenMultiplier = param1.greenMultiplier + param3 * (param2.greenMultiplier - param1.greenMultiplier);
         param4.greenOffset = param1.greenOffset + param3 * (param2.greenOffset - param1.greenOffset);
         param4.blueMultiplier = param1.blueMultiplier + param3 * (param2.blueMultiplier - param1.blueMultiplier);
         param4.blueOffset = param1.blueOffset + param3 * (param2.blueOffset - param1.blueOffset);
      }
      
      private static function method_2991(param1:name_1594, param2:ColorTransform) : void
      {
         param2.alphaMultiplier = param1.alphaMultiplier;
         param2.alphaOffset = param1.alphaOffset;
         param2.redMultiplier = param1.redMultiplier;
         param2.redOffset = param1.redOffset;
         param2.greenMultiplier = param1.greenMultiplier;
         param2.greenOffset = param1.greenOffset;
         param2.blueMultiplier = param1.blueMultiplier;
         param2.blueOffset = param1.blueOffset;
      }
      
      override public function name_1431(param1:int) : void
      {
         if(this.var_3319)
         {
            super.name_1431(param1);
         }
      }
      
      public function reset() : void
      {
         var _loc1_:ColorTransform = colorTransform;
         _loc1_.redMultiplier = 1;
         _loc1_.greenMultiplier = 1;
         _loc1_.blueMultiplier = 1;
         _loc1_.alphaMultiplier = 1;
         _loc1_.redOffset = 0;
         _loc1_.greenOffset = 0;
         _loc1_.blueOffset = 0;
         _loc1_.alphaOffset = 0;
         alpha = 1;
      }
      
      public function dispose() : void
      {
         clear();
         var _loc1_:* = ++var_2492;
         pool[_loc1_] = this;
      }
      
      public function name_956(param1:Number, param2:Vector.<name_1594>) : void
      {
         var _loc3_:Number = NaN;
         var _loc4_:name_1594 = null;
         var _loc5_:name_1594 = null;
         var _loc6_:int = 0;
         if(param2 != null)
         {
            _loc3_ = this.name_2697 / param1;
            if(_loc3_ <= 0)
            {
               _loc4_ = param2[0];
               method_2991(_loc4_,colorTransform);
            }
            else if(_loc3_ >= 1)
            {
               _loc4_ = param2[param2.length - 1];
               method_2991(_loc4_,colorTransform);
            }
            else
            {
               _loc6_ = 1;
               _loc4_ = param2[0];
               _loc5_ = param2[1];
               while(_loc5_.t < _loc3_)
               {
                  _loc6_++;
                  _loc4_ = _loc5_;
                  _loc5_ = param2[_loc6_];
               }
               _loc3_ = (_loc3_ - _loc4_.t) / (_loc5_.t - _loc4_.t);
               method_2992(_loc4_,_loc5_,_loc3_,colorTransform);
            }
            alpha = colorTransform.alphaMultiplier;
         }
      }
   }
}
