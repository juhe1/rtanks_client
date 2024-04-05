package package_34
{
   import alternativa.osgi.OSGi;
   import package_11.name_522;
   
   public class BundleDumper implements class_3
   {
       
      
      private var osgi:OSGi;
      
      public function BundleDumper(param1:OSGi)
      {
         super();
         this.osgi = param1;
      }
      
      public function dump(param1:Vector.<String>) : String
      {
         var _loc2_:String = "\n";
         var _loc3_:Vector.<name_522> = this.osgi.method_124;
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_.length)
         {
            _loc2_ += "   bundle " + (_loc4_ + 1).toString() + ": " + _loc3_[_loc4_].name + "\n";
            _loc4_++;
         }
         return _loc2_ + "\n";
      }
      
      public function get dumperName() : String
      {
         return "bundle";
      }
   }
}
