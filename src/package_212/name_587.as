package package_212
{
   import alternativa.tanks.gui.clanmanagement.clanmemberlist.class_138;
   import controls.DefaultButton;
   import package_228.ClanAction;
   import package_25.name_52;
   import package_26.name_62;
   
   public class name_587 extends DefaultButton implements class_138
   {
      
      public static var clanService:name_62;
      
      public static var clanUserInfoService:name_52;
       
      
      private var action:ClanAction;
      
      public function name_587(param1:ClanAction)
      {
         super();
         this.action = param1;
      }
      
      public function method_1459() : void
      {
         visible = !clanService.isBlocked && Boolean(clanService.isSelf) && Boolean(clanUserInfoService.method_375(this.action));
      }
   }
}
