package package_44
{
   import alternativa.osgi.OSGi;
   import alternativa.tanks.models.battlefield.BattlefieldModel;
   import alternativa.tanks.models.battlefield.IBattleField;
   import alternativa.tanks.models.tank.TankData;
   import flash.events.KeyboardEvent;
   import package_1.Main;
   import package_120.UserInfoService;
   import package_120.name_408;
   import package_37.Vector3;
   import package_48.UserTitle;
   import package_48.name_92;
   import package_82.name_312;
   
   public class name_117 implements name_99
   {
      
      public static var var_360:name_312 = OSGi.getInstance().getService(name_312) as name_312;
       
      
      public function name_117()
      {
         super();
         (Main.osgi.getService(IBattleField) as BattlefieldModel).var_130.push(this);
      }
      
      public function destroy(param1:Boolean) : void
      {
      }
      
      private function onKeyUp(param1:KeyboardEvent) : void
      {
      }
      
      public function render() : void
      {
      }
      
      public function name_134(param1:IBattleField) : void
      {
      }
      
      public function name_116(param1:TankData) : void
      {
      }
      
      public function method_84(param1:TankData, param2:Vector3) : void
      {
         if(param1.health > 0 && Boolean(var_360.name_970()))
         {
            param1.tank.title.show();
         }
         else
         {
            param1.tank.title.hide();
         }
      }
      
      public function name_255(param1:TankData) : void
      {
         var _loc2_:int = name_92.const_68 | name_92.EFFECTS;
         _loc2_ |= name_92.name_262;
         var _loc3_:UserTitle = param1.tank.title;
         if(UserInfoService(Main.osgi.getService(name_408)).hasData(param1.userName))
         {
            _loc3_.name_971(UserInfoService(Main.osgi.getService(name_408)).getData(param1.userName).premium);
         }
         _loc3_.name_156(param1.userName);
         _loc3_.name_122(param1.userRank);
         _loc3_.name_227(param1.teamType);
         _loc3_.name_133(param1.health);
         _loc3_.name_207(_loc2_);
      }
   }
}
