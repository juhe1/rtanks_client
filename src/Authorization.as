package
{
   import package_1.UserModelActivator;
   
   public class Authorization
   {
       
      
      public var var_70:UserModelActivator;
      
      public function Authorization()
      {
         super();
         this.var_70 = new UserModelActivator();
      }
      
      public function init() : void
      {
         this.var_70.start(Game.getInstance.osgi);
         this.var_70.var_70.initObject(Game.getInstance.var_6,false,false);
         this.var_70.var_70.objectLoaded(Game.getInstance.var_6);
      }
   }
}
