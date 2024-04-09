package alternativa.tanks.models.tank.spawn
{
   import alternativa.osgi.OSGi;
   import alternativa.tanks.models.battlefield.IBattleField;
   import alternativa.tanks.models.tank.ITank;
   import package_101.TankSpawnerModelBase;
   import package_101.name_291;
   import package_305.name_1216;
   import package_305.name_1218;
   import package_305.name_1220;
   import package_46.BattleEventSupport;
   import package_46.name_697;
   import package_46.name_704;
   import package_46.name_96;
   import package_67.Vector3d;
   import platform.client.fp10.core.model.name_170;
   import platform.client.fp10.core.model.name_287;
   
   public class name_136 extends TankSpawnerModelBase implements name_279, name_291, name_287, name_170
   {
      
      public static var battleService:IBattleField = OSGi.getInstance().getService(IBattleField) as IBattleField;
      
      public static var battleEventDispatcher:name_96 = OSGi.getInstance().getService(name_96) as name_96;
      
      private static const const_386:Vector3d = new Vector3d(0,0,0);
       
      
      private var var_540:BattleEventSupport;
      
      private var var_539:name_1217;
      
      public function name_136()
      {
         super();
         this.var_540 = new BattleEventSupport(battleEventDispatcher);
         this.var_540.name_1221(name_697,this.method_773);
         this.var_540.name_1221(name_704,this.method_773);
      }
      
      private function method_773(param1:*) : void
      {
         this.method_772();
      }
      
      public function method_767() : int
      {
         return -1;
      }
      
      public function prepareToSpawn(param1:int) : void
      {
         this.method_772();
         this.var_539 = new name_1217(param1,object);
         battleService.name_165().name_212(this.var_539);
      }
      
      public function objectLoaded() : void
      {
         var _loc2_:ITank = ITank(object.name_176(ITank));
         if(_loc2_.isLocal())
         {
            putData(name_1216,new name_1218(object,server));
            if(Boolean(this.var_539))
            {
               this.var_539.name_1219(object);
            }
         }
         else
         {
            putData(name_1216,new name_1220(object));
         }
      }
      
      public function method_769() : void
      {
      }
      
      public function method_768() : void
      {
      }
      
      public function name_1069() : void
      {
         var _loc1_:name_1216 = name_1216(getData(name_1216));
         _loc1_.name_1222();
      }
      
      public function setReadyToPlace() : void
      {
         this.method_772();
         server.setReadyToPlace();
      }
      
      private function method_772() : void
      {
         if(Boolean(this.var_539))
         {
            battleService.name_165().name_977(this.var_539);
            this.var_539 = null;
         }
      }
      
      public function objectUnloaded() : void
      {
         var _loc1_:ITank = ITank(object.name_176(ITank));
         if(_loc1_.isLocal())
         {
            if(Boolean(this.var_539))
            {
               this.var_539.name_1219(null);
            }
         }
      }
   }
}
