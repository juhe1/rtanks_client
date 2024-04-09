package package_73
{
   import alternativa.tanks.models.battlefield.IBattleField;
   import alternativa.tanks.models.sfx.LightDataManager;
   import alternativa.tanks.models.tank.ITank;
   import alternativa.tanks.models.weapon.name_903;
   import alternativa.tanks.models.weapon.name_911;
   import alternativa.tanks.models.weapon.shotgun.name_1247;
   import alternativa.tanks.vehicles.tanks.Tank;
   import package_37.Vector3;
   import package_4.ClientObject;
   import package_70.name_273;
   import package_91.ShotgunSFXModelBase;
   import package_91.name_1246;
   import package_91.name_288;
   import package_93.name_1243;
   import platform.client.fp10.core.resource.types.ImageResource;
   import platform.client.fp10.core.resource.types.MultiframeImageResource;
   import platform.client.fp10.core.resource.types.SoundResource;
   import platform.client.fp10.core.type.name_70;
   
   public class name_296 extends ShotgunSFXModelBase implements name_288, name_282, name_273
   {
      
      public static var battleService:IBattleField;
       
      
      private var var_557:name_903;
      
      private var var_556:name_1247;
      
      public function name_296()
      {
         this.var_557 = new name_903();
         super();
      }
      
      public function initObject(param1:ClientObject, param2:Vector.<ImageResource>, param3:ImageResource, param4:MultiframeImageResource, param5:MultiframeImageResource, param6:MultiframeImageResource, param7:ImageResource, param8:SoundResource, param9:SoundResource, param10:SoundResource) : void
      {
         var _loc11_:name_1246 = new name_1246();
         _loc11_.explosionMarkTextures = param2;
         _loc11_.pelletTrailTexture = param3;
         _loc11_.shotAcrossTexture = param4;
         _loc11_.shotAlongTexture = param5;
         _loc11_.smokeTexture = param6;
         _loc11_.sparkleTexture = param7;
         _loc11_.magazineReloadSound = param8;
         _loc11_.reloadSound = param9;
         _loc11_.shotSound = param10;
         param1.method_12(name_1246,_loc11_);
      }
      
      public function method_796(param1:name_70, param2:Vector3, param3:Vector.<name_1243>) : void
      {
         this.method_798(param1,param2);
      }
      
      private function method_798(param1:name_70, param2:Vector3) : void
      {
         var _loc3_:Tank = null;
         var _loc4_:ITank = ITank(param1.name_176(ITank));
         if(!_loc4_.isLocal())
         {
            this.method_797(param1);
            _loc3_ = _loc4_.getTank();
            this.getEffects().name_1249(this.method_799(_loc3_.tankData.turret),this.var_557,_loc3_,param2);
         }
      }
      
      private function method_797(param1:name_70) : void
      {
         var _loc2_:ITank = ITank(param1.name_176(ITank));
         var _loc3_:Tank = _loc2_.getTank();
         name_911.getInstance().name_920(_loc3_.name_144(),_loc3_.method_463(),this.var_557);
      }
      
      public function getEffects() : name_1244
      {
         var _loc1_:name_1244 = name_1244(getData(name_1244));
         var _loc2_:ITank = null;
         var _loc3_:ShotgunSFXData = null;
         var _loc4_:name_1246 = null;
         if(_loc1_ == null)
         {
            _loc2_ = ITank(object.name_176(ITank));
            _loc4_ = name_1246(_loc2_.getTank().tankData.turret.method_16(name_1246));
            _loc3_ = new ShotgunSFXData(_loc4_,LightDataManager.name_1250("smoky_m0"));
            _loc1_ = new name_1244(_loc3_);
            putData(name_1244,_loc1_);
            putData(ShotgunSFXData,_loc3_);
         }
         return _loc1_;
      }
      
      private function method_799(param1:ClientObject) : name_1247
      {
         if(this.var_556 == null)
         {
            this.var_556 = new name_1247(param1);
         }
         else
         {
            this.var_556.name_1248(param1);
         }
         return this.var_556;
      }
   }
}
