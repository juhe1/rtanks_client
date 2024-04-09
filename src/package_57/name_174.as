package package_57
{
   import alternativa.physics.Body;
   import alternativa.physics.name_886;
   import alternativa.tanks.vehicles.tanks.Tank;
   import package_37.Matrix3;
   import package_37.Vector3;
   import package_37.name_86;
   
   public class name_174 implements name_913
   {
      
      private static const position:Vector3 = new Vector3();
      
      private static const const_65:Matrix3 = new Matrix3();
      
      private static const const_72:Number = 0.3000021632740757;
      
      private static const const_71:Vector3 = new Vector3();
       
      
      private const const_69:Vector3 = new Vector3();
      
      private const const_70:name_86 = new name_86();
      
      private var tank:Tank;
      
      public function name_174(param1:Tank)
      {
         super();
         this.tank = param1;
      }
      
      private static function method_503(param1:Number, param2:Number, param3:Number, param4:Number, param5:Number) : Number
      {
         param1 += param2 * param3;
         return param1 + (param4 - param1) * param5;
      }
      
      public function reset() : void
      {
         var _loc1_:name_886 = this.tank.var_299;
         this.const_69.vCopy(_loc1_.position);
         this.const_70.copy(_loc1_.orientation);
      }
      
      public function update(param1:Number) : void
      {
         var _loc2_:Body = this.tank;
         var _loc3_:name_886 = _loc2_.var_299;
         var _loc4_:Vector3 = _loc3_.name_187;
         _loc4_.x = 0;
         _loc4_.y = 0;
         _loc4_.z = 0;
         var _loc5_:Vector3 = this.tank.var_332;
         this.const_69.x = method_503(this.const_69.x,_loc4_.x,param1,_loc5_.x,0.3000021632740757);
         this.const_69.y = method_503(this.const_69.y,_loc4_.y,param1,_loc5_.y,0.3000021632740757);
         this.const_69.z = method_503(this.const_69.z,_loc4_.z,param1,_loc5_.z,0.3000021632740757);
         var _loc7_:Vector3 = _loc3_.name_181;
         _loc7_.x = 0;
         _loc7_.y = 0;
         _loc7_.z = 0;
         this.const_70.name_895(_loc7_,param1);
         this.const_70.name_205(this.const_70,this.tank.var_334,0.3000021632740757);
         this.const_70.name_182(const_71);
         this.const_70.toMatrix3(const_65);
         position.vCopy(this.tank.var_328);
         position.vTransformBy3(const_65);
         position.vAdd(this.const_69);
         this.tank.skin.name_969(position,const_71);
      }
   }
}
