package package_1
{
   import alternativa.osgi.OSGi;
   import alternativa.tanks.model.BattleSelectModel;
   import forms.battlelist.battlecreate.name_1663;
   import package_11.IBundleActivator;
   import package_116.name_1665;
   import package_144.BattleTimeLeftService;
   import package_144.name_465;
   import package_345.name_1664;
   import package_54.name_102;
   import package_7.name_32;
   import platform.client.fp10.core.model.name_170;
   import platform.client.fp10.core.registry.name_29;
   
   public class BattleSelectModelActivator implements IBundleActivator
   {
      
      public static var osgi:OSGi;
       
      
      public var battleSelectModel:BattleSelectModel;
      
      public function BattleSelectModelActivator()
      {
         super();
      }
      
      public function start(param1:OSGi) : void
      {
         BattleSelectModelActivator.osgi = param1;
         var _loc2_:name_32 = param1.getService(name_32) as name_32;
         this.battleSelectModel = new BattleSelectModel();
         _loc2_.add(this.battleSelectModel);
         param1.name_40(name_102,name_1663,"localeService");
         var _loc3_:name_29 = param1.getService(name_29) as name_29;
         _loc3_.add(new name_1664(),Vector.<Class>([name_1665,name_170]));
         param1.registerService(name_465,new BattleTimeLeftService());
         param1.name_40(name_465,Lobby,"battleTimeLeftService");
      }
      
      public function stop(param1:OSGi) : void
      {
         var _loc2_:name_32 = param1.getService(name_32) as name_32;
         _loc2_.remove(this.battleSelectModel.id);
         this.battleSelectModel = null;
         BattleSelectModelActivator.osgi = null;
      }
   }
}
