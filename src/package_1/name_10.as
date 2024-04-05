package package_1
{
   import alternativa.osgi.OSGi;
   import alternativa.tanks.models.panel.name_53;
   import alternativa.tanks.models.user.name_54;
   import alternativa.tanks.models.user.name_65;
   import controls.PlayerInfo;
   import package_11.name_23;
   import package_25.ClanUserInfoServiceImpl;
   import package_25.name_52;
   import package_25.name_55;
   import package_26.ClanServiceImpl;
   import package_26.name_60;
   import package_26.name_61;
   import package_26.name_62;
   import package_27.name_56;
   import package_27.name_59;
   import package_28.name_57;
   import package_28.name_58;
   import package_29.ClanMembersDataServiceImpl;
   import package_29.name_64;
   import package_30.ClanCreateServiceImpl;
   import package_30.name_63;
   
   public class name_10 implements name_23
   {
       
      
      public function name_10()
      {
         super();
      }
      
      public function start(param1:OSGi) : void
      {
         param1.name_1(name_62,new ClanServiceImpl());
         param1.name_1(name_63,new ClanCreateServiceImpl());
         param1.name_1(name_65,new name_54());
         param1.name_1(name_64,new ClanMembersDataServiceImpl());
         param1.name_1(name_56,new name_53());
         param1.name_1(name_52,new ClanUserInfoServiceImpl());
         param1.name_1(name_59,new name_61());
         param1.name_1(name_55,new name_60());
         param1.name_1(name_57,new name_58());
         param1.name_40(name_52,PlayerInfo,"clanUserInfoService");
      }
      
      public function stop(param1:OSGi) : void
      {
      }
   }
}
