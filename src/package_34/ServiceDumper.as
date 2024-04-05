package package_34
{
   import alternativa.osgi.OSGi;
   
   public class ServiceDumper implements class_3
   {
       
      
      private var osgi:OSGi;
      
      public function ServiceDumper(param1:OSGi)
      {
         super();
         this.osgi = param1;
      }
      
      public function dump(param1:Vector.<String>) : String
      {
         var _loc2_:String = "\n";
         var _loc3_:Vector.<Object> = this.osgi.method_122;
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_.length)
         {
            _loc2_ += "   service " + (_loc4_ + 1).toString() + ": " + _loc3_[_loc4_] + "\n";
            _loc4_++;
         }
         return _loc2_ + "\n";
      }
      
      public function get dumperName() : String
      {
         return "service";
      }
   }
}
