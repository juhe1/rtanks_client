package alternativa.osgi.service.dump
{
   import alternativa.osgi.OSGi;
   import flash.utils.Dictionary;
   import package_34.class_3;
   
   public class DumpService implements name_524
   {
       
      
      public function DumpService(param1:OSGi)
      {
         super();
      }
      
      public function registerDumper(param1:class_3) : void
      {
      }
      
      public function unregisterDumper(param1:String) : void
      {
      }
      
      public function dump(param1:Vector.<String>) : String
      {
         return "dig bick";
      }
      
      public function get dumpers() : Dictionary
      {
         return new Dictionary();
      }
      
      public function get dumpersList() : Vector.<class_3>
      {
         return new Vector.<class_3>();
      }
   }
}
