package package_1
{
   import alternativa.osgi.OSGi;
   import alternativa.tanks.model.UserModel;
   import alternativa.tanks.model.name_1223;
   import package_11.name_23;
   import package_306.LoginByHashModel;
   import package_306.name_1225;
   import package_307.name_1224;
   import package_7.name_32;
   import package_95.name_298;
   import platform.client.fp10.core.registry.name_29;
   
   public class UserModelActivator implements name_23
   {
      
      public static var osgi:OSGi;
       
      
      public var var_70:UserModel;
      
      private var var_541:name_1223;
      
      public function UserModelActivator()
      {
         super();
      }
      
      public function start(param1:OSGi) : void
      {
         UserModelActivator.osgi = param1;
         var _loc2_:name_32 = param1.name_6(name_32) as name_32;
         this.var_70 = new UserModel();
         _loc2_.add(this.var_70);
         this.var_541 = new name_1223();
         _loc2_.add(this.var_541);
         param1.name_40(name_298,LoginByHashModel,"storageService");
         var _loc3_:name_29 = param1.name_6(name_29) as name_29;
         _loc3_.add(new LoginByHashModel(),Vector.<Class>([name_1225,name_1224]));
      }
      
      public function stop(param1:OSGi) : void
      {
         var _loc2_:name_32 = param1.name_6(name_32) as name_32;
         _loc2_.remove(this.var_70.id);
         _loc2_.remove(this.var_541.id);
         this.var_70 = null;
         this.var_541 = null;
         UserModelActivator.osgi = null;
      }
   }
}
