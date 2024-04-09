package package_1
{
   import alternativa.osgi.OSGi;
   import package_11.IBundleActivator;
   import package_146.name_495;
   import package_54.name_102;
   import package_60.TextConst;
   import package_7.name_32;
   
   public class name_5 implements IBundleActivator
   {
      
      public static var osgi:OSGi;
       
      
      private var var_80:name_495;
      
      public function name_5()
      {
         super();
      }
      
      public function start(param1:OSGi) : void
      {
         name_5.osgi = param1;
         var _loc2_:name_32 = param1.getService(name_32) as name_32;
         this.var_80 = new name_495();
         _loc2_.add(this.var_80);
         TextConst.init(param1.getService(name_102) as name_102);
      }
      
      public function stop(param1:OSGi) : void
      {
         var _loc2_:name_32 = param1.getService(name_32) as name_32;
         _loc2_.remove(this.var_80.id);
         this.var_80 = null;
         name_5.osgi = null;
      }
   }
}
