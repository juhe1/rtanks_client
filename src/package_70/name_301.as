package package_70
{
   import alternativa.tanks.battle.BattleUtils;
   import package_37.Vector3;
   import package_67.Vector3d;
   import package_93.DiscreteWeaponCommunicationModelBase;
   import package_93.name_1243;
   import package_93.name_303;
   import platform.client.fp10.core.type.name_70;
   import projects.tanks.client.battlefield.models.tankparts.weapons.common.name_1378;
   
   public class name_301 extends DiscreteWeaponCommunicationModelBase implements name_303, name_278
   {
       
      
      public function name_301()
      {
         super();
      }
      
      public function shoot(param1:name_70, param2:Vector3d, param3:Vector.<name_1243>) : void
      {
         var _loc4_:name_273 = name_273(object.event(name_273));
         _loc4_.method_796(param1,BattleUtils.getVector3(param2),param3);
      }
      
      public function method_909(param1:int, param2:Vector3, param3:Vector.<name_1378>) : void
      {
         server.method_909(param1,BattleUtils.getVector3d(param2),param3);
      }
      
      public function method_910(param1:int, param2:Vector3) : void
      {
         server.method_910(param1,BattleUtils.getVector3d(param2));
      }
   }
}
