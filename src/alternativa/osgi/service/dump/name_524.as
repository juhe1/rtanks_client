package alternativa.osgi.service.dump
{
   import flash.utils.Dictionary;
   import package_34.class_3;
   
   public interface name_524
   {
       
      
      function registerDumper(param1:class_3) : void;
      
      function unregisterDumper(param1:String) : void;
      
      function dump(param1:Vector.<String>) : String;
      
      function get dumpers() : Dictionary;
      
      function get dumpersList() : Vector.<class_3>;
   }
}
