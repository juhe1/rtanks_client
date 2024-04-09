package alternativa.tanks.battle
{
   import alternativa.engine3d.core.Object3D;
   import alternativa.physics.collision.name_1083;
   import alternativa.physics.Body;
   import alternativa.tanks.models.weapon.name_903;
   import alternativa.tanks.utils.name_1388;
   import alternativa.tanks.utils.name_1391;
   import alternativa.tanks.vehicles.tanks.Tank;
   import flash.geom.Vector3D;
   import package_37.Matrix3;
   import package_37.Vector3;
   import package_42.name_73;
   import package_61.RayHit;
   import package_67.Vector3d;
   import projects.tanks.client.battlefield.models.tankparts.weapons.common.name_1378;
   
   public class BattleUtils
   {
      
      public static const var_351:Vector3 = new Vector3();
      
      public static const name_1331:Matrix3 = new Matrix3();
      
      private static const const_1640:name_1391 = new name_1388(100);
      
      private static const _direction:Vector3 = new Vector3();
      
      private static const const_372:RayHit = new RayHit();
      
      private static const const_1641:Number = 0.22;
       
      
      public function BattleUtils()
      {
         super();
      }
      
      public static function method_86(param1:Vector3d) : Boolean
      {
         return param1 != null && isFinite(param1.x) && isFinite(param1.y) && isFinite(param1.z);
      }
      
      public static function getVector3d(param1:Vector3) : Vector3d
      {
         return new Vector3d(param1.x,param1.y,param1.z);
      }
      
      public static function getVector3dOrNull(param1:Vector3) : Vector3d
      {
         return param1 == null ? null : new Vector3d(param1.x,param1.y,param1.z);
      }
      
      public static function copyToVector3d(param1:Vector3, param2:Vector3d) : void
      {
         param2.x = param1.x;
         param2.y = param1.y;
         param2.z = param1.z;
      }
      
      public static function method_1899(param1:Vector3d, param2:Vector3d) : void
      {
         param2.x = param1.x;
         param2.y = param1.y;
         param2.z = param1.z;
      }
      
      public static function getVector3(param1:Vector3d) : Vector3
      {
         return new Vector3(param1.x,param1.y,param1.z);
      }
      
      public static function getVector3OrNull(param1:Vector3d) : Vector3
      {
         return param1 == null ? null : new Vector3(param1.x,param1.y,param1.z);
      }
      
      public static function copyToVector3(param1:Vector3d, param2:Vector3) : void
      {
         param2.x = param1.x;
         param2.y = param1.y;
         param2.z = param1.z;
      }
      
      public static function copyToVector3D(param1:Vector3, param2:Vector3D) : void
      {
         param2.x = param1.x;
         param2.y = param1.y;
         param2.z = param1.z;
      }
      
      public static function globalToLocal(param1:Body, param2:Vector3) : void
      {
         param2.vRemove(param1.state.position);
         param2.method_411(param1.name_225);
      }
      
      public static function localToGlobal(param1:Body, param2:Vector3) : void
      {
         param2.transform3(param1.name_225);
         param2.add(param1.state.position);
      }
      
      public static function method_1897(param1:String, param2:Number = 0) : Number
      {
         var _loc3_:Number = Number(param1);
         return isNaN(_loc3_) ? Number(param2) : Number(_loc3_);
      }
      
      public static function method_1901(param1:Object, param2:Array) : String
      {
         return "";
      }
      
      public static function name_1420(param1:Body) : Boolean
      {
         return param1 != null && param1.tank != null;
      }
      
      public static function name_1452(param1:Body, param2:name_903) : Boolean
      {
         var _loc3_:name_1083 = null;
         var _loc4_:Vector3 = param1.state.position;
         _direction.diff(param2.name_1422,_loc4_);
         if(param1.var_318 != null)
         {
            _loc3_ = param1.var_318.name_247;
            return !_loc3_.name_251(_loc4_,_direction,name_73.name_252,1,null,const_372);
         }
         return false;
      }
      
      public static function method_1895(param1:Tank) : name_1378
      {
         var _loc2_:name_1378 = new name_1378();
         _loc2_.target = param1;
         _loc2_.position = BattleUtils.getVector3d(param1.method_456().state.position);
         param1.method_456().state.orientation.name_182(var_351);
         _loc2_.orientation = getVector3d(var_351);
         _loc2_.turretAngle = param1.turretDir;
         return _loc2_;
      }
      
      public static function method_1896(param1:Vector.<Tank>) : Vector.<name_1378>
      {
         var _loc2_:Vector.<name_1378> = new Vector.<name_1378>(param1.length);
         var _loc3_:int = 0;
         while(_loc3_ < param1.length)
         {
            _loc2_[_loc3_] = method_1895(param1[_loc3_]);
            _loc3_++;
         }
         return _loc2_;
      }
      
      public static function name_1417(param1:Vector3d) : Boolean
      {
         return isNaN(param1.x) || isNaN(param1.y) || isNaN(param1.z);
      }
      
      public static function name_1712(param1:Body) : Boolean
      {
         return param1.name_225.m22 < 0.22;
      }
      
      public static function getVector3dVector(param1:Vector.<Vector3>) : Vector.<Vector3d>
      {
         var _loc2_:Vector.<Vector3d> = new Vector.<Vector3d>(param1.length);
         var _loc3_:int = 0;
         while(_loc3_ < param1.length)
         {
            _loc2_[_loc3_] = getVector3d(param1[_loc3_]);
            _loc3_++;
         }
         return _loc2_;
      }
      
      public static function name_931(param1:Vector3) : Number
      {
         return Math.atan2(-param1.x,param1.y);
      }
      
      public static function name_928(param1:Vector3, param2:Number) : void
      {
         param1.x = -Math.sin(param2);
         param1.y = Math.cos(param2);
         param1.z = 0;
      }
      
      public static function method_1900(param1:Object3D, param2:Vector3d) : void
      {
         param1.x = param2.x;
         param1.y = param2.y;
         param1.z = param2.z;
      }
      
      public static function method_1898(param1:Object3D, param2:Vector3d) : void
      {
         param1.rotationX = param2.x;
         param1.rotationY = param2.y;
         param1.rotationZ = param2.z;
      }
   }
}
