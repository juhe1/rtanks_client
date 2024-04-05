package package_73
{
   import alternativa.engine3d.core.Object3D;
   import alternativa.osgi.OSGi;
   import alternativa.tanks.models.battlefield.name_83;
   import alternativa.tanks.models.sfx.name_1096;
   import alternativa.tanks.models.sfx.name_1716;
   import alternativa.tanks.models.weapon.name_903;
   import alternativa.tanks.models.weapon.shotgun.name_1247;
   import alternativa.tanks.sfx.Sound3D;
   import alternativa.tanks.sfx.Sound3DEffect;
   import alternativa.tanks.sfx.class_177;
   import alternativa.tanks.sfx.name_132;
   import alternativa.tanks.sfx.name_1718;
   import alternativa.tanks.sfx.name_89;
   import alternativa.tanks.vehicles.tanks.TankSkin;
   import alternativa.tanks.vehicles.tanks.class_20;
   import flash.media.Sound;
   import package_238.ObjectPool;
   import package_37.Vector3;
   import platform.client.fp10.core.type.AutoClosable;
   
   public class name_1244 implements AutoClosable, class_177
   {
      
      public static var battleService:name_83 = name_83(OSGi.getInstance().name_6(name_83));
      
      private static const const_1809:Number = 1;
      
      private static const const_1811:int = 500;
      
      private static const const_1810:int = 1000;
       
      
      private var var_2080:ShotgunSFXData;
      
      private var var_2079:name_1718;
      
      private var var_2081:Boolean = false;
      
      public function name_1244(param1:ShotgunSFXData)
      {
         super();
         this.var_2080 = param1;
      }
      
      public function name_1249(param1:name_1247, param2:name_903, param3:class_20, param4:Vector3) : void
      {
         this.method_2190(param1,param2,param3,param4);
         this.method_79(param2);
         this.method_1297(param3);
      }
      
      private function method_79(param1:name_903) : void
      {
         var _loc2_:Sound3D = Sound3D.create(this.var_2080.shotSound,name_89.name_191,name_89.name_229,name_89.name_250,1);
         battleService.name_195(Sound3DEffect.create(battleService.getObjectPool(),null,param1.name_1421,_loc2_));
      }
      
      private function method_2190(param1:name_1247, param2:name_903, param3:class_20, param4:Vector3) : void
      {
         var _loc5_:ShotgunShotEffect = ShotgunShotEffect(battleService.getObjectPool().getObject(ShotgunShotEffect));
         _loc5_.init(param1,param2,param3,param4,this.var_2080,this.var_2081);
         battleService.name_217(_loc5_);
      }
      
      public function name_1450(param1:Object3D, param2:int) : void
      {
         var _loc3_:Sound = this.var_2080.reloadSound;
         this.method_2189(_loc3_,param2,500,param1);
      }
      
      public function name_1455(param1:Object3D, param2:int) : void
      {
         var _loc3_:Sound = this.var_2080.magazineReloadSound;
         this.method_2189(_loc3_,param2,1000,param1);
      }
      
      public function method_999() : void
      {
         if(this.var_2079 != null)
         {
            this.var_2079.kill();
         }
      }
      
      private function method_2189(param1:Sound, param2:int, param3:int, param4:Object3D) : void
      {
         var _loc5_:Sound3D = Sound3D.create(param1,name_89.name_191,name_89.name_229,name_89.name_250,1);
         var _loc6_:ObjectPool = battleService.getObjectPool();
         this.var_2079 = name_1718(_loc6_.getObject(name_1718));
         var _loc7_:int = param2 - param1.length + param3;
         var _loc8_:int = 0;
         if(_loc7_ < 0)
         {
            _loc8_ = -_loc7_;
            _loc7_ = 0;
         }
         this.var_2079.init(null,_loc5_,param4,_loc7_,1,_loc8_,this);
         battleService.name_195(this.var_2079);
      }
      
      private function method_1297(param1:class_20) : void
      {
         var _loc2_:TankSkin = param1.method_461();
         var _loc3_:Object3D = _loc2_.name_144();
         var _loc4_:Vector3 = param1.method_463();
         var _loc5_:name_1096 = name_1096(battleService.getObjectPool().getObject(name_1096));
         var _loc6_:name_1716 = name_1716(battleService.getObjectPool().getObject(name_1716));
         _loc6_.init(_loc3_,_loc4_);
         _loc5_.init(_loc6_,this.var_2080.name_2468);
         battleService.name_217(_loc5_);
      }
      
      public function close() : void
      {
         this.var_2080 = null;
         if(this.var_2079 != null)
         {
            this.var_2079.kill();
         }
      }
      
      public function method_2188(param1:name_132) : void
      {
         if(this.var_2079 == param1)
         {
            this.var_2079 = null;
         }
      }
      
      public function method_2191(param1:Boolean) : void
      {
         this.var_2081 = param1;
      }
   }
}
