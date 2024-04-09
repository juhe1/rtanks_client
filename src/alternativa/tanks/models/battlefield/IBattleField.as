package alternativa.tanks.models.battlefield
{
   import alternativa.engine3d.materials.TextureMaterial;
   import alternativa.tanks.battle.BattleRunner;
   import alternativa.tanks.models.tank.TankData;
   import alternativa.tanks.models.weapon.shared.name_651;
   import alternativa.tanks.models.weapon.shared.name_653;
   import alternativa.tanks.sfx.name_132;
   import alternativa.tanks.sfx.name_657;
   import alternativa.tanks.vehicles.tanks.Tank;
   import package_238.ObjectPool;
   import package_239.name_655;
   import package_240.name_656;
   import package_37.Vector3;
   import package_4.ClientObject;
   import package_76.name_654;
   import package_76.name_658;
   
   public interface IBattleField
   {
       
      
      function addDecal(param1:Vector3, param2:Vector3, param3:Number, param4:TextureMaterial, param5:name_656 = null) : void;
      
      function getBattlefieldData() : name_128;
      
      function name_237(param1:TankData) : void;
      
      function name_147(param1:TankData) : void;
      
      function name_217(param1:name_657) : void;
      
      function name_195(param1:name_132) : void;
      
      function name_125(param1:ClientObject) : void;
      
      function name_198(param1:Vector3, param2:Vector3) : void;
      
      function name_236(param1:Vector3, param2:Vector3) : void;
      
      function method_146(param1:name_654) : void;
      
      function name_186(param1:Tank) : void;
      
      function name_129(param1:TankData) : void;
      
      function name_221(param1:int) : void;
      
      function name_209() : void;
      
      function name_232() : int;
      
      function method_148(param1:String, param2:String) : void;
      
      function method_152(param1:name_652) : void;
      
      function method_150(param1:name_652) : void;
      
      function get soundManager() : name_655;
      
      function method_144(param1:TankData, param2:Vector3, param3:Number) : void;
      
      function method_145(param1:name_658) : void;
      
      function method_153() : void;
      
      function method_154() : name_653;
      
      function method_147(param1:name_653) : void;
      
      function method_151() : name_651;
      
      function method_149(param1:name_651) : void;
      
      function getObjectPool() : ObjectPool;
      
      function name_165() : BattleRunner;
      
      function method_143() : name_654;
   }
}
