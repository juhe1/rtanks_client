package package_1
{
   import alternativa.osgi.OSGi;
   import package_11.name_23;
   import package_170.Image;
   import package_170.name_521;
   import package_54.name_102;
   
   public class name_8 implements name_23
   {
      
      public static var osgi:OSGi;
       
      
      public function name_8()
      {
         super();
      }
      
      public function start(param1:OSGi) : void
      {
         name_8.osgi = param1;
         name_521.init(param1.name_6(name_102) as name_102);
         Image.init(param1.name_6(name_102) as name_102);
      }
      
      public function stop(param1:OSGi) : void
      {
         name_8.osgi = null;
      }
   }
}
