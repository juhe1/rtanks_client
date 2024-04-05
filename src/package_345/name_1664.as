package package_345
{
   import alternativa.osgi.OSGi;
   import package_116.EquipmentConstraintsNamingModelBase;
   import package_116.name_1665;
   import platform.client.fp10.core.model.name_170;
   import projects.tanks.clients.fp10.libraries.tanksservices.utils.BattleFormatUtil;
   
   public class name_1664 extends EquipmentConstraintsNamingModelBase implements name_1665, name_170
   {
      
      public static var var_2421:BattleFormatUtil = OSGi.getInstance().name_6(BattleFormatUtil) as BattleFormatUtil;
       
      
      public function name_1664()
      {
         super();
      }
      
      public function objectLoaded() : void
      {
         var_2421.init(method_771());
      }
   }
}
